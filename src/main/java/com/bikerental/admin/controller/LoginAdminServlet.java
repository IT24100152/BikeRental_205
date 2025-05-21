package com.bikerental.admin.controller;

import com.bikerental.admin.Managers.AdminManager;
import com.bikerental.admin.model.Admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/admin-login")
public class LoginAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminManager.readAdmins();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Admin loggedAdmin = null;

        // Check if getAdmins() returns null
        if (AdminManager.getAdmins() != null && !AdminManager.getAdmins().isEmpty()) {
            for (Admin admin : AdminManager.getAdmins()) {
                if (admin.getEmail().equalsIgnoreCase(email) && admin.getPassword().equals(password)) {
                    loggedAdmin = admin;
                    break;
                }
            }
        }

        if (loggedAdmin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("logged-in-admin", loggedAdmin);
            response.sendRedirect("adminDashboard.jsp");
        } else {
            PrintWriter out = response.getWriter();
            out.write("Email or password is incorrect");
        }
    }
}
