package com;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PlayerDao {
    private String dburl = "jdbc:mysql://localhost:3306/deep-drive";
    private String dbuname = "root";
    private String dbpassword = "password123";
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
        String sql = "INSERT INTO player (Name, Team, Position, Age, Height, Weight, College, YearInNBA, image_url) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
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
        } catch (SQLException e) {
            e.printStackTrace();
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
        String sql = "DELETE FROM player WHERE Name = ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
