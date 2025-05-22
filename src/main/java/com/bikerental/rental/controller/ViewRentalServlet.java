package com.bikerental.rental.controller;

import com.bikerental.rental.model.Rental;
import com.bikerental.rental.util.RentalFileHandler;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;


public class ViewRentalServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String filePath = getServletContext().getRealPath("/WEB-INF/data/rentals.txt");
        List<Rental> rentals = RentalFileHandler.readAll(filePath);

        request.setAttribute("rentals", rentals);
        request.getRequestDispatcher("rentalHistory.jsp").forward(request, response);
    }
}

