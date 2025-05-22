package com.bikerental.rental.model;

public class Rental {
    private String id;
    private String userId;
    private String bikeId;
    private String startDate;
    private String endDate;
    private String status;

    public Rental(String id, String userId, String bikeId, String startDate, String endDate, String status) {
        this.id = id;
        this.userId = userId;
        this.bikeId = bikeId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
    }

    // Getters and setters
    public String getId() { return id; }
    public String getUserId() { return userId; }
    public String getBikeId() { return bikeId; }
    public String getStartDate() { return startDate; }
    public String getEndDate() { return endDate; }
    public String getStatus() { return status; }

    public void setEndDate(String endDate) { this.endDate = endDate; }
    public void setStatus(String status) { this.status = status; }
}

