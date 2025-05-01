<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%
  String name = (String) session.getAttribute("name");
  String email = (String) session.getAttribute("email");
  String accountNumber = (String) session.getAttribute("accountnumber");
  String amount = (String) session.getAttribute("amount");

  if (accountNumber == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>
<html>
<head>
  <title>Profile</title>
  <style>
    /*.profile-container {*/
    /*  font-family: Arial, sans-serif;*/
    /*  background-color: #f4f4f4;*/
    /*  padding: 40px 270px;*/
    /*}*/
    .profile-container-outer{
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .profile-container {
      background: white;
      padding: 25px 40px;
      border-radius: 10px;
      box-shadow: 0 0 10px #ccc;
      max-width: 600px;
    }

    h2 {
      margin-bottom: 20px;
      color: #333;
    }

    .profile-row {
      margin-bottom: 15px;
    }

    .profile-label {
      font-weight: bold;
      display: inline-block;
      width: 150px;
    }

    .profile-value {
      display: inline-block;
      color: #555;
    }

    .edit-button {
      margin-top: 20px;
      background-color: #007bff;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      text-decoration: none;
      display: inline-block;
    }

    .edit-button:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>

<jsp:include page="header.jsp"/>
<div class="profile-container-outer">
  <div class="profile-container">
    <h2>User Profile</h2>

    <div class="profile-row">
      <span class="profile-label">Name:</span>
      <span class="profile-value"><%= name %></span>
    </div>

    <div class="profile-row">
      <span class="profile-label">Email:</span>
      <span class="profile-value"><%= email %></span>
    </div>

    <div class="profile-row">
      <span class="profile-label">Account Number:</span>
      <span class="profile-value"><%= accountNumber %></span>
    </div>

    <div class="profile-row">
      <span class="profile-label">Balance:</span>
      <span class="profile-value">Rs<%= amount %></span>
    </div>

    <!-- Optional edit button -->
    <a href="edit-profile.jsp" class="edit-button">Edit Profile</a>
  </div>
</div>



</body>
</html>
