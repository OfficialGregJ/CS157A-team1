import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;


public class AdminDao {
	private String dburl = "jdbc:mysql://localhost:3306/deep-drive";
	private String dbuname = "root";
	private String dbpassword = "password123";
	private String dbdriver = "com.mysql.jdbc.Driver";
	
	public void loadDriver(String dbDriver) {
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//Establish connection
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
		String sql = "INSERT INTO `deep-drive`.admin (username,password,email) VALUES (?, ?, ?)"; // SQL statement to add new admin to 'admin' table
		try {
			PreparedStatement ps = con.prepareStatement(sql); 
			ps.setString(1, admin.getUname());
			ps.setString(2, admin.getPassword());
			ps.setString(3, admin.getEmail());
			ps.executeUpdate(); //Executed SQL statement
		} catch (SQLException e) {
			
			e.printStackTrace();
			result = "Data not entered successfully";
		}
		return result;
	}
}
