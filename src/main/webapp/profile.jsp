<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bikerental.user.model.User" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bike Rental - User Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .profile-container {
            max-width: 800px;
            margin: 50px auto;
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            padding: 40px;
        }
        .profile-header {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
        }
        .profile-image {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        .profile-details h2 {
            color: #2c3e50;
            margin-bottom: 10px;
        }
        .profile-details p {
            color: #7f8c8d;
        }
        .form-control {
            border-radius: 25px;
            padding: 12px 20px;
        }
        .btn-primary, .btn-danger, .btn-secondary {
            border-radius: 25px;
            padding: 12px 20px;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
        }
        .btn-danger {
            background-color: #e74c3c;
            border: none;
        }
        .btn-danger:hover {
            background-color: #c0392b;
            transform: translateY(-2px);
        }
        .section-title {
            color: #2c3e50;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="profile-container">
        <% User user = (User) request.getAttribute("user"); %>
        <div class="profile-header">
            <img src="https://picsum.photos/200/200?random=3" alt="Profile Image" class="profile-image">
            <div class="profile-details">
                <h2><%= user.getFullName() %></h2>
                <p><i class="fas fa-envelope me-2"></i><%= user.getEmail() %></p>
                <p><i class="fas fa-user me-2"></i><%= user.getUsername() %></p>
            </div>
        </div>

        <h3 class="section-title">Update Profile</h3>
        <form action="<%= request.getContextPath() %>/profile" method="post">

        <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" value="<%= user.getEmail() %>" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="fullName" class="form-label">Full Name</label>
                    <input type="text" class="form-control" id="fullName" name="fullName" value="<%= user.getFullName() %>" required>
                </div>
            </div>
            <button type="submit" class="btn btn-primary mb-3"><i class="fas fa-save me-2"></i>Update Profile</button>
        </form>

        <% if (request.getAttribute("message") != null) { %>
        <div class="alert alert-success mt-3"><%= request.getAttribute("message") %></div>
        <% } %>
        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger mt-3"><%= request.getAttribute("error") %></div>
        <% } %>

        <h3 class="section-title mt-4">Account Management</h3>
        <div class="row">
            <div class="col-md-6">
                <form action="<%= request.getContextPath() %>/delete" method="post"
                      onsubmit="return confirm('Are you sure you want to delete your account? This action cannot be undone.');">

                <button type="submit" class="btn btn-danger w-100"><i class="fas fa-trash-alt me-2"></i>Delete Account</button>
                </form>
            </div>
            <div class="col-md-6">
                <form action="<%= request.getContextPath() %>/login" method="get">

                <button type="submit" class="btn btn-secondary w-100"><i class="fas fa-sign-out-alt me-2"></i>Logout</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
