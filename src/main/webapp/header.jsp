<%--
  Created by IntelliJ IDEA.
  User: uk240
  Date: 10-04-2025
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<html>
<head>
    <title>Title</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            display: flex;
            min-height: 100vh;
            flex-direction: column;
            background-color: #f4f4f4;
        }

        /* Navbar Styles */
        .navbar {
            background-color: #007bff;
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-size: 18px;
        }

        .navbar a:hover {
            text-decoration: underline;
        }

        /* Sidebar Styles */
        .sidebar {
            background-color: #343a40;
            color: white;
            position: fixed;
            top: 0;
            left: 0;
            width: 250px;
            height: 100%;
            padding-top: 20px;
            transition: 0.3s;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            padding: 12px 20px;
            display: block;
            font-size: 18px;
        }

        .sidebar a:hover {
            background-color: #495057;
        }
    </style>
</head>
<body>
<div class="navbar">
    <div class="logo">MyBank</div>
    <div>
        <a href="home.jsp">Home</a>
        <a href="#">Accounts</a>
        <a href="transactions.jsp">Transactions</a>
        <a href="profile.jsp">Profile</a>
        <a href="logout">Log Out</a>
    </div>
</div>

<!-- Sidebar -->
<div class="sidebar">
    <a href="home.jsp">Dashboard</a>
    <a href="payment.jsp">Pay</a>
    <a href="bills&payments.jsp">Bills & Payments</a>
    <a href="#">Loans</a>
    <a href="support.jsp">Support</a>
</div>
</body>
</html>
