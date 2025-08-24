<%-- 
    Document   : cancel
    Created on : 14 Aug 2025, 12:09:29 pm
    Author     : Arpita Sahu
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cancel Order</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            padding: 20px;
            text-align: center;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 8px;
            display: inline-block;
            box-shadow: 0px 0px 10px #ccc;
        }
        .btn {
            padding: 10px 20px;
            margin: 10px;
            text-decoration: none;
            color: white;
            border-radius: 5px;
        }
        .btn-confirm {
            background: #e74c3c;
        }
        .btn-cancel {
            background: #3498db;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Are you sure you want to cancel this order?</h2>
    <%
        String orderId = request.getParameter("id");
        if (orderId == null) {
            out.println("<p>Invalid order ID</p>");
        } else {
    %>
        <a class="btn btn-confirm" href="cancel-order?id=<%= orderId %>">Yes, Cancel Order</a>
        <a class="btn btn-cancel" href="orders.jsp">No, Go Back</a>
    <%
        }
    %>
</div>
</body>
</html>
