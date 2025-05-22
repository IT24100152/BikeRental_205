package com.bikerental.rental.controller;

import com.bikerental.rental.util.RentalFileHandler;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;


public class DeleteRentalServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String filePath = getServletContext().getRealPath("/WEB-INF/data/rentals.txt");

        if (id != null && !id.isEmpty()) {
            RentalFileHandler.delete(id, filePath);
        }

        response.sendRedirect("rentalHistory");
    }
}

