package com.umakant.banking_system;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/process-payment")
public class ProcessPaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("accountnumber") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String sender = request.getParameter("sender");
        String receiver = request.getParameter("receiver");
        String note = request.getParameter("note");
        double amount = Double.parseDouble(request.getParameter("amount"));

        String jdbcUrl = "jdbc:postgresql://localhost:3268/bank";
        String dbUser = "postgres";
        String dbPass = "Uk767985";

        try (Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass)) {

            // Check receiver exists
            String checkReceiverSQL = "SELECT * FROM users WHERE accountnumber = ?";
            PreparedStatement psCheck = conn.prepareStatement(checkReceiverSQL);
            psCheck.setString(1, receiver);
            ResultSet rs = psCheck.executeQuery();
            if (!rs.next()) {
                request.setAttribute("message", "Receiver account does not exist.");
                request.getRequestDispatcher("payment.jsp").forward(request, response);
                return;
            }

            // Check sender has enough balance
            String getBalanceSQL = "SELECT amount FROM users WHERE accountnumber = ?";
            PreparedStatement psBalance = conn.prepareStatement(getBalanceSQL);
            psBalance.setString(1, sender);
            ResultSet rsBalance = psBalance.executeQuery();

            if (!rsBalance.next() || rsBalance.getDouble("amount") < amount) {
                request.setAttribute("message", "Insufficient balance.");
                request.getRequestDispatcher("payment.jsp").forward(request, response);
                return;
            }

            conn.setAutoCommit(false); // Start transaction

            // Insert into payments table
            String insertSQL = "INSERT INTO payments (sender_account, receiver_account, amount, note) VALUES (?, ?, ?, ?)";
            PreparedStatement psInsert = conn.prepareStatement(insertSQL);
            psInsert.setString(1, sender);
            psInsert.setString(2, receiver);
            psInsert.setDouble(3, amount);
            psInsert.setString(4, note);
            psInsert.executeUpdate();

            // Update sender balance
            String updateSenderSQL = "UPDATE users SET amount = amount - ? WHERE accountnumber = ?";
            PreparedStatement psSenderUpdate = conn.prepareStatement(updateSenderSQL);
            psSenderUpdate.setDouble(1, amount);
            psSenderUpdate.setString(2, sender);
            psSenderUpdate.executeUpdate();

            // Update receiver balance
            String updateReceiverSQL = "UPDATE users SET amount = amount + ? WHERE accountnumber = ?";
            PreparedStatement psReceiverUpdate = conn.prepareStatement(updateReceiverSQL);
            psReceiverUpdate.setDouble(1, amount);
            psReceiverUpdate.setString(2, receiver);
            psReceiverUpdate.executeUpdate();

            // Insert into transactions table for sender (debit)
            String debitTransaction = "INSERT INTO transactions (accountnumber, type, amount, description) VALUES (?, 'debit', ?, ?)";
            PreparedStatement psDebit = conn.prepareStatement(debitTransaction);
            psDebit.setString(1, sender);
            psDebit.setDouble(2, amount);
            psDebit.setString(3, "Transfer to " + receiver + ": " + note);
            psDebit.executeUpdate();

            // Insert into transactions table for receiver (credit)
            String creditTransaction = "INSERT INTO transactions (accountnumber, type, amount, description) VALUES (?, 'credit', ?, ?)";
            PreparedStatement psCredit = conn.prepareStatement(creditTransaction);
            psCredit.setString(1, receiver);
            psCredit.setDouble(2, amount);
            psCredit.setString(3, "Transfer from " + sender + ": " + note);
            psCredit.executeUpdate();

            conn.commit(); // Commit everything

            request.setAttribute("message", "Payment successful.");
            request.getRequestDispatcher("payment.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Error processing payment. Please try again.");
            request.getRequestDispatcher("payment.jsp").forward(request, response);
        }
    }
}
