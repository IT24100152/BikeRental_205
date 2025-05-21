package com.bikerental.admin.controller;

import com.bikerental.admin.Managers.AdminManager;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/editAdmin")
public class UpdateAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int adminId = Integer.parseInt(request.getParameter("adminId"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        if (password.length() == 0 ) {password = AdminManager.findAdmin(adminId).getPassword();}
        try {

            AdminManager.updateAdmin(adminId, username, password, name, email, phone);
            response.sendRedirect("viewAdmins");
        } catch (Exception e) {
            request.setAttribute("error", "Error updating admin: " + e.getMessage());
            request.getRequestDispatcher("editAdmin.jsp").forward(request, response);
        }
    }
}