<%@ page import="com.bikerental.admin.model.Admin" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Admin | BikeShare Pro</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* Global Styles */
        :root {
            --primary-color: #2e7d32; /* Green */
            --primary-light: #60ad5e;
            --primary-dark: #005005;
            --secondary-color: #ff6d00; /* Orange */
            --secondary-light: #ff9e40;
            --secondary-dark: #c43c00;
            --light-gray: #f5f5f5;
            --medium-gray: #e0e0e0;
            --dark-gray: #757575;
            --white: #ffffff;
            --black: #212121;
            --success-bg: #d1fae5;
            --success-text: #065f46;
            --warning-bg: #fef3c7;
            --warning-text: #92400e;
            --danger-bg: #fee2e2;
            --danger-text: #b91c1c;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: var(--light-gray);
            color: var(--black);
            display: flex;
            min-height: 100vh;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background-color: var(--white);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            height: 100vh;
            position: fixed;
            transition: all 0.3s;
        }

        .sidebar-brand {
            padding: 20px;
            border-bottom: 1px solid var(--medium-gray);
        }

        .brand-flex {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .brand-name {
            font-size: 18px;
            font-weight: 600;
        }

        .brand-highlight {
            color: var(--primary-color);
        }

        .sidebar-menu {
            flex: 1;
            padding: 20px 0;
            overflow-y: auto;
        }

        .menu-item {
            padding: 12px 20px;
            margin: 5px 0;
            cursor: pointer;
            transition: all 0.3s;
            border-left: 3px solid transparent;
        }

        .menu-item:hover {
            background-color: var(--light-gray);
            border-left: 3px solid var(--primary-color);
        }

        .menu-item.active {
            background-color: rgba(46, 125, 50, 0.1);
            border-left: 3px solid var(--primary-color);
        }

        .menu-item.active .menu-icon {
            color: var(--primary-color);
        }

        .menu-icon {
            margin-right: 10px;
            color: var(--dark-gray);
            width: 20px;
            text-align: center;
        }

        .menu-text {
            font-size: 14px;
        }

        .sidebar-footer {
            padding: 15px;
            border-top: 1px solid var(--medium-gray);
        }

        .user-profile {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .user-profile img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
        }

        .user-info {
            flex: 1;
        }

        .user-name {
            font-size: 14px;
            font-weight: 500;
        }

        .user-role {
            font-size: 12px;
            color: var(--dark-gray);
        }

        .user-logout a {
            color: var(--dark-gray);
            transition: all 0.3s;
        }

        .user-logout a:hover {
            color: var(--secondary-color);
        }

        /* Main Content Styles */
        .main-content {
            flex: 1;
            margin-left: 250px;
            padding: 20px;
            min-height: 100vh;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 20px;
            border-bottom: 1px solid var(--medium-gray);
        }

        .page-title {
            font-size: 24px;
            font-weight: 600;
            color: var(--primary-dark);
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .search-box {
            position: relative;
            width: 250px;
        }

        .search-box input {
            width: 100%;
            padding: 8px 15px 8px 35px;
            border: 1px solid var(--medium-gray);
            border-radius: 4px;
            font-size: 14px;
            transition: all 0.3s;
        }

        .search-box input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 2px rgba(46, 125, 50, 0.2);
        }

        .search-box i {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--dark-gray);
        }

        /* Card Styles */
        .card {
            background-color: var(--white);
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            margin-bottom: 20px;
            overflow: hidden;
        }

        .card-header {
            padding: 15px 20px;
            border-bottom: 1px solid var(--medium-gray);
        }

        .card-header-flex {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .card-header h3 {
            font-size: 18px;
            font-weight: 600;
            color: var(--primary-dark);
        }

        .card-body {
            padding: 20px;
        }

        /* Table Styles */
        .table-responsive {
            overflow-x: auto;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .table th, .table td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid var(--medium-gray);
        }

        .table th {
            background-color: var(--light-gray);
            font-weight: 600;
            color: var(--primary-dark);
            text-transform: uppercase;
            font-size: 13px;
        }

        .table tr:hover {
            background-color: rgba(46, 125, 50, 0.05);
        }

        .text-center {
            text-align: center;
        }

        /* Button Styles */
        .btn {
            display: inline-block;
            padding: 8px 16px;
            border-radius: 4px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            border: none;
        }

        .btn-sm {
            padding: 5px 10px;
            font-size: 12px;
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: var(--white);
        }

        .btn-primary:hover {
            background-color: var(--primary-dark);
        }

        .btn-warning {
            background-color: var(--secondary-color);
            color: var(--white);
        }

        .btn-warning:hover {
            background-color: var(--secondary-dark);
        }

        .btn-danger {
            background-color: #dc3545;
            color: var(--white);
        }

        .btn-danger:hover {
            background-color: #bb2d3b;
        }

        /* Badge Styles */
        .badge {
            padding: 4px 8px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 500;
            display: inline-block;
        }

        .bg-success {
            background-color: var(--success-bg);
            color: var(--success-text);
        }

        .bg-warning {
            background-color: var(--warning-bg);
            color: var(--warning-text);
        }

        .bg-danger {
            background-color: var(--danger-bg);
            color: var(--danger-text);
        }

        /* Alert Styles */
        .alert {
            padding: 10px 15px;
            border-radius: 4px;
            margin-bottom: 15px;
            font-size: 14px;
        }

        .alert-danger {
            background-color: var(--danger-bg);
            color: var(--danger-text);
            border-left: 3px solid var(--danger-text);
        }

        /* Form Styles */
        form {
            display: inline;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .sidebar {
                width: 70px;
                overflow: hidden;
            }

            .brand-name, .menu-text, .user-info {
                display: none;
            }

            .menu-item {
                text-align: center;
                padding: 15px 0;
            }

            .menu-icon {
                margin-right: 0;
                font-size: 18px;
            }

            .main-content {
                margin-left: 70px;
            }

            .header-actions {
                flex-direction: column;
                align-items: flex-end;
            }

            .search-box {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<!-- Sidebar Navigation -->
<div class="sidebar">
    <div class="sidebar-brand">
        <div class="brand-flex">
            <img src="images/logo.png" width="40px" alt="BikeShare Logo">
            <div class="brand-name">
                <span class="brand-highlight">Bike</span>Share
            </div>
        </div>
    </div>

    <div class="sidebar-menu">
        <div class="menu-item">
            <a href="adminDashboard.jsp">
                <span class="menu-icon"><i class="fas fa-tachometer-alt"></i></span>
                <span class="menu-text">Dashboard</span>
            </a>
        </div>
        <div class="menu-item">
            <a href="viewAllUsers.jsp">
                <span class="menu-icon"><i class="fas fa-users"></i></span>
                <span class="menu-text">Manage Users</span>
            </a>
        </div>
        <div class="menu-item">
            <a href="viewAllBikes.jsp">
                <span class="menu-icon"><i class="fas fa-bicycle"></i></span>
                <span class="menu-text">Manage Bikes</span>
            </a>
        </div>
        <div class="menu-item active">
            <a href="addAdmin.jsp?adminId=<%=1%>">
                <span class="menu-icon"><i class="fas fa-user-plus"></i></span>
                <span class="menu-text">Add Admin</span>
            </a>
        </div>
        <%
            Admin loggedInAdmin = (Admin)session.getAttribute("logged-in-admin");
        %>
        <div class="menu-item">
            <a href="editAdmin.jsp?adminId=<%=loggedInAdmin.getAdminId()%>">
                <span class="menu-icon"><i class="fas fa-user-cog"></i></span>
                <span class="menu-text">My Profile</span>
            </a>
        </div>
    </div>

    <div class="sidebar-footer">
        <div class="user-profile">
            <img src="images/admin-avatar.jpg" alt="Admin">
            <div class="user-info">
                <div class="user-name">${admin.username}</div>
                <div class="user-role">Admin</div> <!-- Removed privilege level -->
            </div>
            <div class="user-logout">
                <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i></a>
            </div>
        </div>
    </div>
</div>

<!-- Main Content -->
<div class="main-content">
    <header>
        <h1 class="page-title">Add New Admin</h1>
        <div class="header-actions">
            <div class="breadcrumb">
                <a href="adminDashboard.jsp"><i class="fas fa-home"></i> Dashboard</a> / Add Admin
            </div>
        </div>
    </header>

    <main>
        <div class="card">
            <div class="card-header">
                <h3>Admin Registration Form</h3>
            </div>
            <div class="card-body">
                <form id="adminForm" action="addAdmin" method="POST">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="username">Username</label>
                            <input type="text" class="form-control" id="username" name="username" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="confirmPassword">Confirm Password</label>
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="name">Full Name</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>

                    <div class="form-group">
                        <label for="phone">Phone Number</label>
                        <input type="tel" class="form-control" id="phone" name="phone">
                    </div>

                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save"></i> Create Admin Account
                        </button>
                        <button type="reset" class="btn btn-secondary">
                            <i class="fas fa-undo"></i> Reset Form
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </main>
</div>

<script src="admin.js"></script>
</body>
</html>