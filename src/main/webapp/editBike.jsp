<%@ page import="com.bikerental.bikes.model.Bike" %>
<%@ page import="com.bikerental.bikes.model.StandardBike" %>
<%@ page import="com.bikerental.bikes.model.ElectricBike" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Bike</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7f8;
            padding: 30px;
            margin: 0;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        form {
            background-color: #ffffff;
            max-width: 500px;
            margin: 30px auto;
            padding: 25px 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            padding: 10px 18px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        p {
            text-align: center;
            color: red;
            font-weight: bold;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #007BFF;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<h2>Edit Bike</h2>

<%
    Bike bike = (Bike) request.getAttribute("bike");
    String errorMessage = (String) request.getAttribute("error");

    if (bike == null) {
%>
<p>Error: No bike data available.</p>
<%
} else {
    if (errorMessage != null) {
%>
<p><%= errorMessage %></p>
<%
    }
%>

<form action="edit" method="post">
    <%--@declare id="gearcount"--%><%--@declare id="batterylevel"--%><%--@declare id="biketype"--%><%--@declare id="priceperhour"--%><%--@declare id="location"--%><%--@declare id="status"--%><%--@declare id="model"--%><input type="hidden" name="id" value="<%= bike.getId() %>" />

    <label for="model">Model:</label>
    <input type="text" name="model" value="<%= bike.getModel() %>" required />

    <label for="status">Status:</label>
    <input type="text" name="status" value="<%= bike.getStatus() %>" required />

    <label for="location">Location:</label>
    <input type="text" name="location" value="<%= bike.getLocation() %>" required />

    <label for="pricePerHour">Price per Hour:</label>
    <input type="number" step="0.01" name="pricePerHour" value="<%= bike.getPricePerHour() %>" required />

    <label for="bikeType">Bike Type:</label>
    <select name="bikeType" required>
        <option value="standard" <%= (bike instanceof StandardBike) ? "selected" : "" %>>Standard</option>
        <option value="electric" <%= (bike instanceof ElectricBike) ? "selected" : "" %>>Electric</option>
    </select>

    <% if (bike instanceof ElectricBike) { %>
    <label for="batteryLevel">Battery Level:</label>
    <input type="number" name="batteryLevel" value="<%= ((ElectricBike) bike).getBatteryLevel() %>" required />
    <% } else if (bike instanceof StandardBike) { %>
    <label for="gearCount">Gear Count:</label>
    <input type="number" name="gearCount" value="<%= ((StandardBike) bike).getGearCount() %>" required />
    <% } %>

    <input type="submit" value="Update Bike">
</form>

<a href="listBike">Back to Bike List</a>

<% } %>

</body>
</html>








