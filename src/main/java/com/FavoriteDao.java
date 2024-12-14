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
    private static final String JDBC_PASSWORD = "password123";

    private static FavoriteDao instance;

    private FavoriteDao() {
        loadDriver("com.mysql.cj.jdbc.Driver"); //Loads the SQL driver whenever a new FavoriteDao object created
    }

    public static synchronized FavoriteDao getInstance() { //Creates a new instance of FavoriteDao object to run methods
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

    private Connection getConnection() throws SQLException { //Gets all the favorite teams for the current user and returns as a list
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
    }

    public List<String> getFavoriteTeams(String username) {  //Gets all the favorite teams for the current user and returns as a list
        List<String> favoriteTeams = new ArrayList<>();
        String query = "SELECT Teams FROM `deep-drive`.favorites WHERE User = ?"; //SQL statement to query favorite teams for current user

        try (Connection conn = getConnection(); //Established connection to the database
             PreparedStatement pstmt = conn.prepareStatement(query)) { //Runs query for favorite teams
            pstmt.setString(1, username);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    String teams = rs.getString("Teams");
                    if (teams != null && !teams.trim().isEmpty()) {
                    	favoriteTeams.add(teams); //Adds favorite team to the list
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return favoriteTeams;
    }

    public List<String> getFavoritePlayers(String username) { //Gets all the favorite players for the current user and returns as a list
        List<String> favoritePlayers = new ArrayList<>();
        String query = "SELECT Players FROM `deep-drive`.favorites WHERE User = ?"; //SQL statement to query favorite players for current user

        try (Connection conn = getConnection(); //Established connection to the database
             PreparedStatement pstmt = conn.prepareStatement(query)) { //Runs query for favorite players
            pstmt.setString(1, username);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    String players = rs.getString("Players");
                    if (players != null && !players.trim().isEmpty()) {
                    	favoritePlayers.add(players); //Adds favorite player to the list
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return favoritePlayers;
    }


    public void addFavoritePlayer(String username, String playerName) throws SQLException { //Function for adding a new favorite player for the user to the table
        String selectQuery = "SELECT Players FROM `deep-drive`.favorites WHERE User = ?"; //SQL query statements for selecting, updating, and inserting a favorite player respectively
        String updateQuery = "UPDATE `deep-drive`.favorites SET Players = ? WHERE User = ?";
        String insertQuery = "INSERT INTO `deep-drive`.favorites (User, Players) VALUES (?, ?)";

        try (Connection conn = getConnection(); //Established connection to the database
             PreparedStatement selectStmt = conn.prepareStatement(selectQuery)) {
            selectStmt.setString(1, username);

            try (ResultSet rs = selectStmt.executeQuery()) { //Runs the query for selecting a favorite player from the table
                if (rs.next()) {
                    String currentPlayers = rs.getString("Players");
                    if (currentPlayers == null || currentPlayers.trim().isEmpty()) { //No players exist, add the new player
                        try (PreparedStatement updateStmt = conn.prepareStatement(updateQuery)) {
                            updateStmt.setString(1, playerName.trim()); 
                            updateStmt.setString(2, username);
                            updateStmt.executeUpdate();
                        }
                    } else { //Check for duplicates
                        List<String> playerList = new ArrayList<>(Arrays.asList(currentPlayers.split(",\\s*")));
                        if (!playerList.contains(playerName.trim())) { //Checks if any duplicates for players already exists
                            playerList.add(playerName.trim());
                            String updatedPlayers = String.join(", ", playerList).trim();
                            try (PreparedStatement updateStmt = conn.prepareStatement(updateQuery)) { //If not already there, updates the table to include the new favorite player
                                updateStmt.setString(1, updatedPlayers);
                                updateStmt.setString(2, username);
                                updateStmt.executeUpdate();
                            }
                        }
                    }
                } else { // User doesn't exist, insert a new row
                    try (PreparedStatement insertStmt = conn.prepareStatement(insertQuery)) { //Inserts a new favorite player mapped to the user
                        insertStmt.setString(1, username);
                        insertStmt.setString(2, playerName.trim());
                        insertStmt.executeUpdate();
                    }
                }
            }
        }
    }
  
    public void addFavoriteTeam(String username, String teamName) throws SQLException { //Function for adding a new favorite player for the user to the table
        String selectQuery = "SELECT Teams FROM `deep-drive`.favorites WHERE User = ?"; //SQL query statements for selecting, updating, and inserting a favorite team respectively
        String updateQuery = "UPDATE `deep-drive`.favorites SET Teams = CONCAT(IFNULL(Teams, ''), ?, ?) WHERE User = ?";
        String insertQuery = "INSERT INTO `deep-drive`.favorites (User, Teams) VALUES (?, ?)";

        try (Connection conn = getConnection(); //Established connection to the database
             PreparedStatement selectStmt = conn.prepareStatement(selectQuery)) {

            selectStmt.setString(1, username);
            try (ResultSet rs = selectStmt.executeQuery()) { //Runs the query for selecting a favorite team from the table
                if (rs.next()) {
                    String currentTeams = rs.getString("Teams");
                    if (currentTeams == null || currentTeams.trim().isEmpty()) { //No players exist, add the new team   
                        try (PreparedStatement updateStmt = conn.prepareStatement(updateQuery)) {
                            updateStmt.setString(1, "");
                            updateStmt.setString(2, teamName);
                            updateStmt.setString(3, username);
                            updateStmt.executeUpdate();
                        }
                    } else if (!Arrays.asList(currentTeams.split(", ")).contains(teamName)) { //Checks if any duplicates for teams already exists
                        try (PreparedStatement updateStmt = conn.prepareStatement(updateQuery)) { //If not already there, updates the table to include the new favorite team
                            updateStmt.setString(1, ", ");
                            updateStmt.setString(2, teamName);
                            updateStmt.setString(3, username);
                            updateStmt.executeUpdate();
                        }
                    }
                } else {
                    try (PreparedStatement insertStmt = conn.prepareStatement(insertQuery)) { //Inserts a new favorite team mapped to the user
                        insertStmt.setString(1, username);
                        insertStmt.setString(2, teamName);
                        insertStmt.executeUpdate();
                    }
                }
            }
        }
    }


    
    
    public void removeFavoritePlayer(String username, String playerName) throws SQLException { //Removes a favorite player for the user
        String selectQuery = "SELECT Players FROM `deep-drive`.favorites WHERE User = ?"; //SQL statements to select the desired player to be removed and removing that player respectively
        String updateQuery = "UPDATE `deep-drive`.favorites SET Players = ? WHERE User = ?";

        try (Connection conn = getConnection(); //Established connection to the database
             PreparedStatement selectStmt = conn.prepareStatement(selectQuery)) {
            selectStmt.setString(1, username);
            try (ResultSet rs = selectStmt.executeQuery()) {
                if (rs.next()) {
                    String currentPlayers = rs.getString("Players");
                    if (currentPlayers != null) {
                    	List<String> playerList = new ArrayList<>(Arrays.asList(currentPlayers.trim().replaceAll("^,|,$", "").split(",\\s*"))); //Gets a list of all favorite players by the user if the list of favorite players is not null
                        if (playerList.contains(playerName)) {
                            playerList.remove(playerName); //Removes the favorite player for the user
                            String updatedPlayers = String.join(", ", playerList).trim();
                            if (updatedPlayers.isEmpty()) {
                                updatedPlayers = ""; //If no players are left, update the column to an empty string
                            }
                            try (PreparedStatement updateStmt = conn.prepareStatement(updateQuery)) { //Updates the table with the removed player
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

    
    
    public void removeFavoriteTeam(String username, String teamName) throws SQLException { //Removes a favorite team for the user
        String selectQuery = "SELECT Teams FROM `deep-drive`.favorites WHERE User = ?"; //SQL statements to select the desired team to be removed and removing that player respectively
        String updateQuery = "UPDATE `deep-drive`.favorites SET Teams = ? WHERE User = ?";

        System.out.println("Removing team: " + teamName + " for user: " + username);

        try (Connection conn = getConnection(); //Established connection to the database
             PreparedStatement selectStmt = conn.prepareStatement(selectQuery)) {

            selectStmt.setString(1, username);
            try (ResultSet rs = selectStmt.executeQuery()) { //Executes select query
                if (rs.next()) {
                    String currentTeams = rs.getString("Teams");
                    System.out.println("Current teams: " + currentTeams);

                    if (currentTeams != null && !currentTeams.isEmpty()) {
                    	List<String> teams = new ArrayList<>(Arrays.asList(currentTeams.trim().replaceAll("^,|,$", "").split(",\\s*"))); //Gets a list of all favorite players by the user if the list of favorite players is not null
                        if (teams.remove(teamName)) { //Removes the favorite player for the user
                            String updatedTeams = String.join(", ", teams).trim();
                            if (updatedTeams.isEmpty()) {
                            	updatedTeams = "";  //If no team are left, update the column to an empty string
                            }

                            try (PreparedStatement updateStmt = conn.prepareStatement(updateQuery)) {  //Updates the table with the removed team
                                updateStmt.setString(1, updatedTeams);
                                updateStmt.setString(2, username);
                                updateStmt.executeUpdate();
                                System.out.println("Team removed successfully.");
                            }
                        } else {
                            System.out.println("Team not found in the list."); //Throws error when the team does not exist in the list in the first place
                        }
                    }
                }
            }
        }
    }

    
    
    
    public Team getTeamByName(String name) { //Gets a requested team by their name, returns that Team
        Team team = null;
        String query = "SELECT * FROM `deep-drive`.team WHERE Name = ?"; //SQL statement to select the desired team by its' name
        try (Connection conn = getConnection(); //Established connection to database
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, name);
            try (ResultSet rs = pstmt.executeQuery()) { //Executes select query
                if (rs.next()) { //If not at last row, retrieve team info and store into a Team object
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
        return team; //Return desired team
    }


    public Player getPlayerByName(String name) { //Gets a requested team by their name, returns that Player
        Player player = null;
        String query = "SELECT * FROM `deep-drive`.player WHERE Name = ?"; //SQL statement to select the desired player by its' name
        try (Connection conn = getConnection(); //Established connection to database
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, name);
            try (ResultSet rs = pstmt.executeQuery()) { //Executes select query
                if (rs.next()) { //If not at last row, retrieve team info and store into a Player object
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
        return player; //Return desired player
    }
}