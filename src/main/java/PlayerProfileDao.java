import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Player;

public class PlayerProfileDao {
	private String dburl = "jdbc:mysql://localhost:3306/deep-drive";
	private String dbuname = "root";
	private String dbpassword = "";
	private String dbdriver = "com.mysql.cj.jdbc.Driver";

	public com.Player getPlayerByName(String name) {
		Player player = null;
		try {
			Class.forName(dbdriver);
			try (Connection con = DriverManager.getConnection(dburl, dbuname, dbpassword);
					PreparedStatement ps = con
							.prepareStatement("SELECT * FROM `deep-drive`.player WHERE Name = ?")) {

				ps.setString(1, name);
				try (ResultSet rs = ps.executeQuery()) {
					if (rs.next()) {
						player = new Player(rs.getString("Name"), rs.getString("Team"), rs.getString("Position"),
								rs.getInt("Age"), rs.getString("Height"), rs.getDouble("Weight"),
								rs.getString("College"), rs.getInt("YearInNBA"));
					}
				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return player;
	}
}
