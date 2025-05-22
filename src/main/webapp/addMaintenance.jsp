<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Maintenance</title>
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
            background-color: #007BFF;
            color: white;
            padding: 10px 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<h2>Add Maintenance Record</h2>
<form action="addMaintenance" method="post">
    Maintenance ID: <input type="text" name="id" required />
    Bike ID: <input type="text" name="bikeId" required />
    Description: <input type="text" name="description" required />
    Date: <input type="date" name="date" required />
    Status: <input type="text" name="status" required />
    <input type="submit" value="Add Maintenance"/>
</form>
</body>
</html>
