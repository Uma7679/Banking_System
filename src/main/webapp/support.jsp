<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    if (session == null || session.getAttribute("accountnumber") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Support | MyBank</title>
    <style>
        .support-container {
            font-family: Arial, sans-serif;
            margin-left: 250px;
            background-color: #f4f4f4;
            padding: 40px;
        }

        .container {
            max-width: 600px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            margin-bottom: 20px;
            color: #007bff;
        }

        label {
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        textarea {
            resize: vertical;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .message {
            color: green;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

<jsp:include page="header.jsp"/>

<div class="support-container">


    <div class="container">
        <h2>Customer Support</h2>

        <form action="support" method="post">
            <label for="email">Your Email:</label>
            <input type="email" id="email" name="email" required value="<%= session.getAttribute("email") %>">

            <label for="subject">Subject:</label>
            <input type="text" id="subject" name="subject" required>

            <label for="message">Message:</label>
            <textarea id="message" name="message" rows="6" required></textarea>

            <input type="submit" value="Submit">
        </form>

        <%
            String status = (String) request.getAttribute("status");
            if (status != null) {
        %>
        <p class="message"><%= status %>
        </p>
        <% } %>
    </div>
</div>
</body>
</html>
