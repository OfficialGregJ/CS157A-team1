import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;


<<<<<<<< HEAD:src/main/java/UserDao.java
public class UserDao {
	private String dburl = "jdbc:mysql://localhost:3306/deep-drive";
	private String dbuname = "root";
	private String dbpassword = "";
	private String dbdriver = "com.mysql.cj.jdbc.Driver";
========
public class UserRegisterDao {
	private String dburl="jdbc:mysql://localhost:3306/deep-drive";
	private String dbuname="root";
	private String dbpassword="";
	private String dbdriver="com.mysql.jdbc.Driver";
>>>>>>>> TestingLogin:src/main/java/UserRegisterDao.java
	
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
<<<<<<<< HEAD:src/main/java/UserDao.java
		System.out.println("Connection is " + con);
		String result = "Data entered successfully";
		String sql = "INSERT INTO `deep-drive`.users (Username, Password, Email) VALUES (?, ?, ?)";
========
		String result = "data entered successfully";
		String sql = "INSERT INTO `deep-drive`.users (Username, Password, Email) VALUES (?, ?, ?)";
		
>>>>>>>> TestingLogin:src/main/java/UserRegisterDao.java
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
