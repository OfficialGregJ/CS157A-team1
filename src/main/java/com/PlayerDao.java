package com;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PlayerDao {
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

    public List<String> getAllPlayerNames() {
        loadDriver(dbdriver);
        Connection con = getConnection();
        List<String> playerNames = new ArrayList<>();
        String query = "SELECT Name FROM player";

        try (PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                playerNames.add(rs.getString("Name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return playerNames;
    }

    public void addPlayer(String name, String team, String position, int age, String height, double weight, String college, int yearInNBA, String imageUrl) {
        loadDriver(dbdriver);
        String insertPlayerSql = "INSERT INTO player (Name, Team, Position, Age, Height, Weight, College, YearInNBA, image_url) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String insertStatsSql = "INSERT INTO player_stats (Name, PPG, APG, BPG, SPG, RPG, `FT%`, `3PT%`, TOPG) VALUES (?, 0, 0, 0, 0, 0, 0, 0, 0)";

        Connection con = null;

        try {
            con = getConnection();
            con.setAutoCommit(false);

            // Insert player details
            try (PreparedStatement ps = con.prepareStatement(insertPlayerSql)) {
                ps.setString(1, name);
                ps.setString(2, team);
                ps.setString(3, position);
                ps.setInt(4, age);
                ps.setString(5, height);
                ps.setDouble(6, weight);
                ps.setString(7, college);
                ps.setInt(8, yearInNBA);
                ps.setString(9, imageUrl);
                ps.executeUpdate();
            }

            // Insert default player stats
            try (PreparedStatement ps = con.prepareStatement(insertStatsSql)) {
                ps.setString(1, name);
                ps.executeUpdate();
            }

            con.commit();
        } catch (SQLException e) {
            if (con != null) {
                try {
                    con.rollback();
                } catch (SQLException rollbackEx) {
                    rollbackEx.printStackTrace();
                }
            }
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.setAutoCommit(true);
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public void updatePlayer(String originalName, String newName, String team, String position, int age, String height, double weight, String college, int yearInNBA, String imageUrl) {
        loadDriver(dbdriver);
        String sql = "UPDATE player SET Name = ?, Team = ?, Position = ?, Age = ?, Height = ?, Weight = ?, College = ?, YearInNBA = ?, image_url = ? WHERE Name = ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, newName);
            ps.setString(2, team);
            ps.setString(3, position);
            ps.setInt(4, age);
            ps.setString(5, height);
            ps.setDouble(6, weight);
            ps.setString(7, college);
            ps.setInt(8, yearInNBA);
            ps.setString(9, imageUrl);
            ps.setString(10, originalName);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deletePlayer(String name) {
        loadDriver(dbdriver);
        Connection con = null;
        String deletePlayerSql = "DELETE FROM player WHERE Name = ?";
        String deleteStatsSql = "DELETE FROM player_stats WHERE Name = ?";

        try {
            con = getConnection();
            con.setAutoCommit(false);

            // Delete player stats first
            try (PreparedStatement ps = con.prepareStatement(deleteStatsSql)) {
                ps.setString(1, name);
                ps.executeUpdate();
            }

            // Delete player
            try (PreparedStatement ps = con.prepareStatement(deletePlayerSql)) {
                ps.setString(1, name);
                ps.executeUpdate();
            }

            con.commit();
        } catch (SQLException e) {
            if (con != null) {
                try {
                    con.rollback();
                } catch (SQLException rollbackEx) {
                    rollbackEx.printStackTrace();
                }
            }
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.setAutoCommit(true);
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    
    public Map<String, String> getPlayerDetails(String playerName) {
        loadDriver(dbdriver);
        Map<String, String> playerDetails = new HashMap<>();
        String sql = "SELECT * FROM player WHERE Name = ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, playerName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                playerDetails.put("Name", rs.getString("Name"));
                playerDetails.put("Team", rs.getString("Team"));
                playerDetails.put("Position", rs.getString("Position"));
                playerDetails.put("Age", String.valueOf(rs.getInt("Age")));
                playerDetails.put("Height", rs.getString("Height"));
                playerDetails.put("Weight", String.valueOf(rs.getDouble("Weight")));
                playerDetails.put("College", rs.getString("College"));
                playerDetails.put("YearInNBA", String.valueOf(rs.getInt("YearInNBA")));
                playerDetails.put("image_url", rs.getString("image_url"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return playerDetails;
    }

}
