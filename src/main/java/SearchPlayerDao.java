import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.Player;

public class SearchPlayerDao {
    private String dburl = "jdbc:mysql://localhost:3306/deep-drive";
    private String dbuname = "root";
    private String dbpassword = "admin";
    private String dbdriver = "com.mysql.cj.jdbc.Driver";
    
    public List<Player> searchPlayers(String name, String position) {
        List<Player> players = new ArrayList<>();
        
        try {
            Class.forName(dbdriver);
            try (Connection con = DriverManager.getConnection(dburl, dbuname, dbpassword);
                 PreparedStatement pst = con.prepareStatement(
                     "SELECT * FROM player WHERE Name LIKE ? AND (? IS NULL OR Position LIKE ?)")) {
                
                pst.setString(1, "%" + name + "%");
                pst.setString(2, position);
                pst.setString(3, "%" + position + "%");
                
                try (ResultSet rs = pst.executeQuery()) {
                    while (rs.next()) {
                        Player player = new Player(position, position, position, 0, position, 0, position, 0, position);
                        player.setName(rs.getString("Name"));
                        player.setTeam(rs.getString("Team"));
                        player.setPosition(rs.getString("Position"));
                        player.setAge(rs.getInt("Age"));
                        player.setHeight(rs.getString("Height"));
                        player.setWeight(rs.getDouble("Weight"));
                        player.setCollege(rs.getString("College"));
                        player.setYearInNBA(rs.getInt("YearInNBA"));
                        players.add(player);
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        
        return players;
    }
}