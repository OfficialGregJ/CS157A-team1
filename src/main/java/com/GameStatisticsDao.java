package com;

import java.sql.*;

public class GameStatisticsDao {
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

    public void updateGameStatistics(String date, String team1, String team2, int team1Pts, int team2Pts, int team1Rebounds, int team2Rebounds, int team1Assists, int team2Assists, int team1Blocks, int team2Blocks, double team1FTPercent, double team2FTPercent, double team13PTPercent, double team23PTPercent, int team1TO, int team2TO) {
        loadDriver(dbdriver);
        String sql = """
            UPDATE game_statistics
            SET Team1Pts = ?, Team2Pts = ?, Team1Rebounds = ?, Team2Rebounds = ?, Team1Assists = ?, Team2Assists = ?, 
                Team1Blocks = ?, Team2Blocks = ?, Team1FT% = ?, Team2FT% = ?, Team13PT% = ?, Team23PT% = ?, 
                Team1TO = ?, Team2TO = ?
            WHERE Date = ? AND Team1 = ? AND Team2 = ?
        """;

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, team1Pts);
            ps.setInt(2, team2Pts);
            ps.setInt(3, team1Rebounds);
            ps.setInt(4, team2Rebounds);
            ps.setInt(5, team1Assists);
            ps.setInt(6, team2Assists);
            ps.setInt(7, team1Blocks);
            ps.setInt(8, team2Blocks);
            ps.setDouble(9, team1FTPercent);
            ps.setDouble(10, team2FTPercent);
            ps.setDouble(11, team13PTPercent);
            ps.setDouble(12, team23PTPercent);
            ps.setInt(13, team1TO);
            ps.setInt(14, team2TO);
            ps.setString(15, date);
            ps.setString(16, team1);
            ps.setString(17, team2);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteGameStatistics(String date, String team1, String team2) {
        loadDriver(dbdriver);
        String sql = "DELETE FROM game_statistics WHERE Date = ? AND Team1 = ? AND Team2 = ?";

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
