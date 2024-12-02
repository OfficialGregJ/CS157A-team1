import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;



public class UserRegisterDao {
	private String dburl="jdbc:mysql://localhost:3306/deep-drive";
	private String dbuname="root";
	private String dbpassword="admin";
	private String dbdriver="com.mysql.jdbc.Driver";

	
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
			con = DriverManager.getConnection(dburl,dbuname, dbpassword);
		} catch (SQLException e) {
			System.err.println("Failed to establish connection: " + e.getMessage());
			e.printStackTrace();
		}
		return con;
	}
	
	public String insert(User member) {
		loadDriver(dbdriver);
		Connection con = getConnection();
		System.out.println("Connection is " + con);
		String result = "Data entered successfully";
		String duplicateSql = "SELECT COUNT(*) FROM `deep-drive`.users WHERE Username = ? OR Email = ?";
		String sql = "INSERT INTO `deep-drive`.users (Username, Password, Email) VALUES (?, ?, ?)";
		
		try {
	        // Check for duplicates
	        PreparedStatement checkStmt = con.prepareStatement(duplicateSql);
	        checkStmt.setString(1, member.getUname());
	        checkStmt.setString(2, member.getEmail());
	        ResultSet rs = checkStmt.executeQuery();
	        if (rs.next() && rs.getInt(1) > 0) {
	            result = "Duplicate entry: Username or Email already exists.";
	            return result;
	        }

	        // If no duplicates, insert the new user
	        PreparedStatement insertStmt = con.prepareStatement(sql);
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
