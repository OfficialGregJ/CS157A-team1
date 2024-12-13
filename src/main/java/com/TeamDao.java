package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.Team;
import com.TeamStats;

public class TeamDao {
    private String dburl = "jdbc:mysql://localhost:3306/deep-drive"; // Update with your DB name
    private String dbuname = "root"; // Update with your DB username
    private String dbpassword = "password123"; // Update with your DB password
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

    // Method to get all team names
    public List<String> getAllTeamNames() {
        loadDriver(dbdriver);
        Connection con = getConnection();
        List<String> teamNames = new ArrayList<>();

        String query = "SELECT Name FROM `deep-drive`.team"; // Adjust table name if necessary
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String teamName = rs.getString("Name");
                teamNames.add(teamName);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return teamNames;
    }
    public Team getTeamDetails(String teamName) {
        loadDriver(dbdriver);
        Connection con = getConnection();
        Team team = null;

        String query = "SELECT Name, City, Stadium FROM `deep-drive`.team WHERE Name = ?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, teamName);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                team = new Team();
                team.setName(rs.getString("Name"));
                team.setCity(rs.getString("City"));
                team.setStadium(rs.getString("Stadium"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return team;
    }
    
    public void addTeam(String name, String city, String stadium) {
        String sql = "INSERT INTO `deep-drive`.team (Name, City, Stadium) VALUES (?, ?, ?)";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setString(2, city);
            ps.setString(3, stadium);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void updateTeam(String originalName, String newName, String city, String stadium) {
        loadDriver(dbdriver);
        String query = "UPDATE `deep-drive`.team SET Name = ?, City = ?, Stadium = ? WHERE Name = ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, newName);
            ps.setString(2, city);
            ps.setString(3, stadium);
            ps.setString(4, originalName);

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void updateTeamAndStats(String originalName, String newName, String city, String stadium) {
        loadDriver(dbdriver);
        Connection con = null;

        String updateTeamSql = "UPDATE `deep-drive`.team SET Name = ?, City = ?, Stadium = ? WHERE Name = ?";
        String updateStatsSql = "UPDATE `deep-drive`.team_statistics SET Team = ? WHERE Team = ?";

        try {
            con = getConnection();
            con.setAutoCommit(false); // Begin transaction

            // Update team details
            try (PreparedStatement teamPs = con.prepareStatement(updateTeamSql)) {
                teamPs.setString(1, newName);
                teamPs.setString(2, city);
                teamPs.setString(3, stadium);
                teamPs.setString(4, originalName);
                teamPs.executeUpdate();
            }

            // Update team name in team_statistics
            try (PreparedStatement statsPs = con.prepareStatement(updateStatsSql)) {
                statsPs.setString(1, newName);
                statsPs.setString(2, originalName);
                statsPs.executeUpdate();
            }

            con.commit(); // Commit transaction

        } catch (SQLException e) {
            if (con != null) {
                try {
                    con.rollback(); // Rollback transaction in case of failure
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



    
    public void deleteTeam(String teamName) {
        String sql = "DELETE FROM `deep-drive`.team WHERE Name = ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, teamName);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public Map<String, String> getTeamDetailsMap(String teamName) {
        Map<String, String> details = new HashMap<>();
        String query = "SELECT City, Stadium FROM `deep-drive`.team WHERE Name = ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, teamName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                details.put("City", rs.getString("City"));
                details.put("Stadium", rs.getString("Stadium"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return details;
    }


    
    public Team getTeamDetailsWithStats(String teamName) {
        loadDriver(dbdriver);
        Connection con = getConnection();
        Team team = null;

        String query = "SELECT Name, City, Stadium FROM `deep-drive`.team WHERE Name = ?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, teamName);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                team = new Team();
                team.setName(rs.getString("Name"));
                team.setCity(rs.getString("City"));
                team.setStadium(rs.getString("Stadium"));

                // Fetch statistics for this team
                TeamStatsDao statsDao = new TeamStatsDao();
                TeamStats stats = statsDao.getTeamStats(teamName);
                team.setStats(stats);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return team;
    }

}
