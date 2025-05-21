package com.bikerental.admin.controller;

import com.bikerental.admin.Managers.AdminManager;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteAdmin")
public class DeleteAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String adminIdParam = request.getParameter("adminId");

        if (adminIdParam == null || adminIdParam.trim().isEmpty()) {
            request.setAttribute("error", "Admin ID is required");
            request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
            return;
        }

        try {
            int adminId = Integer.parseInt(adminIdParam);
            AdminManager.removeAdmin(adminId);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        response.sendRedirect("adminDashboard.jsp");
    }
}