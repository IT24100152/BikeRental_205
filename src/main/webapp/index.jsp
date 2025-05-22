<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Bike Rental Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 20px;
        }

        h2 {
            color: #2c3e50;
            text-align: center;
        }

        p {
            text-align: center;
            font-size: 18px;
        }

        ul {
            list-style-type: none;
            padding: 0;
            max-width: 300px;
            margin: 30px auto;
        }

        li {
            margin: 15px 0;
        }

        a {
            display: block;
            text-decoration: none;
            background-color: #3498db;
            color: white;
            padding: 12px;
            border-radius: 5px;
            text-align: center;
            transition: background-color 0.3s;
        }

        a:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
<h2>Welcome to Bike Rental Platform</h2>
<p>Select an option below:</p>
<ul>
    <li><a href="rentalBike.jsp">Rent a Bike</a></li>
    <li><a href="rentalHistory">View Rental History</a></li>
</ul>
</body>
</html>


