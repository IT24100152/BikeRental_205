package com.bikerental.maintenance.model;

public class Maintenance {
    private String id;
    private String bikeId;
    private String description;
    private String date;
    private String status;

    public Maintenance(String id, String bikeId, String description, String date, String status) {
        this.id = id;
        this.bikeId = bikeId;
        this.description = description;
        this.date = date;
        this.status = status;
    }

    public String toCSV() {
        return String.join(",", id, bikeId, description, date, status);
    }

    public static Maintenance fromCSV(String line) {
        String[] parts = line.split(",", -1); // -1 allows empty values
        if (parts.length != 5) return null;
        return new Maintenance(parts[0], parts[1], parts[2], parts[3], parts[4]);
    }

    // Getters and Setters

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getBikeId() { return bikeId; }
    public void setBikeId(String bikeId) { this.bikeId = bikeId; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}


