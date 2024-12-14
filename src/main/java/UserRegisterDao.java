import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;

import com.User;



public class UserRegisterDao {
	private String dburl="jdbc:mysql://localhost:3306/deep-drive";
	private String dbuname="root";
	private String dbpassword="admin";
	private String dbdriver="com.mysql.jdbc.Driver";

	
	public void loadDriver(String dbDriver) { //Load drivers
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public Connection getConnection() { //Establish connection to the database
		Connection con = null;
		try {
			con = DriverManager.getConnection(dburl,dbuname, dbpassword);
		} catch (SQLException e) {
			System.err.println("Failed to establish connection: " + e.getMessage());
			e.printStackTrace();
		}
		return con;
	}
	
	public String insert(User member) { //Insert a new user to the "user" table
		loadDriver(dbdriver);
		Connection con = getConnection();
		System.out.println("Connection is " + con);
		String result = "Data entered successfully";
		String duplicateSql = "SELECT COUNT(*) FROM `deep-drive`.users WHERE Username = ? OR Email = ?"; //SQL statements to check for any duplicates & insert new user to table respectively
		String sql = "INSERT INTO `deep-drive`.users (Username, Password, Email) VALUES (?, ?, ?)";
		
		try { //Check for duplicates
	        PreparedStatement checkStmt = con.prepareStatement(duplicateSql);
	        checkStmt.setString(1, member.getUname());
	        checkStmt.setString(2, member.getEmail());
	        ResultSet rs = checkStmt.executeQuery(); //Runs SQL statement to check occurrences for possible duplicates
	        if (rs.next() && rs.getInt(1) > 0) {
	            result = "Duplicate entry: Username or Email already exists.";
	            return result;
	        }
	        PreparedStatement insertStmt = con.prepareStatement(sql); // If no duplicates, insert the new user
	        insertStmt.setString(1, member.getUname());
	        insertStmt.setString(2, member.getPassword());
	        insertStmt.setString(3, member.getEmail());
	        insertStmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	        result = "Data not entered successfully";
	    }
	    return result;
	}
}
