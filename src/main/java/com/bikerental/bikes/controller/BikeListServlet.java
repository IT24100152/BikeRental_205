package com.bikerental.bikes.controller;

import com.bikerental.bikes.model.Bike;
import com.bikerental.bikes.model.ElectricBike;
import com.bikerental.bikes.model.StandardBike;
import com.bikerental.bikes.util.BikeDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/listBike")
public class BikeListServlet extends HttpServlet {
    private BikeDao bikeDao;

    @Override
    public void init() throws ServletException {
        String filePath = getServletContext().getRealPath("/WEB-INF/data/bikes.txt");
        bikeDao = new BikeDao(filePath);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equalsIgnoreCase(action)) {
            // Forward to addBike.jsp
            request.getRequestDispatcher("addBike.jsp").forward(request, response);
        } else {
            // Default: Show bike list
            List<Bike> bikeList = bikeDao.getAllBikes();
            request.setAttribute("bikes", bikeList);
            request.getRequestDispatcher("listBike.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String model = request.getParameter("model");
            String status = request.getParameter("status");
            String location = request.getParameter("location");
            double pricePerHour = Double.parseDouble(request.getParameter("pricePerHour"));
            String bikeType = request.getParameter("bikeType");

            int nextId = bikeDao.getNextId();
            Bike newBike;

            if ("electric".equalsIgnoreCase(bikeType)) {
                int batteryLevel = Integer.parseInt(request.getParameter("batteryLevel"));
                newBike = new ElectricBike(nextId, model, status, location, pricePerHour, batteryLevel);
            } else {
                int gearCount = Integer.parseInt(request.getParameter("gearCount"));
                newBike = new StandardBike(nextId, model, status, location, pricePerHour, gearCount);
            }

            bikeDao.addBike(newBike);
            response.sendRedirect("listBike?message=Bike added successfully");

        } catch (Exception e) {
            request.setAttribute("error", "Error adding bike: " + e.getMessage());
            request.getRequestDispatcher("addBike.jsp").forward(request, response);
        }
    }
}



