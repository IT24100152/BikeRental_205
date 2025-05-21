<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bikerental.admin.model.Admin, com.bikerental.admin.util.FileHandler" %>
<%@ page import="com.bikerental.admin.Managers.AdminManager" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Head content remains the same -->
</head>
<body>
<!-- Sidebar Navigation remains the same -->

<!-- Main Content -->
<div class="main-content">
    <header>
        <h1 class="page-title">Edit Admin Profile</h1>
        <div class="header-actions">
            <div class="breadcrumb">
                <a href="adminDashboard.jsp"><i class="fas fa-home"></i> Dashboard</a> / Edit Admin
            </div>
        </div>
    </header>

    <main>
        <div class="card">
            <div class="card-header">
                <h3>Admin Profile</h3>
                <%
                    String successMessage = (String) request.getAttribute("successMessage");
                    String errorMessage = (String) request.getAttribute("errorMessage");

                    if (successMessage != null) {
                %>
                <div class="alert alert-success">
                    <%= successMessage %>
                </div>
                <%
                    }
                    if (errorMessage != null) {
                %>
                <div class="alert alert-danger">
                    <%= errorMessage %>
                </div>
                <%
                    }
                %>
            </div>
            <div class="card-body">
                <%
                    // Get the adminId parameter from the request
                    String adminIdParam = request.getParameter("adminId");
                    Admin adminToEdit = null;

                    if (adminIdParam != null && !adminIdParam.isEmpty()) {
                        try {
                            int adminId = Integer.parseInt(adminIdParam);
                            adminToEdit = AdminManager.findAdmin(adminId);
                        } catch (NumberFormatException e) {
                            // Handle invalid number format
                        }
                    }

                    if (adminToEdit != null) {
                %>
                <form id="profileForm" action="editAdmin" method="POST" onsubmit="return validateForm()">
                    <input type="hidden" name="adminId" value="<%= adminToEdit.getAdminId() %>">

                    <div class="profile-header">
                        <div class="profile-avatar">
                            <img src="images/admin-avatar.jpg" alt="Admin Avatar" id="avatarImage">
                            <div class="avatar-actions">
                                <button type="button" class="btn btn-sm btn-primary" onclick="document.getElementById('avatarUpload').click()">
                                    <i class="fas fa-camera"></i> Change
                                </button>
                                <input type="file" id="avatarUpload" accept="image/*" style="display: none;">
                            </div>
                        </div>
                        <div class="profile-info">
                            <h4><%= adminToEdit.getName() %></h4>
                            <p>Admin</p>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="username">Username</label>
                            <input type="text" class="form-control" id="username" name="username"
                                   value="<%= adminToEdit.getUsername() %>" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email"
                                   value="<%= adminToEdit.getEmail() %>" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="name">Full Name</label>
                        <input type="text" class="form-control" id="name" name="name"
                               value="<%= adminToEdit.getName() %>" required>
                    </div>

                    <div class="form-group">
                        <label for="phone">Phone Number</label>
                        <input type="tel" class="form-control" id="phone" name="phone"
                               value="<%= adminToEdit.getPhone() %>"
                               pattern="[0-9]{10,15}"
                               title="Phone number must be between 10-15 digits">
                    </div>

                    <div class="form-group">
                        <label for="password">Password (leave blank to keep unchanged)</label>
                        <input type="password" class="form-control" id="password" name="password">
                        <p class="password-message">If changing password, it must be at least 8 characters long</p>
                    </div>

                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save"></i> Update Admin
                        </button>
                        <button type="button" class="btn btn-secondary" onclick="window.location.href='viewAllAdmins.jsp'">
                            <i class="fas fa-times"></i> Cancel
                        </button>
                    </div>
                </form>
                <%
                } else {
                %>
                <div class="alert alert-danger">
                    Admin not found or invalid admin ID provided.
                    <a href="viewAllAdmins.jsp">Return to admin list</a>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </main>
</div>

<!-- Scripts remain the same -->
</body>
</html>