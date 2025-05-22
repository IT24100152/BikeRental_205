package com.bikerental.bikes.util;

import com.bikerental.bikes.model.Bike;
import com.bikerental.bikes.model.ElectricBike;
import com.bikerental.bikes.model.StandardBike;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class BikeDao {
    private final String filePath;

    public BikeDao(String filePath) {
        this.filePath = filePath;
    }

    public int getNextId() throws IOException {
        List<Bike> bikes = getAllBikes();
        int maxId = 0;
        for (Bike bike : bikes) {
            if (bike.getId() > maxId) {
                maxId = bike.getId();
            }
        }
        return maxId + 1;
    }

    private Bike parseBike(String line) {
        try {
            String[] parts = line.split(",");
            if (parts.length < 7) return null;

            int id = Integer.parseInt(parts[0].trim());
            String model = parts[1].trim();
            String status = parts[2].trim();
            String location = parts[3].trim();
            double price = Double.parseDouble(parts[4].trim());
            String type = parts[5].trim();
            int lastField = Integer.parseInt(parts[6].trim());

            if (type.equalsIgnoreCase("electric")) {
                return new ElectricBike(id, model, status, location, price, lastField);
            } else if (type.equalsIgnoreCase("standard")) {
                return new StandardBike(id, model, status, location, price, lastField);
            }

        } catch (Exception e) {
            System.err.println("Failed to parse bike: " + line);
        }
        return null;
    }

    public List<Bike> getAllBikes() throws IOException {
        List<Bike> bikes = new ArrayList<>();
        List<String> lines = FileUtil.readLines(filePath);

        for (String line : lines) {
            Bike bike = parseBike(line);
            if (bike != null) {
                bikes.add(bike);
            }
        }

        return bikes;
    }

    public Bike getBikeById(int bikeId) throws IOException {
        List<Bike> bikes = getAllBikes();
        for (Bike bike : bikes) {
            if (bike.getId() == bikeId) {
                return bike;
            }
        }
        return null;
    }
    public void updateBike(Bike updatedBike) throws IOException {
        if (updatedBike == null) return;

        List<Bike> bikes = getAllBikes();
        boolean updated = false;

        // Iterate through the list of bikes to find the one to update
        for (int i = 0; i < bikes.size(); i++) {
            if (bikes.get(i).getId() == updatedBike.getId()) {
                bikes.set(i, updatedBike); // Replace the bike in the list
                updated = true;
                break;
            }
        }

        if (updated) {
            try {
                saveAllBikes(bikes); // Save the updated list back to the file
                System.out.println("Bike updated: " + updatedBike.toFileString());
            } catch (IOException e) {
                System.err.println("Error saving updated bike list: " + e.getMessage());
                throw e; // Re-throw the exception after logging
            }
        } else {
            System.err.println("Bike update failed, ID not found: " + updatedBike.getId());
        }
    }

    public void deleteBike(int bikeId) throws IOException {
        List<Bike> bikes = getAllBikes();  // Retrieve all bikes from the data source

        // Try to remove the bike with the matching ID using the removeIf method
        boolean removed = bikes.removeIf(bike -> bike.getId() == bikeId);

        if (removed) {
            try {
                saveAllBikes(bikes); // Save the updated list back to the file
                System.out.println("Bike deleted with ID: " + bikeId);
            } catch (IOException e) {
                System.err.println("Error saving updated bike list after deletion: " + e.getMessage());
                throw e; // Re-throw the exception after logging
            }
        } else {
            System.err.println("Bike delete failed, ID not found: " + bikeId);
        }
    }



    private void saveAllBikes(List<Bike> bikes) throws IOException {
        List<String> lines = new ArrayList<>();
        for (Bike bike : bikes) {
            lines.add(bike.toFileString());
        }

        FileUtil.writeLines(filePath, lines);
    }

    public void addBike(Bike bike) throws IOException {
        List<Bike> bikes = getAllBikes();
        bikes.add(bike);
        saveAllBikes(bikes);
    }

    public List<Bike> getAllBikesSortedByAvailability() throws IOException {
        List<Bike> bikes = getAllBikes();
        return quickSortByAvailability(bikes);
    }

    private List<Bike> quickSortByAvailability(List<Bike> bikes) {
        if (bikes.size() <= 1) {
            return bikes;
        }

        List<Bike> sorted = new ArrayList<>();
        List<Bike> less = new ArrayList<>();
        List<Bike> equal = new ArrayList<>();
        List<Bike> greater = new ArrayList<>();

        Bike pivot = bikes.get(bikes.size() / 2);

        for (Bike bike : bikes) {
            int comparison = compareByAvailability(bike, pivot);
            if (comparison < 0) {
                less.add(bike);
            } else if (comparison > 0) {
                greater.add(bike);
            } else {
                equal.add(bike);
            }
        }

        sorted.addAll(quickSortByAvailability(less));
        sorted.addAll(equal);
        sorted.addAll(quickSortByAvailability(greater));

        return sorted;
    }

    private int compareByAvailability(Bike a, Bike b) {
        if (a.getStatus().equals(b.getStatus())) {
            return 0;
        }
        if (a.getStatus().equals("available")) {
            return -1;
        }
        if (b.getStatus().equals("available")) {
            return 1;
        }
        if (a.getStatus().equals("rented")) {
            return -1;
        }
        if (b.getStatus().equals("rented")) {
            return 1;
        }
        return 0;
    }
}

