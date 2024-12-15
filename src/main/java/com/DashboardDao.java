package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DashboardDao {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/deep-drive";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "admin";

    public int getUserCount() {
        String query = "SELECT COUNT(*) FROM users";
        return getCount(query);
    }

    public int getPlayerCount() {
        String query = "SELECT COUNT(*) FROM player";
        return getCount(query);
    }

    public int getTournamentCount() {
        String query = "SELECT COUNT(*) FROM tournaments"; 
        return getCount(query);
    }
    
    public int getTeamCount() {
        String query = "SELECT COUNT(*) FROM team"; 
        return getCount(query);
    }
    
    public int getGameCount() {
        String query = "SELECT COUNT(*) FROM games"; 
        return getCount(query);
    }

    private int getCount(String query) {
        int count = 0;
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
}
