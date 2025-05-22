package com.bikerental.bikes.model;

public class StandardBike extends Bike {
    private int gearCount;

    public StandardBike(int id, String model, String status, String location, double pricePerHour, int gearCount) {
        super(id, model, status, location, pricePerHour);
        this.gearCount = gearCount;
    }

    public int getGearCount() {
        return gearCount;
    }

    @Override
    public String toFileString() {
        return getId() + "," + getModel() + "," + getStatus() + "," + getLocation() + "," + getPricePerHour() + ",standard," + gearCount;
    }
}


