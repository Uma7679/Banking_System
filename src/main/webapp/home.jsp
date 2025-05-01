<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
    <style>

        .main-content {
            margin-left: 250px;
            padding: 20px;
            flex-grow: 1;
            background-color: #fff;
        }
        .hero {
            background-color: #007bff;
            color: white;
            padding: 50px 20px;
            text-align: center;
        }
        .hero h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
        }
        .hero p {
            font-size: 1.2rem;
        }
        .account-info {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .account-info div {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            flex: 1;
            margin-right: 20px;
            text-align: center;
        }
        .account-info div:last-child {
            margin-right: 0;
        }
        .account-info h2 {
            margin-bottom: 10px;
        }
        .account-info p {
            font-size: 1.2rem;
        }
        .services {
            display: flex;
            justify-content: space-around;
            margin-top: 40px;
        }
        .service-card {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            flex: 1;
            margin: 0 10px;
        }
        .service-card h3 {
            margin-bottom: 10px;
        }
        .service-card p {
            font-size: 1rem;
        }
        .footer {
            background-color: #343a40;
            color: white;
            padding: 20px 0;
            text-align: center;
            margin-top: auto;
        }
        .footer a {
            color: #007bff;
            text-decoration: none;
            margin: 0 5px;
        }
        .footer a:hover {
            text-decoration: underline;
        }
        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
            }

            .main-content {
                margin-left: 200px;
            }

            .account-info {
                flex-direction: column;
            }

            .account-info div {
                margin-bottom: 20px;
            }

            .services {
                flex-direction: column;
            }

            .service-card {
                margin-bottom: 20px;
            }
        }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>
<!-- Main Content Area -->
<div class="main-content">
    <!-- Hero Section -->
    <div class="hero">
        <h1>Welcome ${name}</h1>
        <p>Your trusted partner in managing finances, with a range of banking services designed to meet your needs.</p>
    </div>

    <!-- Account Information Section -->
    <div class="account-info">
        <div>
            <h2>Account Balance</h2>
<%--            <p>$12,345.67</p>--%>
            <p>Rs ${amount}</p>
        </div>
        <div>
            <h2>Recent Transactions</h2>
            <p>View your latest transactions</p>
        </div>
        <div>
            <h2>Loan Status</h2>
            <p>Check your loan details</p>
        </div>
    </div>

    <!-- Services Section -->
    <div class="services">
        <div class="service-card">
            <h3>Fund Transfer</h3>
            <p>Send money to others in a few clicks.</p>
        </div>
        <div class="service-card">
            <h3>Bill Payments</h3>
            <p>Pay your bills easily through MyBank.</p>
        </div>
        <div class="service-card">
            <h3>Investments</h3>
            <p>Explore investment opportunities to grow your wealth.</p>
        </div>
    </div>
</div>

<!-- Footer -->
<div class="footer">
    <p>&copy; 2025 SBI. All Rights Reserved.</p>
    <div>
        <a href="#">Privacy Policy</a> |
        <a href="#">Terms of Service</a>
    </div>
</div>

</body>
</html>

