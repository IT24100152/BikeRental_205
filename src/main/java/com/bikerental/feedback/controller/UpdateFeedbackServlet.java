package com.bikerental.feedback.controller;

import com.bikerental.feedback.model.Feedback;
import com.bikerental.feedback.util.FeedbackFileHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/editFeedback")
public class UpdateFeedbackServlet extends HttpServlet {
    private FeedbackFileHandler feedbackFileHandler;

    @Override
    public void init() throws ServletException {
        feedbackFileHandler = new FeedbackFileHandler(getServletContext());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int feedbackId = Integer.parseInt(request.getParameter("id"));
        List<Feedback> feedbacks = feedbackFileHandler.getAllFeedbacks();

        Feedback feedback = feedbacks.stream()
                .filter(f -> f.getId() == feedbackId)
                .findFirst()
                .orElse(null);

        if (feedback != null) {
            request.setAttribute("feedback", feedback);
            request.getRequestDispatcher("editFeedback.jsp").forward(request, response);
        } else {
            response.sendRedirect("viewFeedback?error=Feedback not found");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int feedbackId = Integer.parseInt(request.getParameter("id"));
        String user = request.getParameter("user");
        String comments = request.getParameter("comments");
        int rating = Integer.parseInt(request.getParameter("rating"));

        Feedback updatedFeedback = new Feedback(feedbackId, user, comments, rating);

        try {
            feedbackFileHandler.updateFeedback(updatedFeedback);
            response.sendRedirect("viewFeedback?message=Feedback updated successfully");
        } catch (Exception e) {

            request.setAttribute("error", "Error updating feedback: " + e.getMessage());
            request.getRequestDispatcher("editFeedback.jsp").forward(request, response);
        }
    }
}




