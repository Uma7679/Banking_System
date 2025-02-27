<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%--<%@ taglib uri="jakarta.tags.fmt" prefix="c" %>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Banking Application</title>
    <style>
        /* Base styling for modern look */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7f6;
        }

        /* Header styling */
        header {
            background-color: #0056b3;
            padding: 20px;
            text-align: center;
            color: white;
            font-size: 24px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        /* Navigation bar */
        nav {
            display: flex;
            justify-content: space-between;
            background-color: #0047a3;
            padding: 10px 50px;
            align-items: center;
        }

        nav a {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            background-color: #0056b3;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        nav a:hover {
            background-color: #003d80;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 80vh;
            background-color: #f4f7f6;
            background-image: url('bank_banner.jpg'); /* Add your banner image here */
            background-size: cover;
            background-position: center;
        }

        .username{
            /*background-color: black;*/
            display: flex;
            justify-content: center;
            align-items: center;
            height: 1px;

            font-size: 18px;
            color: white;
            background-color: #007bff;
            padding: 14px 30px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
        }

        .content {
            text-align: center;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        .content h1 {
            font-size: 42px;
            color: #0056b3;
        }

        .content p {
            font-size: 18px;
            color: #333;
            margin-bottom: 30px;
        }

        .btn {
            font-size: 18px;
            color: white;
            background-color: #007bff;
            padding: 15px 30px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        footer {
            text-align: center;
            padding: 15px;
            background-color: #0056b3;
            color: white;
            margin-top: 30px;
        }

        /* Responsive design for mobile */
        @media (max-width: 768px) {
            .content {
                padding: 20px;
            }

            .content h1 {
                font-size: 32px;
            }

            .btn {
                font-size: 16px;
                padding: 10px 20px;
            }

            nav {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>

<!-- Header -->
<%--<h1><% out.print("Hello " + session.getAttribute("username")); %></h1>--%>
<header>
    <h1>Welcome to <% out.println(request.getAttribute("bankName")); %> Banking Application</h1>
</header>

<!-- Navigation Bar -->
<nav>
    <div>
        <a href="/">Home</a>
        <a href="about.jsp">About Us</a>
        <a href="services.jsp">Services</a>
    </div>
<%--    <%--%>
<%--        if(session.getAttribute("username") != null){--%>
<%--            out.println("<div class='username'>");--%>
<%--            out.println("<p>Hello....</p>" + session.getAttribute("username"));--%>
<%--            out.println("</div>");--%>
<%--        }--%>
<%--        else{--%>
<%--            out.println("<div>");--%>
<%--            out.println("<a href=\"login.jsp\">Login</a>");--%>
<%--            out.println("<a href=\"/signup\" class=\"btn\">Create Account</a>");--%>
<%--            out.println("</div>");--%>
<%--        }--%>
<%--    %>--%>
    <c:choose>
        <c:when test="${sessionScope.username != null}">
            <div class="username">
                <p>Hello...</p> ${sessionScope.username}
            </div>
        </c:when>
        <c:otherwise>
            <div>
                <a href="login.jsp">Login</a>
                <a href="/signup" class="btn">Create Account</a>
            </div>
        </c:otherwise>
    </c:choose>


    <c:if test="${sessionScope.username != null}">
        <div>
            <a href="/logout" class="btn">Logout</a>
        </div>
    </c:if>
</nav>

<!-- Main Content Section -->
<div class="container">
<%--    <%--%>
<%--        if(session.getAttribute("username") != null){--%>
<%--            out.println("<div class='content'>");--%>
<%--            out.println("<h1>Welcom Back</h1>");--%>
<%--            out.println("<p>Experience secure and reliable banking with SBI Bank. Manage your accounts, loans, and more.</p>");--%>
<%--            out.println("</div>");--%>

<%--//            out.print("Welcome Back");--%>
<%--        }--%>
<%--        else{--%>
<%--            out.println("<div class='content'>");--%>
<%--            out.println("<h1>Banking Made Simple</h1>");--%>
<%--            out.println("<p>Experience secure and reliable banking with SBI Bank. Manage your accounts, loans, and more.</p>");--%>
<%--            out.println("<a href=\"login\" class=\"btn\">Sign In</a>");--%>
<%--            out.println("<a href=\"/signup\" class=\"btn\" style=\"margin-left: 10px;\">Create Account</a>");--%>
<%--            out.println("</div>");--%>
<%--//            out.print("Login");--%>
<%--        }--%>
<%--    %>--%>
    <c:choose>
        <c:when test="${sessionScope.username != null}">
            <div class="content">
                <h1>Welcome Back</h1>
                <p>Experience secure and reliable banking with ${requestScope.bankName}. Manage your accounts, loans, and more.</p>
            </div>
        </c:when>
        <c:otherwise>
            <div class="content">
                <h1>Banking Made Simple</h1>
                <p>Experience secure and reliable banking with ${requestScope.bankName}. Manage your accounts, loans, and more.</p>
                <a href="login.jsp" class="btn">Sign In</a>
                <a href="/signup" class="btn" style="margin-left: 10px;">Create Account</a>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<!-- Footer -->
<footer>
    <p>&copy; 2024 ABC Bank. All Rights Reserved.</p>
</footer>

</body>
</html>
