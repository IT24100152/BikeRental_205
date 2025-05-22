package com.bikerental.rental.controller;

import com.bikerental.rental.model.Rental;
import com.bikerental.rental.util.RentalFileHandler;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;


public class UpdateRentalServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String userId = request.getParameter("userId");
        String bikeId = request.getParameter("bikeId");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String status = request.getParameter("status");

        Rental updated = new Rental(id, userId, bikeId, startDate, endDate, status);
        String filePath = getServletContext().getRealPath("/WEB-INF/data/rentals.txt");
        RentalFileHandler.update(updated, filePath);

        response.sendRedirect("rentalHistory");
    }
}

