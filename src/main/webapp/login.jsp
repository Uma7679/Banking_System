<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login - ABC Bank</title>
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
      display: flex;
      justify-content: center;
      align-items: center;
      height: 80vh;
    }

    .login-box {
      background-color: white;
      padding: 40px;
      width: 400px;
      border-radius: 15px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
    }

    .login-box h2 {
      text-align: center;
      margin-bottom: 30px;
      color: #0056b3;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-group label {
      display: block;
      margin-bottom: 5px;
      color: #333;
    }

    .form-group input {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 16px;
    }

    .form-group input:focus {
      border-color: #0056b3;
      outline: none;
    }

    .btn {
      display: block;
      width: 100%;
      padding: 15px;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 5px;
      font-size: 18px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .btn:hover {
      background-color: #0056b3;
    }

    .error-message {
      color: red;
      text-align: center;
      margin-bottom: 15px;
    }

    footer {
      text-align: center;
      padding: 15px;
      background-color: #0056b3;
      color: white;
      margin-top: 30px;
    }
  </style>
</head>
<body>

<!-- Header -->
<header>
  <h1>Login to SBI Bank</h1>
</header>

<!-- Login Form -->
<div class="container">
  <div class="login-box">
    <h2>Login</h2>

    <!-- Error message from servlet (if login fails) -->
    <%
      String errorMessage = (String) request.getAttribute("errorMessage");
      if (errorMessage != null) {
    %>
    <div class="error-message">
      <%= errorMessage %>
    </div>
    <%
      }
    %>

    <!-- Login form -->
    <form action="/login" method="post">
      <div class="form-group">
        <label for="emailInput">Email:</label>
        <input type="email" id="emailInput" name="email" required>
      </div>

      <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
      </div>

      <button type="submit" class="btn">Login</button>

      <p> <% out.print(request.getAttribute("incorrect") == null ? "" : request.getAttribute("incorrect")); %> </p>
    </form>
  </div>
</div>

<!-- Footer -->
<footer>
  <p>&copy; 2024 ABC Bank. All Rights Reserved.</p>
</footer>

</body>
</html>
