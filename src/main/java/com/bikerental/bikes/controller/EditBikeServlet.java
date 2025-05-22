package com.bikerental.bikes.controller;

import com.bikerental.bikes.model.*;
import com.bikerental.bikes.util.BikeDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/edit")
public class EditBikeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String path = getServletContext().getRealPath("/WEB-INF/data/bikes.txt");
        BikeDao bikeDao = new BikeDao(path);

        try {
            Bike bike = bikeDao.getBikeById(id);
            if (bike != null) {
                request.setAttribute("bike", bike);
                request.getRequestDispatcher("editBike.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/list");
            }
        } catch (IOException e) {
            response.sendRedirect(request.getContextPath() + "/list");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String bikeType = request.getParameter("bikeType");
        String model = request.getParameter("model");
        String status = request.getParameter("status");
        String location = request.getParameter("location");
        double pricePerHour = Double.parseDouble(request.getParameter("pricePerHour"));

        String path = getServletContext().getRealPath("/WEB-INF/data/bikes.txt");
        BikeDao bikeDao = new BikeDao(path);

        try {
            if (model == null || model.isEmpty()) {
                request.getSession().setAttribute("error", "Model cannot be empty.");
                response.sendRedirect(request.getContextPath() + "/edit?id=" + id);
                return;
            }

            Bike updatedBike;
            if ("electric".equals(bikeType)) {
                int batteryLevel = Integer.parseInt(request.getParameter("batteryLevel"));
                updatedBike = new ElectricBike(id, model, status, location, pricePerHour, batteryLevel);
            } else {
                int gearCount = Integer.parseInt(request.getParameter("gearCount"));
                updatedBike = new StandardBike(id, model, status, location, pricePerHour, gearCount);
            }

            bikeDao.updateBike(updatedBike);
            request.getSession().setAttribute("success", "Bike updated successfully!");
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "Invalid input data: " + e.getMessage());
        } catch (IOException e) {
            request.getSession().setAttribute("error", "Error updating bike: " + e.getMessage());
        } catch (Exception e) {
            request.getSession().setAttribute("error", "Unexpected error: " + e.getMessage());
        }

        response.sendRedirect(request.getContextPath() + "/listBike");
    }
}




