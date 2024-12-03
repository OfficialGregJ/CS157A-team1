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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dates;
    }

    public List<Game> getAllGamesForDate(String date) {
        loadDriver(dbdriver);
        List<Game> games = new ArrayList<>();
        String sql = "SELECT g.Date, g.Team1, g.Team2, g.Winner, g.Loser, g.Location, " +
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
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Game game = new Game();
                    game.setDate(rs.getString("Date"));
                    game.setTeam1(rs.getString("Team1"));
                    game.setTeam2(rs.getString("Team2"));
                    game.setWinner(rs.getString("Winner"));
                    game.setLoser(rs.getString("Loser"));
                    game.setLocation(rs.getString("Location"));
                    game.setTeam1Pts(rs.getInt("Team1Pts"));
                    game.setTeam2Pts(rs.getInt("Team2Pts"));
                    game.setTeam1Rebounds(rs.getInt("Team1Rebounds"));
                    game.setTeam2Rebounds(rs.getInt("Team2Rebounds"));
                    game.setTeam1Assists(rs.getInt("Team1Assists"));
                    game.setTeam2Assists(rs.getInt("Team2Assists"));
                    game.setTeam1Blocks(rs.getInt("Team1Blocks"));
                    game.setTeam2Blocks(rs.getInt("Team2Blocks"));
                    game.setTeam1FT(rs.getDouble("Team1FT%"));
                    game.setTeam2FT(rs.getDouble("Team2FT%"));
                    game.setTeam13PT(rs.getDouble("Team13PT%"));
                    game.setTeam23PT(rs.getDouble("Team23PT%"));
                    game.setTeam1TO(rs.getInt("Team1TO"));
                    game.setTeam2TO(rs.getInt("Team2TO"));
                    games.add(game);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return games;
    }
    public Map<String, List<PlayerGameStats>> getPlayerStatsForGame(String date, String team1, String team2) {
        loadDriver(dbdriver);
        Map<String, List<PlayerGameStats>> playerStatsByTeam = new HashMap<>();
        playerStatsByTeam.put(team1, new ArrayList<>());
        playerStatsByTeam.put(team2, new ArrayList<>());

        String sql = "SELECT * FROM player_game_stats WHERE GameDate = ? AND (Team = ? OR Team = ?)";

        try (Connection con = DriverManager.getConnection(dburl, dbuname, dbpassword);
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, date);
            ps.setString(2, team1);
            ps.setString(3, team2);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    PlayerGameStats stats = new PlayerGameStats();
                    stats.setPlayerName(rs.getString("PlayerName"));
                    stats.setTeam(rs.getString("Team"));
                    stats.setPoints(rs.getInt("PTS"));
                    stats.setRebounds(rs.getInt("RBS"));
                    stats.setAssists(rs.getInt("ATS"));
                    stats.setBlocks(rs.getInt("BLKS"));
                    stats.setFreeThrowPercentage(rs.getDouble("FT%"));
                    stats.setThreePointPercentage(rs.getDouble("3PT%"));
                    stats.setTurnovers(rs.getInt("TOV"));

                    playerStatsByTeam.get(stats.getTeam()).add(stats);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return playerStatsByTeam;
    }
}