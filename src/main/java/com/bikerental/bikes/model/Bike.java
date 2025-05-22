package com.bikerental.bikes.model;

public abstract class Bike {
    private int id;
    private String model;
    private String status;
    private String location;
    private double pricePerHour;

    public Bike(int id, String model, String status, String location, double pricePerHour) {
        this.id = id;
        this.model = model;
        this.status = status;
        this.location = location;
        this.pricePerHour = pricePerHour;
    }

    public int getId() {
        return id;
    }

    public String getModel() {
        return model;
    }

    public String getStatus() {
        return status;
    }

    public String getLocation() {
        return location;
    }

    public double getPricePerHour() {
        return pricePerHour;
    }



    public abstract String toFileString();
}


