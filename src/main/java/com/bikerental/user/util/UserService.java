package com.bikerental.user.util;


import com.bikerental.user.model.User;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class UserService {
    private String fileName;

    public UserService(String fileName) {
        this.fileName = fileName;
    }

    public void createUser(User user) throws IOException {
        if (getUserByUsername(user.getUsername()) != null) {
            throw new IOException("Username already exists");
        }
        try (FileWriter fw = new FileWriter(fileName, true);
             BufferedWriter bw = new BufferedWriter(fw);
             PrintWriter out = new PrintWriter(bw)) {
            out.println(user.getUsername() + "," + user.getPassword() + "," + user.getEmail() + "," + user.getFullName());
        }
    }

    public User getUserByUsername(String username) throws IOException {
        File file = new File(fileName);
        if (!file.exists()) {
            return null;
        }
        try (BufferedReader br = new BufferedReader(new FileReader(fileName))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts[0].equals(username)) {
                    return new User(parts[0], parts[1], parts[2], parts[3]);
                }
            }
        }
        return null;
    }

    public void updateUser(User user) throws IOException {
        File file = new File(fileName);
        if (!file.exists()) {
            throw new IOException("No users found");
        }
        List<String> lines = new ArrayList<>();
        boolean found = false;
        try (BufferedReader br = new BufferedReader(new FileReader(fileName))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts[0].equals(user.getUsername())) {
                    lines.add(user.getUsername() + "," + user.getPassword() + "," + user.getEmail() + "," + user.getFullName());
                    found = true;
                } else {
                    lines.add(line);
                }
            }
        }
        if (!found) {
            throw new IOException("User not found");
        }
        try (FileWriter fw = new FileWriter(fileName)) {
            for (String l : lines) {
                fw.write(l + System.lineSeparator());
            }
        }
    }

    public void deleteUser(String username) throws IOException {
        File file = new File(fileName);
        if (!file.exists()) {
            return;
        }
        List<String> lines = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(fileName))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (!parts[0].equals(username)) {
                    lines.add(line);
                }
            }
        }
        try (FileWriter fw = new FileWriter(fileName)) {
            for (String l : lines) {
                fw.write(l + System.lineSeparator());
            }
        }
    }
}
