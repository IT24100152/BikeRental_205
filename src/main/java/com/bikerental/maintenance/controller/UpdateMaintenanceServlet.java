package com.bikerental.maintenance.controller;

import com.bikerental.maintenance.model.Maintenance;
import com.bikerental.maintenance.util.MaintenanceFileHandler;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class UpdateMaintenanceServlet extends HttpServlet {

    // Show the form with existing data
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String filePath = getServletContext().getRealPath("/WEB-INF/data/maintenance.txt");

        Maintenance m = MaintenanceFileHandler.findById(id, filePath);

        if (m != null) {
            request.setAttribute("maintenance", m);
            request.getRequestDispatcher("updateMaintenance.jsp").forward(request, response);
        } else {
            response.getWriter().println("Maintenance record not found.");
        }
    }

    // Process the submitted update form
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String bikeId = request.getParameter("bikeId");
        String description = request.getParameter("description");
        String date = request.getParameter("date");
        String status = request.getParameter("status");

        Maintenance updated = new Maintenance(id, bikeId, description, date, status);

        String filePath = getServletContext().getRealPath("/WEB-INF/data/maintenance.txt");
        MaintenanceFileHandler.update(updated, filePath);

        // ✅ Redirect with success message
        response.sendRedirect("maintenanceList?msg=Record+updated+successfully!");
    }
}


