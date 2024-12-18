import java.sql.*;
import com.Player;


public class PlayerProfileDao {
    private String dburl = "jdbc:mysql://localhost:3306/deep-drive";
    private String dbuname = "root";
    private String dbpassword = "password123";
    private String dbdriver = "com.mysql.cj.jdbc.Driver";

    // Function gets basic information about player from the db
    public Player getPlayerByName(String name) {
        Player player = null;
        try {
            Class.forName(dbdriver);
            try (Connection con = DriverManager.getConnection(dburl, dbuname, dbpassword);
                 PreparedStatement ps = con.prepareStatement("SELECT * FROM `deep-drive`.player WHERE Name = ?")) {

                ps.setString(1, name);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        player = new Player(
                            rs.getString("Name"),
                            rs.getString("Team"),
                            rs.getString("Position"),
                            rs.getInt("Age"),
                            rs.getString("Height"),
                            rs.getDouble("Weight"),
                            rs.getString("College"),
                            rs.getInt("YearInNBA"),
                            rs.getString("image_url")
                        );
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return player;
    }

    // Function gets actual player statistics from db
    public PlayerStats getPlayerStatsByName(String name) {
        PlayerStats stats = null;
        try {
            Class.forName(dbdriver);
            try (Connection con = DriverManager.getConnection(dburl, dbuname, dbpassword);
                 PreparedStatement ps = con.prepareStatement("SELECT * FROM `deep-drive`.player_stats WHERE Name = ?")) {

                ps.setString(1, name);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        stats = new PlayerStats();
                        stats.setPPG(rs.getDouble("PPG"));
                        stats.setAPG(rs.getDouble("APG"));
                        stats.setBPG(rs.getDouble("BPG"));
                        stats.setSPG(rs.getDouble("SPG"));
                        stats.setRPG(rs.getDouble("RPG"));
                        stats.setFTPercentage(rs.getDouble("FT%"));
                        stats.setThreePTPercentage(rs.getDouble("3PT%"));
                        stats.setTOPG(rs.getDouble("TOPG"));
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return stats;
    }
}
