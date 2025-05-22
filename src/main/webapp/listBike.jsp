<%@ page import="com.bikerental.bikes.model.Bike" %>
<%@ page import="com.bikerental.bikes.model.ElectricBike" %>
<%@ page import="com.bikerental.bikes.model.StandardBike" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Bike List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #f9f9f9;
        }

        .navbar {
            background-color: #343a40;
            padding: 10px 20px;
            display: flex;
            justify-content: flex-end;
            align-items: center;
        }

        .navbar .add-bike-btn {
            background-color: #6f42c1; /* Purple */
            color: white;
            padding: 8px 14px;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            font-size: 14px;
            cursor: pointer;
        }

        .navbar .add-bike-btn:hover {
            background-color: #5a32a3;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-top: 20px;
        }

        .message {
            text-align: center;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .success {
            color: green;
        }

        .error {
            color: red;
        }

        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        a.action-button {
            padding: 4px 8px;
            border-radius: 4px;
            text-decoration: none;
            font-size: 12px;
            cursor: pointer;
        }

        .edit-button {
            background-color: #28a745;
            color: white;
        }

        .edit-button:hover {
            background-color: #218838;
        }

        .delete-button {
            background-color: #dc3545;
            color: white;
        }

        .delete-button:hover {
            background-color: #c82333;
        }

        .status-btn {
            padding: 4px 8px;
            border-radius: 12px;
            color: white;
            font-weight: bold;
            font-size: 12px;
            display: inline-block;
        }

        .status-available {
            background-color: #28a745; /* green */
        }

        .status-maintenance {
            background-color: #dc3545; /* red */
        }

        .status-rented {
            background-color: #ffc107; /* yellow */
            color: black;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <a href="addBike.jsp" class="add-bike-btn">Add New Bike</a>
</div>

<h2>Bike List</h2>

<%
    String success = (String) session.getAttribute("success");
    String error = (String) session.getAttribute("error");

    if (success != null) {
%>
<div class="message success"><%= success %></div>
<%
        session.removeAttribute("success");
    }

    if (error != null) {
%>
<div class="message error"><%= error %></div>
<%
        session.removeAttribute("error");
    }
%>

<table>
    <tr>
        <th>ID</th>
        <th>Model</th>
        <th>Status</th>
        <th>Location</th>
        <th>Price per Hour</th>
        <th>Bike Type</th>
        <th>Details</th>
        <th>Actions</th>
    </tr>
    <%
        List<Bike> bikes = (List<Bike>) request.getAttribute("bikes");
        if (bikes != null && !bikes.isEmpty()) {
            for (Bike bike : bikes) {
    %>
    <tr>
        <td><%= bike.getId() %></td>
        <td><%= bike.getModel() %></td>
        <td>
            <%
                String status = bike.getStatus();
                String statusClass = "";
                if ("Available".equalsIgnoreCase(status)) {
                    statusClass = "status-available";
                } else if ("Under Maintenance".equalsIgnoreCase(status)) {
                    statusClass = "status-maintenance";
                } else if ("Rented".equalsIgnoreCase(status)) {
                    statusClass = "status-rented";
                }
            %>
            <span class="status-btn <%= statusClass %>"><%= status %></span>
        </td>
        <td><%= bike.getLocation() %></td>
        <td><%= bike.getPricePerHour() %></td>

        <td>
            <%
                if (bike instanceof ElectricBike) {
                    out.print("Electric");
                } else if (bike instanceof StandardBike) {
                    out.print("Standard");
                } else {
                    out.print("Unknown");
                }
            %>
        </td>

        <td>
            <%
                if (bike instanceof ElectricBike) {
                    ElectricBike eb = (ElectricBike) bike;
                    out.print("Battery Level: " + eb.getBatteryLevel() + "%");
                } else if (bike instanceof StandardBike) {
                    StandardBike sb = (StandardBike) bike;
                    out.print("Gear Count: " + sb.getGearCount());
                } else {
                    out.print("N/A");
                }
            %>
        </td>

        <td>
            <a href="<%= request.getContextPath() %>/edit?id=<%= bike.getId() %>" class="action-button edit-button">Edit</a>
            <a href="<%= request.getContextPath() %>/delete?id=<%= bike.getId() %>" class="action-button delete-button" onclick="return confirm('Are you sure you want to delete this bike?');">Delete</a>
        </td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="8">No bikes available.</td>
    </tr>
    <%
        }
    %>
</table>

</body>
</html>













