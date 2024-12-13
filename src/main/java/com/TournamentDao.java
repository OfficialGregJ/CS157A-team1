package com;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TournamentDao {
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

    public void addTournament(String name, String location, Date startDate, Date endDate) {
        loadDriver(dbdriver);
        String sql = "INSERT INTO tournament (name, location, start_date, end_date) VALUES (?, ?, ?, ?)";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setString(2, location);
            ps.setDate(3, startDate);
            ps.setDate(4, endDate);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateTournamentAndStats(String originalName, String newName, String location, Date startDate, Date endDate, int matchesPlayed, int matchesWon) {
        loadDriver(dbdriver);
        Connection con = null;

        String updateTournamentSql = "UPDATE tournament SET name = ?, location = ?, start_date = ?, end_date = ? WHERE name = ?";
        String updateStatsSql = "UPDATE tournament_stats SET matches_played = ?, matches_won = ? WHERE tournament_name = ?";

        try {
            con = getConnection();
            con.setAutoCommit(false);

            // Update tournament details
            try (PreparedStatement ps = con.prepareStatement(updateTournamentSql)) {
                ps.setString(1, newName);
                ps.setString(2, location);
                ps.setDate(3, startDate);
                ps.setDate(4, endDate);
                ps.setString(5, originalName);
                ps.executeUpdate();
            }

            // Update tournament stats
            try (PreparedStatement ps = con.prepareStatement(updateStatsSql)) {
                ps.setInt(1, matchesPlayed);
                ps.setInt(2, matchesWon);
                ps.setString(3, originalName);
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
    public void updateTournament(String originalName, String newName, String location, Date startDate, Date endDate) {
        loadDriver(dbdriver);
        String updateTournamentSql = "UPDATE tournament SET name = ?, location = ?, start_date = ?, end_date = ? WHERE name = ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(updateTournamentSql)) {
            ps.setString(1, newName);
            ps.setString(2, location);
            ps.setDate(3, startDate);
            ps.setDate(4, endDate);
            ps.setString(5, originalName);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateTournamentStats(
        String tournamentName, 
        String date, 
        String team1, 
        String team2, 
        int team1Pts, 
        int team2Pts, 
        int team1Rebounds, 
        int team2Rebounds, 
        int team1Assists, 
        int team2Assists, 
        int team1Blocks, 
        int team2Blocks, 
        double team1FTPercent, 
        double team2FTPercent, 
        double team13PTPercent, 
        double team23PTPercent, 
        int team1TO, 
        int team2TO
    ) {
        loadDriver(dbdriver);
        String updateStatsSql = """
            UPDATE tournament_stats
            SET Date = ?, Team1 = ?, Team2 = ?, Team1Pts = ?, Team2Pts = ?, Team1Rebounds = ?, Team2Rebounds = ?, 
                Team1Assists = ?, Team2Assists = ?, Team1Blocks = ?, Team2Blocks = ?, Team1FT% = ?, Team2FT% = ?, 
                Team13PT% = ?, Team23PT% = ?, Team1TO = ?, Team2TO = ?
            WHERE TournamentName = ?
        """;

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(updateStatsSql)) {
            ps.setString(1, date);
            ps.setString(2, team1);
            ps.setString(3, team2);
            ps.setInt(4, team1Pts);
            ps.setInt(5, team2Pts);
            ps.setInt(6, team1Rebounds);
            ps.setInt(7, team2Rebounds);
            ps.setInt(8, team1Assists);
            ps.setInt(9, team2Assists);
            ps.setInt(10, team1Blocks);
            ps.setInt(11, team2Blocks);
            ps.setDouble(12, team1FTPercent);
            ps.setDouble(13, team2FTPercent);
            ps.setDouble(14, team13PTPercent);
            ps.setDouble(15, team23PTPercent);
            ps.setInt(16, team1TO);
            ps.setInt(17, team2TO);
            ps.setString(18, tournamentName);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    
 

    public void deleteTournamentAndStats(String name) {
        loadDriver(dbdriver);
        Connection con = null;

        String deleteTournamentSql = "DELETE FROM tournament WHERE name = ?";
        String deleteStatsSql = "DELETE FROM tournament_stats WHERE tournament_name = ?";

        try {
            con = getConnection();
            con.setAutoCommit(false);

            // Delete stats first
            try (PreparedStatement ps = con.prepareStatement(deleteStatsSql)) {
                ps.setString(1, name);
                ps.executeUpdate();
            }

            // Delete tournament
            try (PreparedStatement ps = con.prepareStatement(deleteTournamentSql)) {
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

    public List<String> getAllTournamentNames() {
        loadDriver(dbdriver);
        Connection con = getConnection();
        List<String> tournamentNames = new ArrayList<>();
        String query = "SELECT TournamentName FROM `deep-drive`.tournaments";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                tournamentNames.add(rs.getString("TournamentName"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { con.close(); } catch (Exception e) { e.printStackTrace(); }
        }
        return tournamentNames;
    }
}
