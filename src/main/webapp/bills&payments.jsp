<%@ page import="java.sql.*, java.util.*" %>
<%@ page session="true" %>
<%
  String accountNumber = (String) session.getAttribute("accountnumber");
  if (accountNumber == null) {
    response.sendRedirect("login.jsp");
    return;
  }

  String url = "jdbc:postgresql://localhost:3268/bank";
  String dbUser = "postgres";
  String dbPass = "Uk767985";

  List<Map<String, String>> bills = new ArrayList<>();

  try {
    Class.forName("org.postgresql.Driver");
    Connection conn = DriverManager.getConnection(url, dbUser, dbPass);

    String sql = "SELECT * FROM bills WHERE accountnumber = ? AND status = 'unpaid'";
    PreparedStatement ps = conn.prepareStatement(sql);
    ps.setString(1, accountNumber);
    ResultSet rs = ps.executeQuery();

    while (rs.next()) {
      Map<String, String> bill = new HashMap<>();
      bill.put("id", rs.getString("id"));
      bill.put("bill_name", rs.getString("bill_name"));
      bill.put("amount", rs.getString("amount"));
      bill.put("due_date", rs.getString("due_date"));
      bills.add(bill);
    }

    conn.close();
  } catch (Exception e) {
    e.printStackTrace();
  }
%>

<jsp:include page="header.jsp" />

<style>
  body {
    background-color: #f4f4f4;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  }

  .container {
    margin-left: 260px;
    padding: 30px;
  }

  h2 {
    margin-bottom: 20px;
    color: #333;
  }

  table {
    width: 100%;
    border-collapse: collapse;
    background-color: #ffffff;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
  }

  th, td {
    padding: 12px 15px;
    text-align: left;
    border-bottom: 1px solid #ddd;
  }

  th {
    background-color: #007bff;
    color: white;
    font-size: 16px;
  }

  tr:hover {
    background-color: #f1f1f1;
  }

  .pay-button {
    background-color: #28a745;
    color: white;
    border: none;
    padding: 6px 14px;
    border-radius: 4px;
    cursor: pointer;
  }

  .pay-button:hover {
    background-color: #218838;
  }

  .no-bills {
    text-align: center;
    padding: 20px;
    color: #555;
    font-style: italic;
  }
</style>

<div class="container">
  <h2>Unpaid Bills</h2>
  <table>
    <tr>
      <th>Bill Name</th>
      <th>Amount (Rs)</th>
      <th>Due Date</th>
      <th>Status</th>
      <th>Action</th>
    </tr>
    <%
      for (Map<String, String> bill : bills) {
    %>
    <tr>
      <td><%= bill.get("bill_name") %></td>
      <td><%= bill.get("amount") %></td>
      <td><%= bill.get("due_date") %></td>
      <td>Unpaid</td>
      <td>
        <form action="payBill" method="post">
          <input type="hidden" name="billId" value="<%= bill.get("id") %>" />
          <input type="hidden" name="amount" value="<%= bill.get("amount") %>" />
          <input type="submit" class="pay-button" value="Pay Now" />
        </form>
      </td>
    </tr>
    <%
      }
      if (bills.isEmpty()) {
    %>
    <tr>
      <td colspan="5" class="no-bills">No unpaid bills found!</td>
    </tr>
    <%
      }
    %>
  </table>
</div>
