<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%
    String senderAccount = (String) session.getAttribute("accountnumber");
    if (senderAccount == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String message = (String) request.getAttribute("message");
%>
<html>
<head>
    <title>Make Payment</title>
    <style>
        .payment-container {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 30px 270px;
        }

        h2 {
            color: #333;
        }

        form {
            background: white;
            padding: 20px;
            box-shadow: 0 0 10px #ccc;
            border-radius: 8px;
            max-width: 500px;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input[type="text"], input[type="number"], textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            margin-top: 20px;
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .message {
            margin-top: 20px;
            color: green;
        }

        .error {
            color: red;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="payment-container">
    <h2>Make a Payment</h2>

    <form action="process-payment" method="post">
        <input type="hidden" name="sender" value="<%= senderAccount %>">

        <label for="receiver">Receiver Account Number:</label>
        <input type="text" id="receiver" name="receiver" required>

        <label for="amount">Amount:</label>
        <input type="number" id="amount" name="amount" step="0.01" min="0.01" required>

        <label for="note">Note (Optional):</label>
        <textarea id="note" name="note" rows="3"></textarea>

        <input type="submit" value="Send Payment">
    </form>

    <% if (message != null) { %>
    <div class="<%= message.contains("successful") ? "message" : "error" %>">
        <%= message %>
    </div>
    <% } %>
</div>
</body>
</html>
