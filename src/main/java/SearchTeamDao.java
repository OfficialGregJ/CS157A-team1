import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.Team;


public class SearchTeamDao {
    private String dburl = "jdbc:mysql://localhost:3306/deep-drive";
    private String dbuname = "root";
    private String dbpassword = "admin";
    private String dbdriver = "com.mysql.cj.jdbc.Driver";
    
    public List<Team> searchTeams(String name, String city) {
        List<Team> teams = new ArrayList<>();
        
        try {
            Class.forName(dbdriver);
            try (Connection con = DriverManager.getConnection(dburl, dbuname, dbpassword);
                 PreparedStatement pst = con.prepareStatement(
                     "SELECT * FROM team WHERE Name LIKE ? AND (? IS NULL OR City LIKE ?)")) {
                
                pst.setString(1, "%" + name + "%");
                pst.setString(2, city);
                pst.setString(3, "%" + city + "%");
                
                try (ResultSet rs = pst.executeQuery()) {
                    while (rs.next()) {
                        Team team = new Team();
                        team.setName(rs.getString("Name"));
                        team.setCity(rs.getString("City"));
                        team.setStadium(rs.getString("Stadium"));
                        teams.add(team);
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        
        return teams;
    }
}