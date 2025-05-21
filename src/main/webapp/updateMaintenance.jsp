<%@ page import="com.bikerental.maintenance.model.Maintenance" %>
<%
    Maintenance m = (Maintenance) request.getAttribute("maintenance");
%>
<html>
<head>
    <title>Update Maintenance</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f2f2f2;
        }
        h2 {
            color: #333;
        }
        form {
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            max-width: 500px;
        }
        input[type="text"], input[type="date"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0 16px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
        input[type="submit"] {
            background-color: #ffc107;
            color: white;
            padding: 10px 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #e0a800;
        }
        label {
            display: block;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<h2>Update Maintenance Record</h2>
<form action="updateMaintenance" method="post">
    <input type="hidden" name="id" value="<%= m.getId() %>" />

    <label>Bike ID:</label>
    <input type="text" name="bikeId" value="<%= m.getBikeId() %>" required />

    <label>Description:</label>
    <input type="text" name="description" value="<%= m.getDescription() %>" required />

    <label>Date:</label>
    <input type="date" name="date" value="<%= m.getDate() %>" required />

    <label>Status:</label>
    <input type="text" name="status" value="<%= m.getStatus() %>" required />

    <input type="submit" value="Update Maintenance" />
</form>
</body>
</html>
