<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>New Bike Rental</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eaeaea;
            margin: 0;
            padding: 40px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
        }

        form {
            background-color: #ffffff;
            max-width: 400px;
            margin: 30px auto;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        input[type="text"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #3498db;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

<h2>New Bike Rental</h2>
<form action="addRental" method="post">
    Rental ID: <input type="text" name="id" required>
    User ID: <input type="text" name="userId" required>
    Bike ID: <input type="text" name="bikeId" required>
    Start Date: <input type="date" name="startDate" required>
    End Date: <input type="date" name="endDate" required>
    <input type="submit" value="Rent Bike">
</form>

</body>
</html>


