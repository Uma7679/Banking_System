<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Our Services - ABC Bank</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f7f6;
    }

    header {
      background-color: #0056b3;
      color: white;
      text-align: center;
      padding: 20px 0;
    }

    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 20px;
    }

    h2 {
      text-align: center;
      color: #0056b3;
      margin-bottom: 40px;
    }

    .service-list {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-around;
    }

    .service-item {
      background-color: white;
      padding: 30px;
      width: 300px;
      margin: 15px;
      border-radius: 15px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
      text-align: center;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .service-item:hover {
      transform: translateY(-5px);
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
    }

    .service-item h3 {
      color: #0056b3;
      margin-bottom: 15px;
    }

    .service-item p {
      color: #333;
      margin-bottom: 20px;
    }

    .btn {
      display: inline-block;
      padding: 10px 20px;
      background-color: #007bff;
      color: white;
      text-decoration: none;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }

    .btn:hover {
      background-color: #0056b3;
    }

    footer {
      text-align: center;
      padding: 20px;
      background-color: #0056b3;
      color: white;
      margin-top: 40px;
    }
  </style>
</head>
<body>

<!-- Header -->
<header>
  <h1>Our Services</h1>
</header>

<!-- Services Section -->
<div class="container">
  <h2>Banking Services We Offer</h2>

  <div class="service-list">
    <div class="service-item">
      <h3>Account Management</h3>
      <p>Manage your savings, current, and fixed deposit accounts with ease through our user-friendly platform.</p>
      <a href="account.jsp" class="btn">Learn More</a>
    </div>

    <div class="service-item">
      <h3>Loans & Mortgages</h3>
      <p>Get the best loan offers for your needs, whether it's personal, home, or business loans at competitive rates.</p>
      <a href="loans.jsp" class="btn">Learn More</a>
    </div>

    <div class="service-item">
      <h3>Online Banking</h3>
      <p>Access your accounts 24/7 with our secure and fast online banking services, including fund transfers and bill payments.</p>
      <a href="/ourServices/onlineBanking.jsp" class="btn">Learn More</a>
    </div>

    <div class="service-item">
      <h3>Credit Cards</h3>
      <p>Choose from a variety of credit card options, with rewards, cashback, and low-interest rates tailored to your needs.</p>
      <a href="creditcards.jsp" class="btn">Learn More</a>
    </div>

    <div class="service-item">
      <h3>Investment Solutions</h3>
      <p>Grow your wealth with our personalized investment strategies, including mutual funds, bonds, and equity plans.</p>
      <a href="investments.jsp" class="btn">Learn More</a>
    </div>

    <div class="service-item">
      <h3>Customer Support</h3>
      <p>Get 24/7 support for any banking-related issues. Our dedicated customer care team is always ready to help.</p>
      <a href="support.jsp" class="btn">Contact Us</a>
    </div>
  </div>
</div>

<!-- Footer -->
<footer>
  <p>&copy; 2024 ABC Bank. All Rights Reserved.</p>
</footer>

</body>
</html>
