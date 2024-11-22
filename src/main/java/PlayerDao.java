import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PlayerDao {
	private String dburl = "jdbc:mysql://localhost:3306/deep-drive";
	private String dbuname = "root";
	private String dbpassword = "password123";
	private String dbdriver = "com.mysql.cj.jdbc.Driver";
    
    public List<String> getAllPlayerNames() {
        List<String> playerNames = new ArrayList<>();
        
        try {
            Class.forName(dbdriver);
            try (Connection con = DriverManager.getConnection(dburl, dbuname, dbpassword);
                 Statement stmt = con.createStatement();
                 ResultSet rs = stmt.executeQuery("SELECT Name FROM `deep-drive`.player")) {
                
                while (rs.next()) {
                    playerNames.add(rs.getString("Name"));
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        
        return playerNames;
    }
}