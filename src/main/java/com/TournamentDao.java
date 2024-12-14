package com;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TournamentDao {
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

    public void addTournament(String tournamentName, String date, String team1, String team2, String winner, String location, String videoUrl) {
        loadDriver(dbdriver);
        Connection con = null;

        String insertTournamentSql = """
            INSERT INTO tournaments (TournamentName, Date, Team1, Team2, Winner, Location, video_url) 
            VALUES (?, ?, ?, ?, ?, ?, ?)
        """;

        String insertStatsSql = """
            INSERT INTO tournament_stats (TournamentName, Date, Team1, Team2, Team1Pts, Team2Pts, 
                                          Team1Rebounds, Team2Rebounds, Team1Assists, Team2Assists, 
                                          Team1Blocks, Team2Blocks, `Team1FT%`, `Team2FT%`, 
                                          `Team13PT%`, `Team23PT%`, Team1TO, Team2TO) 
            VALUES (?, ?, ?, ?, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, 0.0, 0.0, 0.0, 0, 0)
        """;

        try {
            con = getConnection();
            con.setAutoCommit(false);

            // Insert into tournaments table
            try (PreparedStatement ps = con.prepareStatement(insertTournamentSql)) {
                ps.setString(1, tournamentName);
                ps.setString(2, date);
                ps.setString(3, team1);
                ps.setString(4, team2);
                ps.setString(5, winner);
                ps.setString(6, location);
                ps.setString(7, videoUrl);
                ps.executeUpdate();
            }

            // Initialize stats in tournament_stats table
            try (PreparedStatement ps = con.prepareStatement(insertStatsSql)) {
                ps.setString(1, tournamentName);
                ps.setString(2, date);
                ps.setString(3, team1);
                ps.setString(4, team2);
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



    public void updateTournamentAndStats(
            String originalName,
            String newName,
            String date,
            String team1,
            String team2,
            String winner,
            String location,
            String videoUrl,
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
            int team2TO) {
        loadDriver(dbdriver);
        Connection con = null;

        String updateTournamentSql = """
            UPDATE tournaments 
            SET TournamentName = ?, Date = ?, Team1 = ?, Team2 = ?, Winner = ?, Location = ?, video_url = ? 
            WHERE TournamentName = ?
        """;
        String updateStatsSql = """
            UPDATE tournament_stats 
            SET Team1Pts = ?, Team2Pts = ?, Team1Rebounds = ?, Team2Rebounds = ?, 
                Team1Assists = ?, Team2Assists = ?, Team1Blocks = ?, Team2Blocks = ?, 
                `Team1FT%` = ?, `Team2FT%` = ?, `Team13PT%` = ?, `Team23PT%` = ?, 
                Team1TO = ?, Team2TO = ? 
            WHERE TournamentName = ?
        """;

        try {
            con = getConnection();
            con.setAutoCommit(false);

            // Update tournament details
            try (PreparedStatement ps = con.prepareStatement(updateTournamentSql)) {
                ps.setString(1, newName);
                ps.setString(2, date);
                ps.setString(3, team1);
                ps.setString(4, team2);
                ps.setString(5, winner);
                ps.setString(6, location);
                ps.setString(7, videoUrl);
                ps.setString(8, originalName);
                ps.executeUpdate();
            }

            // Update tournament stats
            try (PreparedStatement ps = con.prepareStatement(updateStatsSql)) {
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
                ps.setString(15, originalName);
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

    public void updateTournament(String originalName, String newName, String date, String team1, String team2, String winner, String location, String videoUrl) {
        loadDriver(dbdriver);
        String sql = """
            UPDATE tournaments
            SET TournamentName = ?, Date = ?, Team1 = ?, Team2 = ?, Winner = ?, Location = ?, video_url = ?
            WHERE TournamentName = ?
        """;
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, newName);
            ps.setString(2, date);
            ps.setString(3, team1);
            ps.setString(4, team2);
            ps.setString(5, winner);
            ps.setString(6, location);
            ps.setString(7, videoUrl);
            ps.setString(8, originalName);
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
                Team1Assists = ?, Team2Assists = ?, Team1Blocks = ?, Team2Blocks = ?, `Team1FT%` = ?, `Team2FT%` = ?, 
                `Team13PT%` = ?, `Team23PT%` = ?, Team1TO = ?, Team2TO = ?
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

        String deleteTournamentSql = "DELETE FROM tournaments WHERE TournamentName = ?";
        String deleteStatsSql = "DELETE FROM tournament_stats WHERE TournamentName = ?";

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
    
    public Map<String, String> getTournamentDetails(String tournamentName) {
        loadDriver(dbdriver);
        Map<String, String> tournamentDetails = new HashMap<>();
        String sql = "SELECT * FROM tournaments WHERE TournamentName = ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, tournamentName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                tournamentDetails.put("TournamentName", rs.getString("TournamentName"));
                tournamentDetails.put("Date", rs.getString("Date"));
                tournamentDetails.put("Team1", rs.getString("Team1"));
                tournamentDetails.put("Team2", rs.getString("Team2"));
                tournamentDetails.put("Winner", rs.getString("Winner"));
                tournamentDetails.put("Location", rs.getString("Location"));
                tournamentDetails.put("video_url", rs.getString("video_url"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tournamentDetails;
    }
    
    public Map<String, Object> getTournamentStats(String tournamentName) {
        loadDriver(dbdriver);
        Map<String, Object> stats = new HashMap<>();
        String sql = "SELECT * FROM tournament_stats WHERE TournamentName = ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, tournamentName);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                stats.put("Date", rs.getString("Date"));
                stats.put("Team1", rs.getString("Team1"));
                stats.put("Team2", rs.getString("Team2"));
                stats.put("Team1Pts", rs.getInt("Team1Pts"));
                stats.put("Team2Pts", rs.getInt("Team2Pts"));
                stats.put("Team1Rebounds", rs.getInt("Team1Rebounds"));
                stats.put("Team2Rebounds", rs.getInt("Team2Rebounds"));
                stats.put("Team1Assists", rs.getInt("Team1Assists"));
                stats.put("Team2Assists", rs.getInt("Team2Assists"));
                stats.put("Team1Blocks", rs.getInt("Team1Blocks"));
                stats.put("Team2Blocks", rs.getInt("Team2Blocks"));
                stats.put("Team1FTPercent", rs.getDouble("Team1FT%"));
                stats.put("Team2FTPercent", rs.getDouble("Team2FT%"));
                stats.put("Team13PTPercent", rs.getDouble("Team13PT%"));
                stats.put("Team23PTPercent", rs.getDouble("Team23PT%"));
                stats.put("Team1TO", rs.getInt("Team1TO"));
                stats.put("Team2TO", rs.getInt("Team2TO"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stats;
    }


}
