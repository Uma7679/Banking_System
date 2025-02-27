package com.umakant.banking_system;

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
        String username = (String) req.getParameter("username");
        String password = (String) req.getParameter("password");
        String address = (String) req.getParameter("address");
        String phone = (String) req.getParameter("phone");
        Integer age = Integer.parseInt((String) req.getParameter("age"));
        String accountType = (String) req.getParameter("accountType");

        String tempNumber = String.valueOf((int) (Math.random()*100 + 1));
        String accountNumber = username.substring(0,4)+tempNumber;

        String jdbcUrl = "jdbc:postgresql://localhost:32768/bank";
        String uname = "postgres";
        String pword = "767985";
        String driverName = "org.postgresql.Driver";

        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection(jdbcUrl, uname, pword);
//            Statement statement = connection.createStatement();
//            String s = name + "," + username + "," + password + "," + address + "," + phone + "," + age + "," + accountType + "," + accountNumber + ")";
            String query = "INSERT INTO users(name, username, password, address, phone, age, accountType, accountNumber, amount) VALUES(?,?,?,?,?,?,?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, username);
            preparedStatement.setString(3, password);
            preparedStatement.setString(4, address);
            preparedStatement.setString(5, phone);
            preparedStatement.setString(6, String.valueOf(age));
            preparedStatement.setString(7, accountType);
            preparedStatement.setString(8, accountNumber);
            preparedStatement.setInt(9, 0);

            int res = preparedStatement.executeUpdate();

            connection.close();
            String message = "Failed";
            if(res == 1){
                message = "Successful";
            }

            req.setAttribute("msg", message);
            HttpSession session = req.getSession();
            session.setAttribute("username", username);
//            RequestDispatcher rd = req.getRequestDispatcher("/");
//            rd.forward(req, resp);
            resp.sendRedirect("/");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
