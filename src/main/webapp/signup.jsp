<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Create Account - ABC Bank</title>
  <style>
    /* Basic page styling */
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f7f6;
    }

    /* Header styling */
    header {
      background-color: #0056b3;
      color: white;
      text-align: center;
      padding: 20px 0;
    }

    /* Form container */
    .container {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 80vh;
    }

    .signup-box {
      background-color: white;
      padding: 40px;
      width: 400px;
      border-radius: 15px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
    }

    .signup-box h2 {
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

    .form-group input,
    .form-group select {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 16px;
    }

    .form-group input:focus,
    .form-group select:focus {
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
  <h1>Create Account - SBI Bank</h1>
</header>

<!-- Sign-Up Form -->
<div class="container">
  <div class="signup-box">
    <h2>Create Your Account</h2>
    <form action="/signup_process" method="post">
      <div class="form-group">
        <label for="name">Full Name:</label>
        <input type="text" id="name" name="name" required>
      </div>

      <div class="form-group">
        <label for="emailInput">Email:</label>
        <input type="email" id="emailInput" name="email"
               pattern="^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$"
               oninvalid="this.setCustomValidity('Enter a valid email address (e.g., user@example.com)')"
               oninput="this.setCustomValidity('')"
               required>

      </div>

      <div class="form-group">
        <label for="password">Create Password:</label>
        <input type="password" id="password" name="password" required
               pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=!]).{8,}$"
               title="Must be at least 8 characters and include uppercase, lowercase, number, and special character (@#$%^&+=!)">
      </div>

      <div class="form-group">
        <label for="address">Address:</label>
        <input type="text" id="address" name="address"
               pattern="^[A-Za-z0-9 ,./#\\-]{5,100}$"
               oninvalid="this.setCustomValidity('Address must be 5–100 characters and can include letters, numbers, commas, periods, slashes, and hyphens')"
               oninput="this.setCustomValidity('')"
               required>
      </div>

      <div class="form-group">
        <label for="phone">Phone Number:</label>
        <input type="tel" id="phone" name="phone"
               pattern="^[0-9]{10}$"
               oninvalid="this.setCustomValidity('Phone number must be exactly 10 digits')"
               oninput="this.setCustomValidity('')"
               required>

      </div>

      <div class="form-group">
        <label for="age">Age:</label>
        <input type="number" id="age" name="age" min="18" required>
      </div>

      <div class="form-group">
        <label for="accountType">Type of Account:</label>
        <select id="accountType" name="accountType" required>
          <option value="savings">Savings</option>
          <option value="current">Current</option>
          <option value="fixed">Fixed Deposit</option>
        </select>
      </div>

      <button type="submit" class="btn">Create Account</button>
    </form>
  </div>
</div>

<!-- Footer -->
<footer>
  <p>&copy; 2024 ABC Bank. All Rights Reserved.</p>
</footer>

</body>
</html>
