package com;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GamesDao {
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

    public List<String> getAllGames() {
        loadDriver(dbdriver);
        Connection con = getConnection();
        List<String> games = new ArrayList<>();
        String query = "SELECT CONCAT(Date, ' - ', Team1, ' vs ', Team2) AS gameDetails FROM games";

        try (PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                games.add(rs.getString("gameDetails"));
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

        return games;
    }

    public void addGame(String date, String team1, String team2, String winner, String loser, String location, String videoUrl) {
        loadDriver(dbdriver);
        String sql = "INSERT INTO games (Date, Team1, Team2, Winner, Loser, Location, video_url) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, date);
            ps.setString(2, team1);
            ps.setString(3, team2);
            ps.setString(4, winner);
            ps.setString(5, loser);
            ps.setString(6, location);
            ps.setString(7, videoUrl);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateGame(String originalDate, String originalTeam1, String originalTeam2, String newDate, String team1, String team2, String winner, String loser, String location, String videoUrl) {
        loadDriver(dbdriver);
        String sql = "UPDATE games SET Date = ?, Team1 = ?, Team2 = ?, Winner = ?, Loser = ?, Location = ?, video_url = ? WHERE Date = ? AND Team1 = ? AND Team2 = ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, newDate);
            ps.setString(2, team1);
            ps.setString(3, team2);
            ps.setString(4, winner);
            ps.setString(5, loser);
            ps.setString(6, location);
            ps.setString(7, videoUrl);
            ps.setString(8, originalDate);
            ps.setString(9, originalTeam1);
            ps.setString(10, originalTeam2);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteGame(String date, String team1, String team2) {
        loadDriver(dbdriver);
        String sql = "DELETE FROM games WHERE Date = ? AND Team1 = ? AND Team2 = ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, date);
            ps.setString(2, team1);
            ps.setString(3, team2);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
