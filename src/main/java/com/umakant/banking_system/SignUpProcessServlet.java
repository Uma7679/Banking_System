package com.umakant.banking_system;

import com.umakant.banking_system.beans.Userbean;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.postgresql.Driver;

import java.io.IOException;
import java.sql.*;

@WebServlet(value = "/signup_process")
public class SignUpProcessServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = (String) req.getParameter("name");
        String email = (String) req.getParameter("email");
        String password = (String) req.getParameter("password");
        String address = (String) req.getParameter("address");
        String phone = (String) req.getParameter("phone");
        Integer age = Integer.parseInt((String) req.getParameter("age"));
        String accountType = (String) req.getParameter("accountType");

        try {
            age = Integer.parseInt(req.getParameter("age"));
            if (age < 18) {
                throw new IllegalArgumentException("Age must be at least 18.");
            }
        } catch (IllegalArgumentException e) {
            req.setAttribute("msg", "Invalid age: must be a number ≥ 18.");
            req.getRequestDispatcher("/signup.jsp").forward(req, resp);
            return;
        }

        Userbean userbean = new Userbean();
        try {
            userbean.setName(name);
            userbean.setEmail(email);
            userbean.setPassword(password);
            userbean.setAddress(address);
            userbean.setPhone(phone);
        } catch (RuntimeException e) {
            // Validation failed in bean (email, name, password, etc.)
            req.setAttribute("msg", "Validation error: " + e.getMessage());
            req.getRequestDispatcher("/signup.jsp").forward(req, resp);
            return;
        }

        String accountNumber = email.replaceAll("[^A-Za-z0-9]", "")
                .substring(0, Math.min(4, email.length()))
                + ((int)(Math.random() * 9000 + 1000)); // random 4-digit


//        Userbean userbean = new Userbean();
//        userbean.setName(name);
//        userbean.setEmail(email);
//        userbean.setPassword(password);
//        userbean.setAddress(address);
//        userbean.setPhone(phone);
//
//        String tempNumber = String.valueOf((int) (Math.random()*100 + 1));
//        String accountNumber = email.substring(0,4)+tempNumber;

        String jdbcUrl = "jdbc:postgresql://localhost:3268/bank";
        String uname = "postgres";
        String pword = "Uk767985";
        String driverName = "org.postgresql.Driver";

        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection(jdbcUrl, uname, pword);
//            Statement statement = connection.createStatement();
//            String s = name + "," + email + "," + password + "," + address + "," + phone + "," + age + "," + accountType + "," + accountNumber + ")";
            String query = "INSERT INTO users(name, email, password, address, phone, age, accountType, accountNumber, amount) VALUES(?,?,?,?,?,?,?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, password);
            preparedStatement.setString(4, address);
            preparedStatement.setString(5, phone);
            preparedStatement.setString(6, String.valueOf(age));
            preparedStatement.setString(7, accountType);
            preparedStatement.setString(8, accountNumber);
            preparedStatement.setInt(9, 0);

            int res = preparedStatement.executeUpdate();

            if (res == 1) {
                // Set session and redirect
                HttpSession session = req.getSession();
                session.setAttribute("email", email);
                resp.sendRedirect("/home.jsp"); // Or /welcome.jsp
            } else {
                req.setAttribute("msg", "Account creation failed. Try again.");
                req.getRequestDispatcher("/signup.jsp").forward(req, resp);
            }

            connection.close();
//            String message = "Failed";
//            if(res == 1){
//                message = "Successful";
//            }
//
//            req.setAttribute("msg", message);
//            HttpSession session = req.getSession();
//            session.setAttribute("email", email);
//            RequestDispatcher rd = req.getRequestDispatcher("/");
//            rd.forward(req, resp);
//            resp.sendRedirect("/");

        }
        catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        catch (SQLException e) {
//            req.setAttribute("msg", "Database error: " + e.getMessage());
//            req.getRequestDispatcher("/signup.jsp").forward(req, resp);
            req.setAttribute("msg", "Database error: " + e.getMessage());
            req.getRequestDispatcher("/signup.jsp").forward(req, resp);
            throw new RuntimeException(e);
        }
    }
}
