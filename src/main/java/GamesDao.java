import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class GamesDao {
    private String dburl = "jdbc:mysql://localhost:3306/deep-drive"; // Update with your DB name
    private String dbuname = "root"; // Update with your DB username
    private String dbpassword = "admin"; // Update with your DB password
    private String dbdriver = "com.mysql.jdbc.Driver";

    public void loadDriver(String dbDriver) {
        try {
            Class.forName(dbDriver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    
    public List<String> getAllDates() {
        loadDriver(dbdriver);
        List<String> dates = new ArrayList<>();
        String sql = "SELECT DISTINCT Date FROM `deep-drive`.games ORDER BY Date";
        try (Connection con = DriverManager.getConnection(dburl, dbuname, dbpassword);
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                dates.add(rs.getString("Date"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dates;
    }

    public List<Object[]> getGamesByDate(String date) {
        loadDriver(dbdriver);
        List<Object[]> games = new ArrayList<>();
        String sql = "SELECT g.Date, g.Team1, g.Team2, g.Winner, g.Loser, g.Location, g.video_url, " +
                     "gs.Team1Pts, gs.Team2Pts, gs.Team1Rebounds, gs.Team2Rebounds, " +
                     "gs.Team1Assists, gs.Team2Assists, gs.Team1Blocks, gs.Team2Blocks, " +
                     "gs.`Team1FT%`, gs.`Team2FT%`, gs.`Team13PT%`, gs.`Team23PT%`, " +
                     "gs.Team1TO, gs.Team2TO " +
                     "FROM games g " +
                     "JOIN game_statistics gs " +
                     "ON g.Date = gs.Date AND g.Team1 = gs.Team1 AND g.Team2 = gs.Team2 " +
                     "WHERE g.Date = ?";
        try (Connection con = DriverManager.getConnection(dburl, dbuname, dbpassword);
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, date);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Object[] game = new Object[]{
                    rs.getString("Date"), rs.getString("Team1"), rs.getString("Team2"),
                    rs.getString("Winner"), rs.getString("Loser"), rs.getString("Location"),
                    rs.getString("video_url"), rs.getInt("Team1Pts"), rs.getInt("Team2Pts"),
                    rs.getInt("Team1Rebounds"), rs.getInt("Team2Rebounds"),
                    rs.getInt("Team1Assists"), rs.getInt("Team2Assists"),
                    rs.getInt("Team1Blocks"), rs.getInt("Team2Blocks"),
                    rs.getDouble("Team1FT%"), rs.getDouble("Team2FT%"),
                    rs.getDouble("Team13PT%"), rs.getDouble("Team23PT%"),
                    rs.getInt("Team1TO"), rs.getInt("Team2TO")
                };
                games.add(game);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return games;
    }
    
    public List<Map<String, Object>> getPlayerStatsByTeamAndDate(String date, String team) {
        loadDriver(dbdriver);
        Connection con = null;
        List<Map<String, Object>> playerStats = new ArrayList<>();
        String sql = "SELECT PlayerName, GameDate, PTS, RBS, ATS, BLKS, `FT%`, `3PT%`, TOV, Team " +
                "FROM player_game_stats " +
                "WHERE GameDate = ? AND Team = ?";


        try {
            con = DriverManager.getConnection(dburl, dbuname, dbpassword);
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, date);
            ps.setString(2, team);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, Object> stats = new HashMap<>();
                stats.put("PlayerName", rs.getString("PlayerName"));
                stats.put("GameDate", rs.getString("GameDate"));
                stats.put("PTS", rs.getInt("PTS"));
                stats.put("RBS", rs.getInt("RBS"));
                stats.put("ATS", rs.getInt("ATS"));
                stats.put("BLKS", rs.getInt("BLKS"));
                stats.put("FT%", rs.getDouble("FT%"));
                stats.put("3PT%", rs.getDouble("3PT%"));
                stats.put("TOV", rs.getInt("TOV"));
                stats.put("Team", rs.getString("Team"));
                playerStats.add(stats);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return playerStats;
    }



}