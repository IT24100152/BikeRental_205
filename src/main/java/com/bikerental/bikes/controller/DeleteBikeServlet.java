package com.bikerental.bikes.controller;

import com.bikerental.bikes.util.BikeDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/delete")
public class DeleteBikeServlet extends HttpServlet {

    private BikeDao bikeDao;

    @Override
    public void init() throws ServletException {
        // Initialize the BikeDao with the path to your data file
        String filePath = getServletContext().getRealPath("/WEB-INF/data/bikes.txt");
        bikeDao = new BikeDao(filePath);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the bike ID from the request parameter
        String idParam = request.getParameter("id");

        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect("listBike?message=Invalid bike ID");
            return;
        }

        int bikeId = Integer.parseInt(idParam);

        try {
            // Attempt to delete the bike using the bikeDao
            bikeDao.deleteBike(bikeId);
            // Redirect to the list page with a success message
            response.sendRedirect("listBike?message=Bike deleted successfully");
        } catch (Exception e) {
            // Log the error and redirect with an error message
            log("Error deleting bike with ID: " + bikeId, e);
            response.sendRedirect("listBike?message=Error deleting bike");
        }
    }
}



