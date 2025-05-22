package com.bikerental.rental.util;

import com.bikerental.rental.model.Rental;

import java.io.*;
import java.util.*;

public class RentalFileHandler {

    // Ensure file exists
    private static void ensureFile(String filePath) throws IOException {
        File file = new File(filePath);
        if (!file.exists()) {
            file.getParentFile().mkdirs(); // create directories if missing
            file.createNewFile(); // create empty file
        }
    }

    public static List<Rental> readAll(String filePath) throws IOException {
        ensureFile(filePath);
        List<Rental> rentals = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 6) {
                    rentals.add(new Rental(parts[0], parts[1], parts[2], parts[3], parts[4], parts[5]));
                }
            }
        }
        return rentals;
    }

    public static void writeAll(List<Rental> rentals, String filePath) throws IOException {
        ensureFile(filePath);

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (Rental r : rentals) {
                writer.write(String.join(",", r.getId(), r.getUserId(), r.getBikeId(),
                        r.getStartDate(), r.getEndDate(), r.getStatus()));
                writer.newLine();
            }
        }
    }

    public static void add(Rental rental, String filePath) throws IOException {
        ensureFile(filePath);

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            writer.write(String.join(",", rental.getId(), rental.getUserId(), rental.getBikeId(),
                    rental.getStartDate(), rental.getEndDate(), rental.getStatus()));
            writer.newLine();
        }
    }

    public static Rental findById(String id, String filePath) throws IOException {
        for (Rental r : readAll(filePath)) {
            if (r.getId().equals(id)) return r;
        }
        return null;
    }

    public static void delete(String id, String filePath) throws IOException {
        List<Rental> rentals = readAll(filePath);
        rentals.removeIf(r -> r.getId().equals(id));
        writeAll(rentals, filePath);
    }

    public static void update(Rental updated, String filePath) throws IOException {
        List<Rental> rentals = readAll(filePath);
        for (int i = 0; i < rentals.size(); i++) {
            if (rentals.get(i).getId().equals(updated.getId())) {
                rentals.set(i, updated);
                break;
            }
        }
        writeAll(rentals, filePath);
    }
}


