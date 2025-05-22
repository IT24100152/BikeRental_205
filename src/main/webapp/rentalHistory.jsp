<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bikerental.rental.model.Rental" %>

<html>
<head>
    <title>Rental History</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: #3498db;
            overflow: hidden;
            padding: 10px 0;
            text-align: center;
        }

        .navbar a {
            color: white;
            padding: 14px 20px;
            text-decoration: none;
            display: inline-block;
        }

        .navbar a:hover {
            background-color: #2980b9;
        }

        .container {
            max-width: 1000px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ccc;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        a {
            color: #3498db;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="navbar">
    <a href="index.jsp">Home</a>
    <a href="rentalBike.jsp">New Rental</a>
    <a href="rentalHistory">Rental History</a>
</div>

<div class="container">
    <h2>Rental History</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>User ID</th>
            <th>Bike ID</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>

        <%
            List<Rental> rentals = (List<Rental>) request.getAttribute("rentals");
            if (rentals != null && !rentals.isEmpty()) {
                for (Rental r : rentals) {
        %>
        <tr>
            <td><%= r.getId() %></td>
            <td><%= r.getUserId() %></td>
            <td><%= r.getBikeId() %></td>
            <td><%= r.getStartDate() %></td>
            <td><%= r.getEndDate() %></td>
            <td><%= r.getStatus() %></td>
            <td>
                <a href="editRental.jsp?id=<%= r.getId() %>">Edit</a> |
                <a href="deleteRental?id=<%= r.getId() %>" onclick="return confirm('Cancel this rental?')">Delete</a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="7">No rental records found.</td>
        </tr>
        <%
            }
        %>
    </table>
</div>

</body>
</html>


