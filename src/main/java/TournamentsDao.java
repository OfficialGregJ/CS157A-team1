import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TournamentsDao {
    private String dburl = "jdbc:mysql://localhost:3306/deep-drive"; // Update with your DB name
    private String dbuname = "root"; // Update with your DB username
    private String dbpassword = "admin"; // Update with your DB password
    private String dbdriver = "com.mysql.cj.jdbc.Driver";

    public void loadDriver(String dbDriver) {
        try {
            Class.forName(dbDriver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Fetch all unique tournament names
    public List<String> getAllTournamentNames() {
        loadDriver(dbdriver);
        List<String> tournamentNames = new ArrayList<>();
        String sql = "SELECT TournamentName FROM `deep-drive`.tournaments ORDER BY Date";

        try (Connection con = DriverManager.getConnection(dburl, dbuname, dbpassword);
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                tournamentNames.add(rs.getString("TournamentName"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tournamentNames;
    }

    // Fetch tournament details for a specific tournament name
    public Tournament getTournamentDetails(String tournamentName) {
        loadDriver(dbdriver);
        Connection con = null;
        Tournament tournament = null;
        String sql = "SELECT TournamentName, Date, Team1, Team2, Winner, Location " +
                     "FROM `deep-drive`.tournaments WHERE TournamentName = ?";

        try {
            con = DriverManager.getConnection(dburl, dbuname, dbpassword);
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, tournamentName);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                tournament = new Tournament();
                tournament.setName(rs.getString("TournamentName"));
                tournament.setDate(rs.getString("Date"));
                tournament.setTeam1(rs.getString("Team1"));
                tournament.setTeam2(rs.getString("Team2"));
                tournament.setWinner(rs.getString("Winner"));
                tournament.setLocation(rs.getString("Location"));
            } else {
                System.out.println("No details found for tournament: " + tournamentName);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return tournament;
    }
}
