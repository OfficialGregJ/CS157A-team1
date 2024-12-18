package com;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;

public class PlayerStatsDao {
    private String dburl = "jdbc:mysql://localhost:3306/deep-drive";
    private String dbuname = "root";
    private String dbpassword = "admin";
    private String dbdriver = "com.mysql.cj.jdbc.Driver";

    public void loadDriver(String dbDriver) {
        try {
            Class.forName(dbDriver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() {
        Connection con = null;
        try {
            con = DriverManager.getConnection(dburl, dbuname, dbpassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

    public void updatePlayerStats(String playerName, double ppg, double apg, double bpg, double spg, double rpg, double ftPercentage, double threePtPercentage, double topg) {
        loadDriver(dbdriver);
        String sql = """
            UPDATE player_stats
            SET PPG = ?, APG = ?, BPG = ?, SPG = ?, RPG = ?, `FT%` = ?, `3PT%` = ?, TOPG = ?
            WHERE Name = ?
        """;

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setDouble(1, ppg);
            ps.setDouble(2, apg);
            ps.setDouble(3, bpg);
            ps.setDouble(4, spg);
            ps.setDouble(5, rpg);
            ps.setDouble(6, ftPercentage);
            ps.setDouble(7, threePtPercentage);
            ps.setDouble(8, topg);
            ps.setString(9, playerName);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deletePlayerStats(String playerName) {
        loadDriver(dbdriver);
        String sql = "DELETE FROM player_stats WHERE Name = ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, playerName);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public Map<String, Double> getPlayerStats(String playerName) {
        loadDriver(dbdriver);
        Map<String, Double> playerStats = new HashMap<>();
        String sql = "SELECT * FROM player_stats WHERE Name = ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, playerName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                playerStats.put("PPG", rs.getDouble("PPG"));
                playerStats.put("APG", rs.getDouble("APG"));
                playerStats.put("BPG", rs.getDouble("BPG"));
                playerStats.put("SPG", rs.getDouble("SPG"));
                playerStats.put("RPG", rs.getDouble("RPG"));
                playerStats.put("FT%", rs.getDouble("FT%"));
                playerStats.put("3PT%", rs.getDouble("3PT%"));
                playerStats.put("TOPG", rs.getDouble("TOPG"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return playerStats;
    }

}
