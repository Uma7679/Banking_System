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

@WebServlet(value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = (String) req.getParameter("username");
        String password = (String) req.getParameter("password");

        HttpSession session = req.getSession();

        String jdbcUrl = "jdbc:postgresql://localhost:32768/bank";
        String uname = "postgres";
        String pass = "767985";
        String driverName = "org.postgresql.Driver";

        try {
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection(jdbcUrl, uname, pass);
//            Statement st = con.createStatement();

//            String query = "Select * from users";
            String query = "Select * from users where username = ? AND password = ?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, username);
            p.setString(2, password);

            ResultSet rs = p.executeQuery();
            System.out.println("username\t\tpassword");
//            String name1 = rs.getString("username");
//            String pass1 = rs.getString("password");
            String name1 = "";
            String pass1 = "";
            while(rs.next()){
                name1 = rs.getString("username");
                pass1 = rs.getString("password");
                System.out.println(name1 + "\t\t" + pass1);
            }
//            RequestDispatcher rd = req.getRequestDispatcher("/");
            RequestDispatcher rd1 = req.getRequestDispatcher("/login.jsp");
            if(username.equals(name1) && password.equals(pass1)){
                session.setAttribute("username", username);
//                String name = (String) session.getAttribute("username");
                resp.sendRedirect("/");
//                rd.forward(req, resp);
            }
            else{
                String message = "incorrect Username or password";
                req.setAttribute("incorrect", message);
                rd1.forward(req,resp);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }
}
