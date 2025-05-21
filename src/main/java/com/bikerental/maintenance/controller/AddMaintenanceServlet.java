package com.bikerental.maintenance.controller;

import com.bikerental.maintenance.model.Maintenance;
import com.bikerental.maintenance.util.MaintenanceFileHandler;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class AddMaintenanceServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        try {
            String id = request.getParameter("id");
            String bikeId = request.getParameter("bikeId");
            String description = request.getParameter("description");
            String date = request.getParameter("date");
            String status = request.getParameter("status");

            Maintenance m = new Maintenance(id, bikeId, description, date, status);

            String filePath = getServletContext().getRealPath("/WEB-INF/data/maintenance.txt");

            MaintenanceFileHandler.add(m, filePath);

            // ✅ Redirect to the correct mapped URL
            response.sendRedirect("maintenanceList");

        } catch (Exception e) {
            e.printStackTrace(response.getWriter()); // shows actual error in browser
        }
    }
}







