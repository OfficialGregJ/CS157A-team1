package com;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import com.Player;
import com.Team;


public class FavoriteDao {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/deep-drive";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "admin";

    private static FavoriteDao instance;

    private FavoriteDao() {
        loadDriver("com.mysql.cj.jdbc.Driver");
    }

    public static synchronized FavoriteDao getInstance() {
        if (instance == null) {
            instance = new FavoriteDao();
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

    public List<String> getFavoriteTeams(String username) {
        List<String> favoriteTeams = new ArrayList<>();
        String query = "SELECT Teams FROM `deep-drive`.favorites WHERE User = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, username);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    String teams = rs.getString("Teams");
                    if (teams != null && !teams.trim().isEmpty()) {
                    	favoriteTeams.add(teams);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return favoriteTeams;
    }

    public List<String> getFavoritePlayers(String username) {
        List<String> favoritePlayers = new ArrayList<>();
        String query = "SELECT Players FROM `deep-drive`.favorites WHERE User = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, username);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    String players = rs.getString("Players");
                    if (players != null && !players.trim().isEmpty()) {
                    	favoritePlayers.add(players);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return favoritePlayers;
    }


    public void addFavoritePlayer(String username, String playerName) throws SQLException {
        String selectQuery = "SELECT Players FROM `deep-drive`.favorites WHERE User = ?";
        String updateQuery = "UPDATE `deep-drive`.favorites SET Players = ? WHERE User = ?";
        String insertQuery = "INSERT INTO `deep-drive`.favorites (User, Players) VALUES (?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement selectStmt = conn.prepareStatement(selectQuery)) {
            selectStmt.setString(1, username);

            try (ResultSet rs = selectStmt.executeQuery()) {
                if (rs.next()) {
                    String currentPlayers = rs.getString("Players");
                    if (currentPlayers == null || currentPlayers.trim().isEmpty()) {
                        // No players exist, simply add the new player
                        try (PreparedStatement updateStmt = conn.prepareStatement(updateQuery)) {
                            updateStmt.setString(1, playerName.trim());
                            updateStmt.setString(2, username);
                            updateStmt.executeUpdate();
                        }
                    } else {
                        // Check for duplicates
                        List<String> playerList = new ArrayList<>(Arrays.asList(currentPlayers.split(",\\s*")));
                        if (!playerList.contains(playerName.trim())) {
                            playerList.add(playerName.trim());
                            String updatedPlayers = String.join(", ", playerList).trim();
                            try (PreparedStatement updateStmt = conn.prepareStatement(updateQuery)) {
                                updateStmt.setString(1, updatedPlayers);
                                updateStmt.setString(2, username);
                                updateStmt.executeUpdate();
                            }
                        }
                    }
                } else {
                    // User doesn't exist, insert a new row
                    try (PreparedStatement insertStmt = conn.prepareStatement(insertQuery)) {
                        insertStmt.setString(1, username);
                        insertStmt.setString(2, playerName.trim());
                        insertStmt.executeUpdate();
                    }
                }
            }
        }
    }
  
    public void addFavoriteTeam(String username, String teamName) throws SQLException {
        String selectQuery = "SELECT Teams FROM `deep-drive`.favorites WHERE User = ?";
        String updateQuery = "UPDATE `deep-drive`.favorites SET Teams = CONCAT(IFNULL(Teams, ''), ?, ?) WHERE User = ?";
        String insertQuery = "INSERT INTO `deep-drive`.favorites (User, Teams) VALUES (?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement selectStmt = conn.prepareStatement(selectQuery)) {

            selectStmt.setString(1, username);
            try (ResultSet rs = selectStmt.executeQuery()) {
                if (rs.next()) {
                    String currentTeams = rs.getString("Teams");
                    if (currentTeams == null || currentTeams.trim().isEmpty()) {
                        // No existing teams, add directly
                        try (PreparedStatement updateStmt = conn.prepareStatement(updateQuery)) {
                            updateStmt.setString(1, "");
                            updateStmt.setString(2, teamName);
                            updateStmt.setString(3, username);
                            updateStmt.executeUpdate();
                        }
                    } else if (!Arrays.asList(currentTeams.split(", ")).contains(teamName)) {
                        // Append the new team if not already present
                        try (PreparedStatement updateStmt = conn.prepareStatement(updateQuery)) {
                            updateStmt.setString(1, ", ");
                            updateStmt.setString(2, teamName);
                            updateStmt.setString(3, username);
                            updateStmt.executeUpdate();
                        }
                    }
                } else {
                    // Insert a new row if user doesn't exist
                    try (PreparedStatement insertStmt = conn.prepareStatement(insertQuery)) {
                        insertStmt.setString(1, username);
                        insertStmt.setString(2, teamName);
                        insertStmt.executeUpdate();
                    }
                }
            }
        }
    }


    
    
    public void removeFavoritePlayer(String username, String playerName) throws SQLException {
        String selectQuery = "SELECT Players FROM `deep-drive`.favorites WHERE User = ?";
        String updateQuery = "UPDATE `deep-drive`.favorites SET Players = ? WHERE User = ?";

        try (Connection conn = getConnection();
             PreparedStatement selectStmt = conn.prepareStatement(selectQuery)) {
            selectStmt.setString(1, username);
            try (ResultSet rs = selectStmt.executeQuery()) {
                if (rs.next()) {
                    String currentPlayers = rs.getString("Players");
                    if (currentPlayers != null) {
                    	List<String> playerList = new ArrayList<>(Arrays.asList(currentPlayers.trim().replaceAll("^,|,$", "").split(",\\s*")));
                        if (playerList.contains(playerName)) {
                            playerList.remove(playerName);
                            String updatedPlayers = String.join(", ", playerList).trim();
                            if (updatedPlayers.isEmpty()) {
                                // If no players are left, update the column to an empty string
                                updatedPlayers = "";
                            }
                            try (PreparedStatement updateStmt = conn.prepareStatement(updateQuery)) {
                                updateStmt.setString(1, updatedPlayers);
                                updateStmt.setString(2, username);
                                updateStmt.executeUpdate();
                                System.out.println("Player removed successfully. Updated players: " + updatedPlayers);
                            }
                        }
                    }
                }
            }
        }
    }

    
    
    public void removeFavoriteTeam(String username, String teamName) throws SQLException {
        String selectQuery = "SELECT Teams FROM `deep-drive`.favorites WHERE User = ?";
        String updateQuery = "UPDATE `deep-drive`.favorites SET Teams = ? WHERE User = ?";

        System.out.println("Removing team: " + teamName + " for user: " + username);

        try (Connection conn = getConnection();
             PreparedStatement selectStmt = conn.prepareStatement(selectQuery)) {

            selectStmt.setString(1, username);
            try (ResultSet rs = selectStmt.executeQuery()) {
                if (rs.next()) {
                    String currentTeams = rs.getString("Teams");
                    System.out.println("Current teams: " + currentTeams);

                    if (currentTeams != null && !currentTeams.isEmpty()) {
                    	List<String> teams = new ArrayList<>(Arrays.asList(currentTeams.trim().replaceAll("^,|,$", "").split(",\\s*")));
                        if (teams.remove(teamName)) {
                            String updatedTeams = String.join(", ", teams).trim();
                            if (updatedTeams.isEmpty()) {
                            	updatedTeams = "";
                            }

                            try (PreparedStatement updateStmt = conn.prepareStatement(updateQuery)) {
                                updateStmt.setString(1, updatedTeams);
                                updateStmt.setString(2, username);
                                updateStmt.executeUpdate();
                                System.out.println("Team removed successfully.");
                            }
                        } else {
                            System.out.println("Team not found in the list.");
                        }
                    }
                }
            }
        }
    }

    
    
    
    public Team getTeamByName(String name) {
        Team team = null;
        String query = "SELECT * FROM `deep-drive`.team WHERE Name = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, name);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                	team = new Team(
                      rs.getString("Name"),
                      rs.getString("City"),
                      rs.getString("Stadium"),
                      null
                	);
     
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return team;
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
                        rs.getInt("YearInNBA"),
                        rs.getString("image_url")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return player;
    }
}