<%@ page import="java.sql.*, java.util.*" %>
<%@ page session="true" %>
<%
    String accountNumber = (String) session.getAttribute("accountnumber");
    if (accountNumber == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Map<String, String>> transactions = new ArrayList<>();

    try {
        Class.forName("org.postgresql.Driver");
        String url = "jdbc:postgresql://localhost:3268/bank";
        String user = "postgres";
        String pass = "Uk767985";
        Connection conn = DriverManager.getConnection(url, user, pass);

        String query = "SELECT type, amount, description, date FROM transactions WHERE accountnumber = ? ORDER BY date DESC";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, accountNumber);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Map<String, String> map = new HashMap<>();
            map.put("type", rs.getString("type"));
            map.put("amount", rs.getString("amount"));
            map.put("description", rs.getString("description"));
            map.put("date", rs.getString("date"));
            transactions.add(map);
        }

        rs.close();
        ps.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Transaction History</title>
    <style>
        .transaction-container {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f7f9fc;
            padding: 60px 280px;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
        }

        th, td {
            padding: 14px 20px;
            border-bottom: 1px solid #eaeaea;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .credit {
            color: green;
            font-weight: bold;
        }

        .debit {
            color: red;
            font-weight: bold;
        }

        .no-data {
            padding: 20px;
            text-align: center;
            color: gray;
        }
    </style>
</head>
<body>

<jsp:include page="header.jsp"/>
<div class="transaction-container">
    <h2>Your Transaction History</h2>

    <%
        if (transactions.isEmpty()) {
    %>
    <div class="no-data">No transactions to show.</div>
    <%
    } else {
    %>
    <table>
        <tr>
            <th>Type</th>
            <th>Amount (Rs)</th>
            <th>Description</th>
            <th>Date</th>
        </tr>
        <%
            for (Map<String, String> txn : transactions) {
                String type = txn.get("type");
        %>
        <tr>
            <td class="<%= type %>"><%= type.substring(0, 1).toUpperCase() + type.substring(1) %>
            </td>
            <td><%= txn.get("amount") %>
            </td>
            <td><%= txn.get("description") %>
            </td>
            <td><%= txn.get("date") %>
            </td>
        </tr>
        <% } %>
    </table>
    <%
        }
    %>
</div>
</body>
</html>
