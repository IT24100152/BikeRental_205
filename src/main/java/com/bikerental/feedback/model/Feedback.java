package com.bikerental.feedback.model;

public class Feedback {
    private int id;
    private String user;
    private String comments;
    private int rating;

    public Feedback(int id, String user, String comments, int rating) {
        this.id = id;
        this.user = user;
        this.comments = comments;
        this.rating = rating;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }
}


