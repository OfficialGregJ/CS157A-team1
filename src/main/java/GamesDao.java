import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GamesDao {
    private String dburl = "jdbc:mysql://localhost:3306/deep-drive"; // Update with your DB name
    private String dbuname = "root"; // Update with your DB username
    private String dbpassword = "password123"; // Update with your DB password
    private String dbdriver = "com.mysql.jdbc.Driver";

    public void loadDriver(String dbDriver) {
        try {
            Class.forName(dbDriver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    
    public List<String> getAllDates() {
        loadDriver(dbdriver);
        List<String> dates = new ArrayList<>();
        String sql = "SELECT DISTINCT Date FROM `deep-drive`.games ORDER BY Date";
        try (Connection con = DriverManager.getConnection(dburl, dbuname, dbpassword);
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                dates.add(rs.getString("Date"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dates;
    }

    public Game getAllGameDetails(String date) {
        loadDriver(dbdriver);
        Connection con = null;
        Game game = null;
        String sql = "SELECT * FROM `deep-drive`.games WHERE Date = ?";

        try {
            con = DriverManager.getConnection(dburl, dbuname, dbpassword);
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, date);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
            	game = new Game();
                game.setDate(rs.getString("Date"));
                game.setTeam1(rs.getString("Team1"));
                game.setTeam2(rs.getString("Team2"));
                game.setWinner(rs.getString("Winner"));
                game.setLoser(rs.getString("Loser"));
                game.setLocation(rs.getString("Location"));

            } else {
                // Handle case when team is not found
                System.out.println("No stats found for game: " + game);
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
        return game;
    }

}