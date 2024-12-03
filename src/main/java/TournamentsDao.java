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
        String sql = "SELECT t.TournamentName, t.Date, t.Team1, t.Team2, t.Winner, t.Location, t.video_url, " +
                "ts.Team1Pts, ts.Team2Pts, ts.Team1Rebounds, ts.Team2Rebounds, " +
                "ts.Team1Assists, ts.Team2Assists, ts.Team1Blocks, ts.Team2Blocks, " +
                "ts.`Team1FT%`, ts.`Team2FT%`, ts.`Team13PT%`, ts.`Team23PT%`, " +
                "ts.Team1TO, ts.Team2TO " +
                "FROM tournaments t " +
                "JOIN tournament_stats ts " +
                "ON t.TournamentName = ts.TournamentName AND t.Date = ts.Date " +
                "WHERE t.TournamentName = ?";

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
                tournament.setVideoUrl(rs.getString("video_url"));
                tournament.setTeam1Pts(rs.getInt("Team1Pts"));
                tournament.setTeam2Pts(rs.getInt("Team2Pts"));
                tournament.setTeam1Rebounds(rs.getInt("Team1Rebounds"));
                tournament.setTeam2Rebounds(rs.getInt("Team2Rebounds"));
                tournament.setTeam1Assists(rs.getInt("Team1Assists"));
                tournament.setTeam2Assists(rs.getInt("Team2Assists"));
                tournament.setTeam1Blocks(rs.getInt("Team1Blocks"));
                tournament.setTeam2Blocks(rs.getInt("Team2Blocks"));
                tournament.setTeam1FT(rs.getDouble("Team1FT%"));
                tournament.setTeam2FT(rs.getDouble("Team2FT%"));
                tournament.setTeam13PT(rs.getDouble("Team13PT%"));
                tournament.setTeam23PT(rs.getDouble("Team23PT%"));
                tournament.setTeam1TO(rs.getInt("Team1TO"));
                tournament.setTeam2TO(rs.getInt("Team2TO"));
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
