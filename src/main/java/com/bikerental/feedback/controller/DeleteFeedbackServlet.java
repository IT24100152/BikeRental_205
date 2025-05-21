package com.bikerental.feedback.controller;

import com.bikerental.feedback.util.FeedbackFileHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/deleteFeedback")
public class DeleteFeedbackServlet extends HttpServlet {
    private FeedbackFileHandler feedbackFileHandler;

    @Override
    public void init() throws ServletException {
        feedbackFileHandler = new FeedbackFileHandler(getServletContext());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int feedbackId = Integer.parseInt(request.getParameter("id"));

        try {
            feedbackFileHandler.deleteFeedback(feedbackId);
            response.sendRedirect("viewFeedback?message=Feedback deleted successfully");
        } catch (Exception e) {
            response.sendRedirect("viewFeedback?error=Error deleting feedback");
        }
    }
}


