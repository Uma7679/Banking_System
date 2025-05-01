package com.umakant.banking_system;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("accountnumber") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String accountNumber = (String) session.getAttribute("accountnumber");

        String url = "jdbc:postgresql://localhost:3268/bank";
        String user = "postgres";
        String pass = "Uk767985";

        try (Connection conn = DriverManager.getConnection(url, user, pass)) {
            String query = "SELECT name, amount FROM users WHERE accountnumber = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, accountNumber);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String name = rs.getString("name");
                String amount = rs.getString("amount");

                request.setAttribute("name", name);
                request.setAttribute("amount", amount);
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}


