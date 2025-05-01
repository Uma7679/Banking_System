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
        String email = (String) req.getParameter("email");
        String password = (String) req.getParameter("password");

        HttpSession session = req.getSession();

        String jdbcUrl = "jdbc:postgresql://localhost:3268/bank";
        String uname = "postgres";
        String pass = "Uk767985";
        String driverName = "org.postgresql.Driver";

        try {
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection(jdbcUrl, uname, pass);
            String query = "Select * from users where email = ? AND password = ?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, email);
            p.setString(2, password);

            ResultSet rs = p.executeQuery();
//            System.out.println("email\t\tpassword");
//            String name1 = "";
//            String pass1 = "";
//            while(rs.next()){
//                name1 = rs.getString("email");
//                pass1 = rs.getString("password");
//                System.out.println(name1 + "\t\t" + pass1);
//            }
//            RequestDispatcher rd1 = req.getRequestDispatcher("/login.jsp");
//            if(email.equals(name1) && password.equals(pass1)){
//                session.setAttribute("email", email);
//                resp.sendRedirect("/home.jsp");
//            }
//            else{
//                String message = "incorrect email or password";
//                req.setAttribute("incorrect", message);
//                rd1.forward(req,resp);
//            }

            if (rs.next()) {
                // Save user info to session
                session.setAttribute("email", rs.getString("email"));
                session.setAttribute("name", rs.getString("name"));
                session.setAttribute("accountnumber", rs.getString("accountnumber"));
                session.setAttribute("amount", rs.getString("amount")); // balance

                // Redirect to HomeServlet
                resp.sendRedirect("home");
            } else {
                // Invalid login
                req.setAttribute("incorrect", "Incorrect email or password");
                RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
                rd.forward(req, resp);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }
}
