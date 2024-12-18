import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class AdminRegisterDao {
	private String dburl = "jdbc:mysql://localhost:3306/deep-drive";
	private String dbuname = "root";
	private String dbpassword = "admin";
	private String dbdriver = "com.mysql.jdbc.Driver";

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
			con = DriverManager.getConnection(dburl,dbuname, dbpassword);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return con;
	}

	public String insert(Admin admin) {
		loadDriver(dbdriver);
		Connection con = getConnection();
		System.out.println("Connection is " + con);
		String result = "Data entered successfully";
		String duplicateSql = "SELECT COUNT(*) FROM `deep-drive`.admin WHERE Username = ? OR Email = ?";
		String sql = "INSERT INTO `deep-drive`.admin (username,password,email) VALUES (?, ?, ?)";
		try {
	        // Check for duplicates
	        PreparedStatement checkStmt = con.prepareStatement(duplicateSql);
	        checkStmt.setString(1, admin.getUname());
	        checkStmt.setString(2, admin.getEmail());
	        ResultSet rs = checkStmt.executeQuery();
	        if (rs.next() && rs.getInt(1) > 0) {
	            result = "Duplicate entry: Username or Email already exists.";
	            return result;
	        }

	        // If no duplicates, insert the new user
	        PreparedStatement insertStmt = con.prepareStatement(sql);
	        insertStmt.setString(1, admin.getUname());
	        insertStmt.setString(2, admin.getPassword());
	        insertStmt.setString(3, admin.getEmail());
	        insertStmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	        result = "Data not entered successfully";
		}
		return result;
	}
}
