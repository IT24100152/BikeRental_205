<%@ page import="com.bikerental.bikes.model.Bike" %>
<%@ page import="com.bikerental.bikes.model.StandardBike" %>
<%@ page import="com.bikerental.bikes.model.ElectricBike" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Bike</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7f8;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        form {
            max-width: 500px;
            margin: 30px auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
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
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #007BFF;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        #extraFields label {
            margin-top: 10px;
        }
    </style>
</head>
<body>
<h2>Add Bike</h2>

<form action="listBike?action=add" method="post">
    <%--@declare id="biketype"--%><%--@declare id="location"--%><%--@declare id="priceperhour"--%><%--@declare id="status"--%><%--@declare id="model"--%><label for="model">Model:</label>
    <input type="text" name="model" required />

    <label for="status">Status:</label>
    <select name="status" required>
        <option value="">-- Select Status --</option>
        <option value="Available">Available</option>
        <option value="Rented">Rented</option>
        <option value="Under Maintenance">Under Maintenance</option>
    </select>

    <label for="location">Location:</label>
    <input type="text" name="location" required />

    <label for="pricePerHour">Price per Hour:</label>
    <input type="number" step="0.01" name="pricePerHour" required />

    <label for="bikeType">Bike Type:</label>
    <select name="bikeType" required>
        <option value="">-- Select Bike Type --</option>
        <option value="standard">Standard</option>
        <option value="electric">Electric</option>
    </select>

    <div id="extraFields"></div>

    <input type="submit" value="Add Bike">
</form>

<script>
    document.querySelector("select[name='bikeType']").addEventListener("change", function () {
        let bikeType = this.value;
        let extraFields = document.getElementById("extraFields");
        extraFields.innerHTML = '';

        if (bikeType === 'electric') {
            extraFields.innerHTML = `
                <label for="batteryLevel">Battery Level:</label>
                <input type="number" name="batteryLevel" required />
            `;
        } else if (bikeType === 'standard') {
            extraFields.innerHTML = `
                <label for="gearCount">Gear Count:</label>
                <input type="number" name="gearCount" required />
            `;
        }
    });
</script>
</body>
</html>






