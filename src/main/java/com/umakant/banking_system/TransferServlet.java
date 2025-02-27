package com.umakant.banking_system;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.Objects;

@WebServlet(value = "/transaction")
public class TransferServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String receiverAccountNumber = req.getParameter("recipientAccount");
        int amount = Integer.parseInt(req.getParameter("amount"));
        String username = (String) req.getSession().getAttribute("username");

        String jdbcUrl = "jdbc:postgresql://localhost:32768/bank";
        String uname = "postgres";
        String password = "767985";
        String driverName = "org.postgresql.Driver";

        try{
            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection(jdbcUrl, uname, password);

            String query1 = "SELECT * FROM users WHERE username = ?";
            PreparedStatement preparedStatement1 = connection.prepareStatement(query1);
            preparedStatement1.setString(1, username);
            ResultSet resultSet1 = preparedStatement1.executeQuery();
            String senderAccountNumber = "";
            int sendersaccountBalance = 0;
            while (resultSet1.next()){
                senderAccountNumber = resultSet1.getString("accountnumber");
                sendersaccountBalance = resultSet1.getInt("amount");
            }

            if(req.getSession() == null){
                resp.getWriter().println("Please login first");
                return;
            }
            else {
                if(senderAccountNumber.equals(receiverAccountNumber)){
                    resp.getWriter().println("You cannot transfer to your own account");
                    return;
                }
                else {
                    if(amount <= 0){
                        resp.getWriter().println("Amount cannot be negative or zero");
                        return;
                    }
                    else{
                        String query = "SELECT * FROM users WHERE accountNumber = ?";
                        PreparedStatement preparedStatement = connection.prepareStatement(query);
                        preparedStatement.setString(1, receiverAccountNumber);
                        ResultSet resultSet = preparedStatement.executeQuery();
                        int receiversBalance = 0;

//                        PreparedStatement preparedStatement2 = connection.prepareStatement(query);
//                        preparedStatement2.setString(1, senderAccountNumber);
//                        ResultSet resultSet2 = preparedStatement2.executeQuery();

//                        if(!resultSet.next()){
//                            resp.getWriter().println("Recipient account does not exist");
//                            return;
//                        }
                        if (!resultSet.isBeforeFirst() ) {
                            resp.getWriter().println("Recipient account does not exist");
                            return;
                        }

                        while (resultSet.next()){
                            receiversBalance = resultSet.getInt("amount");
                        }
                        System.out.println("Senders Balance before: " + sendersaccountBalance);
                        System.out.println("receivers Balance before: " + receiversBalance);
                        sendersaccountBalance = sendersaccountBalance - amount;
                        receiversBalance = receiversBalance + amount;
                        System.out.println("Senders Balance: " + sendersaccountBalance);
                        System.out.println("Recievers balance: " + receiversBalance);

                        String queryUpdate = "UPDATE users SET amount = ? WHERE accountNumber = ?";
                        PreparedStatement ps = connection.prepareStatement(queryUpdate);
                        ps.setInt(1, sendersaccountBalance);
                        ps.setString(2, senderAccountNumber);
                        ps.executeUpdate();

                        PreparedStatement ps1 = connection.prepareStatement(queryUpdate);
                        ps1.setInt(1, receiversBalance);
                        ps1.setString(2, receiverAccountNumber);
                        ps1.executeUpdate();

                    }
                }
            }


//            String query1 = "SELECT * FROM users WHERE accountNumber = ?";
//
//            PreparedStatement preparedStatement1 = connection.prepareStatement(query1);
//            preparedStatement1.setString(1, senderAccountNumber);
//            ResultSet resultSet1 = preparedStatement1.executeQuery();
//            while(resultSet1.next()){
//                int amount1 = resultSet1.getInt("amount");
//                int amount2 = resultSet1.getInt("amount");
//                if(amount1 < amount){
//                    resp.getWriter().println("Insufficient balance");
//                    return;
//                }
//                else{
//                    amount1 = amount1 - amount;
//                    amount2 = amount2 + amount;
//                    String query3 = "UPDATE users SET amount = ? WHERE accountNumber = ?";
//                    PreparedStatement preparedStatement3 = connection.prepareStatement(query3);
//                    preparedStatement3.setInt(1, amount1);
//                    preparedStatement3.setString(2, senderAccountNumber);
//                    preparedStatement3.executeUpdate();
//                    String query2 = "UPDATE users SET amount = ? WHERE accountNumber = ?";
//                    PreparedStatement preparedStatement2 = connection.prepareStatement(query2);
//                    preparedStatement2.setInt(1, amount2);
//                    preparedStatement2.setString(2, receiverAccountNumber);
//                    preparedStatement2.executeUpdate();
//                }
//            }

        }
        catch (ClassNotFoundException e){
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
