package com.bikerental.admin.controller;

import com.bikerental.admin.Managers.AdminManager;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addAdmin")
public class AddAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        // Generate ID and create admin
        AdminManager.addAdmin(AdminManager.getNextAdminId(), username, password, name, email, phone);

        response.sendRedirect("adminDashboard.jsp");

    }
}