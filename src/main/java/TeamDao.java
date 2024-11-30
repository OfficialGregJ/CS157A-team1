import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
