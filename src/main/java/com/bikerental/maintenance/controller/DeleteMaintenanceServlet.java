package com.bikerental.maintenance.controller;

import com.bikerental.maintenance.util.MaintenanceFileHandler;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;


public class DeleteMaintenanceServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String filePath = getServletContext().getRealPath("/WEB-INF/data/maintenance.txt");

        if (id != null && !id.isEmpty()) {
            MaintenanceFileHandler.deleteById(id, filePath);
        }

        response.sendRedirect("maintenanceList");
    }
}




