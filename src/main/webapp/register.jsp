<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bike Rental - Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f6f9;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .register-container {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            padding: 40px;
            max-width: 500px;
            width: 100%;
        }
        .register-container h2 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
            font-weight: bold;
        }
        .form-control {
            border-radius: 25px;
            padding: 12px 20px;
        }
        .btn-primary {
            background-color: #3498db;
            border: none;
            border-radius: 25px;
            padding: 12px 20px;
            width: 100%;
            font-weight: bold;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
        }
        .bike-image {
            width: 200px;
            height: 200px;
            object-fit: cover;
            border-radius: 50%;
            margin-bottom: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        .login-link {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="register-container text-center">
        <img src="https://picsum.photos/200/200?random=1" alt="Bike Image" class="bike-image">
        <h2>Create Your Account</h2>
        <form action="register" method="post">

        <div class="mb-3">
                <input type="text" class="form-control" id="username" name="username" placeholder="Choose a Username" required>
            </div>
            <div class="mb-3">
                <input type="password" class="form-control" id="password" name="password" placeholder="Create a Password" required>
            </div>
            <div class="mb-3">
                <input type="email" class="form-control" id="email" name="email" placeholder="Your Email Address" required>
            </div>
            <div class="mb-3">
                <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Your Full Name" required>
            </div>
            <button type="submit" class="btn btn-primary">Register</button>
        </form>
        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger mt-3"><%= request.getAttribute("error") %></div>
        <% } %>
        <div class="login-link">
            <p class="mt-3">Already have an account? <a href="/demoBikeUser/register" class="text-primary">Login here</a></p>
        </div>
    </div>
</div>
</body>
</html>
