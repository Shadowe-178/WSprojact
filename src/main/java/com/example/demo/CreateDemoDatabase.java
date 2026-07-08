package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class CreateDemoDatabase {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/?useSSL=false&serverTimezone=UTC";
        String username = "root";
        String password = "Shadower1120";
        String dbName = "demo";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement()) {
            String sql = "CREATE DATABASE IF NOT EXISTS `" + dbName + "` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci";
            stmt.executeUpdate(sql);
            System.out.println("Database '" + dbName + "' created or already exists.");
        } catch (SQLException e) {
            System.err.println("Failed to create database: " + e.getMessage());
            e.printStackTrace();
            System.exit(1);
        }
    }
}
