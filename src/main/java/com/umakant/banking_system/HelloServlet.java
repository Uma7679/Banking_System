package com.umakant.banking_system;

import java.io.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet( value = "/")
public class HelloServlet extends HttpServlet {
    private String message;
    public int[] arr;

    public void init() {
        message = "Hello World!, This is Umakant";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        request.setAttribute("bankName", "sbi");


        RequestDispatcher rd = request.getRequestDispatcher("/homePage.jsp");
        rd.include(request, response);
        rd.forward(request, response);
    }

    public void destroy() {
    }
}