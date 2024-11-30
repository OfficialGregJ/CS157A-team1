import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;



public class UserRegisterDao {
	private String dburl="jdbc:mysql://localhost:3306/deep-drive";
	private String dbuname="root";
	private String dbpassword="password123";
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
}
