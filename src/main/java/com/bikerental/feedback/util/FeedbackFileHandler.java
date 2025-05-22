package com.bikerental.feedback.util;

import com.bikerental.feedback.model.Feedback;

import javax.servlet.ServletContext;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackFileHandler {
    private final String filePath;

    public FeedbackFileHandler(ServletContext context) {
        String path = context.getRealPath("/WEB-INF/data/feedback.txt");
        if (path == null) {
            path = "WEB-INF/data/feedback.txt";
        }
        this.filePath = path;

        File file = new File(path);
        File parentDir = file.getParentFile();
        if (!parentDir.exists()) {
            parentDir.mkdirs();
        }
        if (!file.exists()) {
            try {
                file.createNewFile();
            } catch (IOException e) {
                throw new RuntimeException("Failed to create feedback file: " + e.getMessage());
            }
        }
    }

    public List<Feedback> getAllFeedbacks() throws IOException {
        List<Feedback> feedbacks = new ArrayList<>();
        File file = new File(filePath);
        if (!file.exists()) {
            return feedbacks;
        }
        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",", -1);
                if (data.length == 4) {
                    try {
                        int id = Integer.parseInt(data[0].trim());
                        String user = data[1].trim();
                        String comments = data[2].trim();
                        int rating = Integer.parseInt(data[3].trim());
                        feedbacks.add(new Feedback(id, user, comments, rating));
                    } catch (NumberFormatException e) {
                        continue;
                    }
                }
            }
        }
        return feedbacks;
    }

    public void addFeedback(Feedback feedback) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            writer.write(feedback.getId() + "," + feedback.getUser() + "," + feedback.getComments() + "," + feedback.getRating());
            writer.newLine();
        }
    }

    public void updateFeedback(Feedback feedback) throws IOException {
        List<Feedback> feedbacks = getAllFeedbacks();
        for (int i = 0; i < feedbacks.size(); i++) {
            if (feedbacks.get(i).getId() == feedback.getId()) {
                feedbacks.set(i, feedback);
                break;
            }
        }
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, false))) {
            for (Feedback fb : feedbacks) {
                writer.write(fb.getId() + "," + fb.getUser() + "," + fb.getComments() + "," + fb.getRating());
                writer.newLine();
            }
        }
    }

    public void deleteFeedback(int feedbackId) throws IOException {
        List<Feedback> feedbacks = getAllFeedbacks();
        feedbacks.removeIf(fb -> fb.getId() == feedbackId);
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, false))) {
            for (Feedback fb : feedbacks) {
                writer.write(fb.getId() + "," + fb.getUser() + "," + fb.getComments() + "," + fb.getRating());
                writer.newLine();
            }
        }
    }

    public int getNextId() throws IOException {
        List<Feedback> feedbacks = getAllFeedbacks();
        int maxId = 0;
        for (Feedback feedback : feedbacks) {
            maxId = Math.max(maxId, feedback.getId());
        }
        return maxId + 1;
    }
}