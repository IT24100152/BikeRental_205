package com.bikerental.bikes.model;

public class ElectricBike extends Bike {
    private int batteryLevel;

    public ElectricBike(int id, String model, String status, String location, double pricePerHour, int batteryLevel) {
        super(id, model, status, location, pricePerHour);
        this.batteryLevel = batteryLevel;
    }

    public int getBatteryLevel() {
        return batteryLevel;
    }

    @Override
    public String toFileString() {
        return getId() + "," + getModel() + "," + getStatus() + "," + getLocation() + "," + getPricePerHour() + ",electric," + batteryLevel;
    }
}
