<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bike Rental - Login</title>
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
        .login-container {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            padding: 40px;
            max-width: 450px;
            width: 100%;
        }
        .login-container h2 {
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
        .register-link {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="login-container text-center">
        <img src="https://picsum.photos/200/200?random=2" alt="Bike Image" class="bike-image">
        <h2>Welcome Back</h2>
        <form action="login" method="post">

        <div class="mb-3">
                <input type="text" class="form-control" id="username" name="username" placeholder="Username" required>
            </div>
            <div class="mb-3">
                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
        </form>
        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger mt-3"><%= request.getAttribute("error") %></div>
        <% } %>
        <div class="register-link">
            <p class="mt-3">Don't have an account? <a href="/demoBikeUser/register" class="text-primary">Register here</a>
        </div>
    </div>
</div>
</body>
</html>
