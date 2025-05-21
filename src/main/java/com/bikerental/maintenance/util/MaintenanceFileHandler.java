package com.bikerental.maintenance.util;

import com.bikerental.maintenance.model.Maintenance;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class MaintenanceFileHandler {

    // Read all maintenance records from file
    public static List<Maintenance> readAll(String filePath) throws IOException {
        List<Maintenance> list = new ArrayList<>();
        File file = new File(filePath);
        if (!file.exists()) {
            file.createNewFile(); // create file if it doesn’t exist
        }

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                Maintenance m = Maintenance.fromCSV(line);
                if (m != null) {
                    list.add(m);
                }
            }
        }
        return list;
    }

    // Write all maintenance records to file
    public static void writeAll(List<Maintenance> list, String filePath) throws IOException {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(filePath))) {
            for (Maintenance m : list) {
                bw.write(m.toCSV());
                bw.newLine();
            }
        }
    }

    // Add a single maintenance record
    public static void add(Maintenance m, String filePath) throws IOException {
        List<Maintenance> list = readAll(filePath);
        list.add(m);
        writeAll(list, filePath);
    }

    // Delete a record by ID
    public static void deleteById(String id, String filePath) throws IOException {
        List<Maintenance> list = readAll(filePath);
        list.removeIf(m -> m.getId().equals(id));
        writeAll(list, filePath);
    }

    // Update a record by ID
    public static void update(Maintenance updated, String filePath) throws IOException {
        List<Maintenance> list = readAll(filePath);
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getId().equals(updated.getId())) {
                list.set(i, updated);
                break;
            }
        }
        writeAll(list, filePath);
    }

    // Find a record by ID
    public static Maintenance findById(String id, String filePath) throws IOException {
        List<Maintenance> list = readAll(filePath);
        for (Maintenance m : list) {
            if (m.getId().equals(id)) {
                return m;
            }
        }
        return null;
    }
}

