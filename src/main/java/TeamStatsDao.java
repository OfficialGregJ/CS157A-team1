import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.TeamStats;

public class TeamStatsDao {
    private String dburl = "jdbc:mysql://localhost:3306/deep-drive"; // Update with your DB name
    private String dbuname = "root"; // Update with your DB username
    private String dbpassword = "admin"; // Update with your DB password
    private String dbdriver = "com.mysql.jdbc.Driver";

    public void loadDriver(String dbDriver) {
        try {
            Class.forName(dbDriver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    
    public List<String> getAllTeams() {
        loadDriver(dbdriver);
        List<String> teamNames = new ArrayList<>();
        String sql = "SELECT Team FROM `deep-drive`.team_statistics";
        try (Connection con = DriverManager.getConnection(dburl, dbuname, dbpassword);
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                teamNames.add(rs.getString("Team"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return teamNames;
    }

    public TeamStats getTeamStats(String team) {
        loadDriver(dbdriver);
        Connection con = null;
        TeamStats stats = null;
        String sql = "SELECT * FROM `deep-drive`.team_statistics WHERE Team = ?";

        try {
            con = DriverManager.getConnection(dburl, dbuname, dbpassword);
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, team);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                stats = new TeamStats();
                stats.setPPG(rs.getDouble("PPG"));
                stats.setAPG(rs.getDouble("APG"));
                stats.setSPG(rs.getDouble("SPG"));
                stats.setBPG(rs.getDouble("BPG"));
                stats.setTOPG(rs.getDouble("TOPG"));
                stats.setFTPercentage(rs.getDouble("FT%"));
                stats.setThreePTPercentage(rs.getDouble("3PT%"));
                stats.setGamesPlayed(rs.getInt("GamesPlayed"));
                stats.setWins(rs.getInt("Wins"));
                stats.setLosses(rs.getInt("Losses"));
            } else {
                // Handle case when team is not found
                System.out.println("No stats found for team: " + team);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
					con.close();
				}
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return stats;
    }

}
