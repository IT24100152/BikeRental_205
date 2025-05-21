package com.bikerental.maintenance.controller;

import com.bikerental.maintenance.model.Maintenance;
import com.bikerental.maintenance.util.MaintenanceFileHandler;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;


public class ViewMaintenanceServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String filePath = getServletContext().getRealPath("/WEB-INF/data/maintenance.txt");
        List<Maintenance> records = MaintenanceFileHandler.readAll(filePath);

        request.setAttribute("records", records);
        request.getRequestDispatcher("maintenanceList.jsp").forward(request, response);
    }
}



