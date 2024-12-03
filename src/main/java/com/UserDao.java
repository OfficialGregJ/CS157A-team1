package com;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    private String dburl = "jdbc:mysql://localhost:3306/deep-drive";
    private String dbuname = "root";
    private String dbpassword = "admin";
    private String dbdriver = "com.mysql.cj.jdbc.Driver";

    public void loadDriver(String dbDriver) {
        try {
            Class.forName(dbDriver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() {
        Connection con = null;
        try {
            con = DriverManager.getConnection(dburl, dbuname, dbpassword);
        } catch (SQLException e) {
            System.err.println("Failed to establish connection: " + e.getMessage());
            e.printStackTrace();
        }
        return con;
    }

    // Insert user
    public String insert(User member) {
        loadDriver(dbdriver);
        Connection con = getConnection();
        String result = "Data entered successfully";
        String sql = "INSERT INTO `deep-drive`.users (Username, Password, Email) VALUES (?, ?, ?)";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, member.getUname());
            ps.setString(2, member.getPassword());
            ps.setString(3, member.getEmail());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            result = "Data not entered successfully";
        }
        return result;
    }

    // Fetch all users
    public List<User> getAllUsers() {
        loadDriver(dbdriver);
        Connection con = getConnection();
        List<User> users = new ArrayList<>();
        String query = "SELECT * FROM `deep-drive`.users";

        try (PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                User user = new User(
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Email")
                );
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }


    // Delete user
    public String deleteUser(String username) {
        loadDriver(dbdriver);
        Connection con = getConnection();
        String result = "User deleted successfully";
        String query = "DELETE FROM `deep-drive`.users WHERE Username = ?";

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected == 0) {
                result = "No user found to delete";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            result = "Failed to delete user";
        }
        return result;
    }
}
