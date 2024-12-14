import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.User;

public class UserDao {
    private String dburl = "jdbc:mysql://localhost:3306/deep-drive";
    private String dbuname = "root";
    private String dbpassword = "password123";
    private String dbdriver = "com.mysql.cj.jdbc.Driver";

    public void loadDriver(String dbDriver) { //Loading driver
        try {
            Class.forName(dbDriver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() { //Establishes connection to database using the url, username, and user password
        Connection con = null;
        try {
            con = DriverManager.getConnection(dburl, dbuname, dbpassword);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }

    public List<User> getAllUsers() { //Returns list of all users, queries "users" table to retrieve all users
        loadDriver(dbdriver);
        Connection con = getConnection();
        List<User> users = new ArrayList<>();
        String query = "SELECT Username, Email FROM `deep-drive`.users";

        try (PreparedStatement ps = con.prepareStatement(query); //Runs query onto database table
             ResultSet rs = ps.executeQuery()) { 
            while (rs.next()) {
                User user = new User();
                user.setUname(rs.getString("Username"));
                user.setEmail(rs.getString("Email"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public String deleteUser(String username) { //Deletes user from "users" table given the user's username
        loadDriver(dbdriver);
        Connection con = getConnection();
        String result = "User deleted successfully";
        String sql = "DELETE FROM `deep-drive`.users WHERE Username = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) { //Runs query onto database table
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            result = "Failed to delete user";
        }
        return result;
    }
}