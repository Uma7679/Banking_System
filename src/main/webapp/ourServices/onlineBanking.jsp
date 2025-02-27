<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transfer Money - Online Banking</title>
    <style>
        /* Basic styling for the transfer page */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: auto;
            padding: 2rem;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        h2 {
            color: #007bff;
            text-align: center;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin: 1rem 0 0.5rem;
            font-weight: bold;
        }
        input[type="text"], input[type="number"] {
            padding: 0.5rem;
            font-size: 1rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 100%;
        }
        textarea {
            padding: 0.5rem;
            font-size: 1rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            resize: vertical;
            width: 100%;
        }
        .button {
            padding: 0.75rem;
            font-size: 1rem;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 1rem;
            text-align: center;
        }
        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Transfer Money</h2>
    <form action="/transaction" method="post">
        <!-- Sender Account Info (could also be displayed as non-editable for logged-in user) -->
<%--        <c:if test="${sessionScope != null}">--%>
<%--            <h1>${sessionScope.username}</h1>--%>
<%--        </c:if>--%>

        <c:choose>
            <c:when test="${sessionScope.username != null}">
                <div>
                    <p>Hello... ${sessionScope.username}</p>
                    <label for="recipientAccount">Recipient Account Number</label>
                    <input type="text" id="recipientAccount" name="recipientAccount" placeholder="Enter recipient account number" required>

                    <!-- Amount to Transfer -->
                    <label for="amount">Amount</label>
                    <input type="number" id="amount" name="amount" placeholder="Enter amount to transfer" step="0.01" required>

                    <!-- Optional Note -->
                    <label for="note">Note (optional)</label>
                    <textarea id="note" name="note" rows="3" placeholder="Add a note for the recipient (optional)"></textarea>

                    <!-- Submit Button -->
                    <button type="submit" class="button">Transfer</button>
                </div>
            </c:when>
            <c:otherwise>
                <div>
                    <a href="login.jsp">Login</a>
                    <a href="/signup" class="btn">Create Account</a>
                </div>
            </c:otherwise>
        </c:choose>

        <!-- Recipient Account Info -->
    </form>
</div>

</body>
</html>

