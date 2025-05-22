<%@ page import="com.bikerental.rental.model.Rental, com.bikerental.rental.util.RentalFileHandler" %>
<%
    String id = request.getParameter("id");
    String path = application.getRealPath("/WEB-INF/data/rentals.txt");
    Rental r = RentalFileHandler.findById(id, path);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Rental</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            padding: 20px;
        }
        h2 {
            color: #333;
        }
        form {
            background-color: #fff;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: auto;
        }
        input[type="text"],
        input[type="date"],
        select {
            width: 100%;
            padding: 10px;
            margin-top: 8px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        label {
            font-weight: bold;
        }
    </style>
</head>
<body>

<h2>Edit Rental</h2>
<form action="updateRental" method="post">
    <%--@declare id="bikeid"--%><%--@declare id="userid"--%><%--@declare id="startdate""--%><%--@declare id="enddate"--%><%--@declare id="status"--%><input type="hidden" name="id" value="<%= r.getId() %>">

    <label for="userId">User ID:</label>
    <input type="text" name="userId" value="<%= r.getUserId() %>" required>

    <label for="bikeId">Bike ID:</label>
    <input type="text" name="bikeId" value="<%= r.getBikeId() %>" required>

    <label for=startDate">Start Date:</label>
    <input type="date" name="startDate" value="<%= r.getStartDate() %>" required>

    <label for="endDate">End Date:</label>
    <input type="date" name="endDate" value="<%= r.getEndDate() %>" required>

    <label for="status">Status:</label>
    <select name="status">
        <option value="Active" <%= "Active".equals(r.getStatus()) ? "selected" : "" %>>Active</option>
        <option value="Extended" <%= "Extended".equals(r.getStatus()) ? "selected" : "" %>>Extended</option>
        <option value="Cancelled" <%= "Cancelled".equals(r.getStatus()) ? "selected" : "" %>>Cancelled</option>
    </select>

    <input type="submit" value="Update Rental">
</form>

</body>
</html>

