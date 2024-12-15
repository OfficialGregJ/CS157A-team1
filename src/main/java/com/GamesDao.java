package com;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        String addGameSql = "INSERT INTO games (Date, Team1, Team2, Winner, Loser, Location, video_url) VALUES (?, ?, ?, ?, ?, ?, ?)";
        String addStatsSql = "INSERT INTO game_statistics (Date, Team1, Team2, Team1Pts, Team2Pts, Team1Rebounds, Team2Rebounds, " +
                "Team1Assists, Team2Assists, Team1Blocks, Team2Blocks, `Team1FT%`, `Team2FT%`, `Team13PT%`, `Team23PT%`, Team1TO, Team2TO) " +
                "VALUES (?, ?, ?, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, 0.0, 0.0, 0.0, 0, 0)";

        try (Connection con = getConnection()) {
            con.setAutoCommit(false);

            // Insert into games table
            try (PreparedStatement ps = con.prepareStatement(addGameSql)) {
                ps.setString(1, date);
                ps.setString(2, team1);
                ps.setString(3, team2);
                ps.setString(4, winner);
                ps.setString(5, loser);
                ps.setString(6, location);
                ps.setString(7, videoUrl);
                ps.executeUpdate();
            }

            // Insert into game_statistics table
            try (PreparedStatement ps = con.prepareStatement(addStatsSql)) {
                ps.setString(1, date);
                ps.setString(2, team1);
                ps.setString(3, team2);
                ps.executeUpdate();
            }

            con.commit();
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
    
    public Map<String, String> getGameDetails(String date, String team1, String team2) {
    	loadDriver(dbdriver);
    	Map<String, String> gameDetails = new HashMap<>();
    	String sql = "SELECT * FROM games WHERE Date = ? AND Team1 = ? AND Team2 = ?";
    	
    	try (Connection con = getConnection();
    	       PreparedStatement ps = con.prepareStatement(sql)) {
    	     ps.setString(1, date);
    	     ps.setString(2, team1);
    	     ps.setString(3, team2);

    	     try (ResultSet rs = ps.executeQuery()) {
    	         if (rs.next()) {
    	              gameDetails.put("Date", rs.getString("Date"));
    	              gameDetails.put("Team1", rs.getString("Team1"));
    	              gameDetails.put("Team2", rs.getString("Team2"));
    	              gameDetails.put("Winner", rs.getString("Winner"));
    	              gameDetails.put("Loser", rs.getString("Loser"));
    	              gameDetails.put("Location", rs.getString("Location"));
    	              gameDetails.put("video_url", rs.getString("video_url"));
    	           }
    	        }
    	  } catch (SQLException e) {
    	      e.printStackTrace();
    	  }
    	return gameDetails;
    }
}
