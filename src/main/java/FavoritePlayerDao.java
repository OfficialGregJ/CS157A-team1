
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Player;

public class FavoritePlayerDao {
    private final String jdbcUrl;
    private final String jdbcUser;
    private final String jdbcPassword;

    public FavoritePlayerDao(String jdbcUrl, String jdbcUser, String jdbcPassword) {
        this.jdbcUrl = jdbcUrl;
        this.jdbcUser = jdbcUser;
        this.jdbcPassword = jdbcPassword;
    }

    public void loadDriver(String dbDriver) {
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public Connection getConnection() {
		Connection con = null;
		try {
			con = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return con;
	}

    public List<String> getFavoritePlayers(String username) {
        List<String> favoritePlayers = new ArrayList<>();
        String query = "SELECT Player FROM `deep-drive`.favorites WHERE Username = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, username);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    favoritePlayers.add(rs.getString("Player"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return favoritePlayers;
    }

    public void addFavoritePlayer(String username, String playerName) throws SQLException {
        String query = "INSERT INTO `deep-drive`.favorites (Username, Player) VALUES (?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, username);
            pstmt.setString(2, playerName);
            pstmt.executeUpdate();
        }
    }

    public Player getPlayerByName(String name) {
        Player player = null;
        String query = "SELECT * FROM `deep-drive`.player WHERE Name = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, name);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    player = new Player(
                        rs.getString("Name"),
                        rs.getString("Team"),
                        rs.getString("Position"),
                        rs.getInt("Age"),
                        rs.getString("Height"),
                        rs.getDouble("Weight"),
                        rs.getString("College"),
                        rs.getInt("YearInNBA")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return player;
    }
}