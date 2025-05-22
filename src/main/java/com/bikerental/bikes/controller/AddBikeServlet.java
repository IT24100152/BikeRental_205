package com.bikerental.bikes.controller;

import com.bikerental.bikes.model.ElectricBike;
import com.bikerental.bikes.model.StandardBike;
import com.bikerental.bikes.util.BikeDao;
import com.bikerental.bikes.model.Bike;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;


@WebServlet("/add")
public class AddBikeServlet extends HttpServlet {
    private BikeDao bikeDao;

    @Override
    public void init() throws ServletException {
        String filePath = getServletContext().getRealPath("/WEB-INF/data/bikes.txt");
        bikeDao = new BikeDao(filePath);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bikeType = request.getParameter("bikeType");
        String model = request.getParameter("model");
        String status = request.getParameter("status");
        String location = request.getParameter("location");
        double pricePerHour;

        try {
            pricePerHour = Double.parseDouble(request.getParameter("pricePerHour"));
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid price format");
            request.getRequestDispatcher("addBike.jsp").forward(request, response);
            return;
        }

        try {
            int id = bikeDao.getNextId();
            Bike bike;

            if ("electric".equalsIgnoreCase(bikeType)) {
                int batteryLevel = Integer.parseInt(request.getParameter("batteryLevel"));
                bike = new ElectricBike(id, model, status, location, pricePerHour, batteryLevel);
            } else {
                int gearCount = Integer.parseInt(request.getParameter("gearCount"));
                bike = new StandardBike(id, model, status, location, pricePerHour, gearCount);
            }

            bikeDao.addBike(bike);

            // ✅ Redirect with success message and bike ID
            response.sendRedirect("listBike.jsp?message=Bike added successfully&id=" + id);

        } catch (Exception e) {
            request.setAttribute("error", "Error adding bike: " + e.getMessage());
            request.getRequestDispatcher("/addBike.jsp").forward(request, response);
        }
    }
}
