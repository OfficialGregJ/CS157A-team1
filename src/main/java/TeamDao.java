import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TeamDao {
    private String dburl = "jdbc:mysql://localhost:3306/deep-drive"; // Change to your database URL
    private String dbuname = "root";  // Update with your username
    private String dbpassword = "CS157!";   // Update with your password
    private String dbdriver = "com.mysql.jdbc.Driver"; // Ensure you have the MySQL driver

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

    public List<Team> getTeams() {
        loadDriver(dbdriver);
        Connection con = getConnection();
        List<Team> teams = new ArrayList<>();

        String query = "SELECT * FROM team";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Team team = new Team();
                team.setName(rs.getString("Name"));
                team.setCity(rs.getString("City"));
                team.setStadium(rs.getString("Stadium"));
                teams.add(team);
                
                System.out.println("Retrived Team: " + team.getName());
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return teams;
    }
}
