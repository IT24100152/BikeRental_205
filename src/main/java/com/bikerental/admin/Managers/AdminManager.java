package com.bikerental.admin.Managers;

import com.bikerental.admin.model.Admin;
import com.bikerental.admin.util.FileHandler;
import java.util.ArrayList;

public class AdminManager {
    private static ArrayList<Admin> admins = null;
    private static final String fileName = "admins.txt";
    private static int ID = 0;

    public static void readAdmins() {
        if (admins != null)
            return;

        admins = new ArrayList<>();

        admins.add(new Admin(0, "bikerental/admin", "123", "Admin", "admin@gmail.com", "0700000000"));
        int adminId = 0;
        String[] adminsDataArr = FileHandler.readFromFile(fileName);
        for (String adminData : adminsDataArr) {
            String[] adminDataArr = adminData.split(",");
            adminId = Integer.parseInt(adminDataArr[0]);
            String username = adminDataArr[1];
            String password = adminDataArr[2];
            String name = adminDataArr[3];
            String email = adminDataArr[4];
            String phone = adminDataArr[5];

            Admin admin = new Admin(adminId, username, password, name, email, phone);
            admins.add(admin);
        }
        ID = adminId;
    }

    public static Admin findAdmin(int adminId) {
        for (Admin admin : admins) {
            if (admin.getAdminId() == adminId) {
                return admin;
            }
        }
        return null;
    }

    public static void addAdmin(int adminId, String username, String password, String name, String email, String phone) {
        Admin admin = new Admin(adminId, username, password, name, email, phone);
        admins.add(admin);
        FileHandler.writeToFile(fileName, true, admin.toString());
    }

    public static void removeAdmin(int adminId) {
        admins.remove(findAdmin(adminId));
        saveAdminsToFile();
    }

    public static void updateAdmin(int adminId, String username, String password, String name, String email, String phone) {
        Admin admin = findAdmin(adminId);
        if (admin != null) {
            admin.setUsername(username);
            admin.setPassword(password);
            admin.setName(name);
            admin.setEmail(email);
            admin.setPhone(phone);
        }
        saveAdminsToFile();
    }

    public static void saveAdminsToFile() {
        StringBuilder adminDetails = new StringBuilder();
        for (Admin admin : admins) {
            if (admin.getAdminId()!=0)
            adminDetails.append(admin.toString());
        }
        FileHandler.writeToFile(fileName, false, adminDetails.toString());
    }

    public static ArrayList<Admin> getAdmins() {
        return admins;
    }

    public static int getNextAdminId() {
        return ++ID;
    }
}
