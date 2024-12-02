package com;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.Player;

public class FavoritePlayerDao {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/deep-drive";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "admin";

    private static FavoritePlayerDao instance;

    private FavoritePlayerDao() {
        loadDriver("com.mysql.cj.jdbc.Driver");
    }

    public static synchronized FavoritePlayerDao getInstance() {
        if (instance == null) {
            instance = new FavoritePlayerDao();
        }
        return instance;
    }

    private void loadDriver(String dbDriver) {
        try {
            Class.forName(dbDriver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
    }

    public List<String> getFavoritePlayers(String username) {
        List<String> favoritePlayers = new ArrayList<>();
        String query = "SELECT Players FROM `deep-drive`.favorites WHERE User = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, username);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    favoritePlayers.add(rs.getString("Players"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return favoritePlayers;
    }

    public void addFavoritePlayer(String username, String playerName) throws SQLException {
    	String selectQuery = "SELECT Players FROM `deep-drive`.favorites WHERE User = ?";
        String updateQuery = "UPDATE `deep-drive`.favorites SET Players = CONCAT(Players, ', ', ?) WHERE User = ?";
        String insertQuery = "INSERT INTO `deep-drive`.favorites (User, Players) VALUES (?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement selectStmt = conn.prepareStatement(selectQuery)) {
        	// Check if users already has favorites
        	selectStmt.setString(1, username);
        	try (ResultSet rs = selectStmt.executeQuery()) {
        		if (rs.next()) {
        			// User exists, update their favorites
        			try (PreparedStatement updateStmt = conn.prepareStatement(updateQuery)) {
        				updateStmt.setString(1, playerName);
        				updateStmt.setString(2, username);
        				updateStmt.executeUpdate();
        			}
        		} else {
        			// User doesn't exist, insert new row
        			 try (PreparedStatement insertStmt = conn.prepareStatement(insertQuery)) {
                         insertStmt.setString(1, username);
                         insertStmt.setString(2, playerName);
                         insertStmt.executeUpdate();
                     } 
        		}
        	}
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