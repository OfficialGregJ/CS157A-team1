import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GamesServlet")
public class GamesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        GamesDao gamesDao = new GamesDao();

        // Check if a specific date is provided
        String date = request.getParameter("date");

        if (date != null && !date.isEmpty()) {
            List<Object[]> games = gamesDao.getGamesByDate(date);
            Map<String, List<Map<String, Object>>> playerStatsByTeam = new HashMap<>();
            

            int gameIndex = 1;
            for (Object[] game : games) {
            	String team1 = (String) game[1];
            	String team2 = (String) game[2];
            	
            	// Retrieve player stats for the given teams
                List<Map<String, Object>> team1Stats = gamesDao.getPlayerStatsByTeamAndDate(date, team1);
                List<Map<String, Object>> team2Stats = gamesDao.getPlayerStatsByTeamAndDate(date, team2);

                // Add player stats to the map
                playerStatsByTeam.put("game" + gameIndex + "_team1Stats", team1Stats);
                playerStatsByTeam.put("game" + gameIndex + "_team2Stats", team2Stats);
            	
            	
                request.setAttribute("game" + gameIndex + "_date", game[0]);
                request.setAttribute("game" + gameIndex + "_team1", game[1]);
                request.setAttribute("game" + gameIndex + "_team2", game[2]);
                request.setAttribute("game" + gameIndex + "_winner", game[3]);
                request.setAttribute("game" + gameIndex + "_loser", game[4]);
                request.setAttribute("game" + gameIndex + "_location", game[5]);
                request.setAttribute("game" + gameIndex + "_videoUrl", game[6]);
                request.setAttribute("game" + gameIndex + "_team1Pts", game[7]);
                request.setAttribute("game" + gameIndex + "_team2Pts", game[8]);
                request.setAttribute("game" + gameIndex + "_team1Rebounds", game[9]);
                request.setAttribute("game" + gameIndex + "_team2Rebounds", game[10]);
                request.setAttribute("game" + gameIndex + "_team1Assists", game[11]);
                request.setAttribute("game" + gameIndex + "_team2Assists", game[12]);
                request.setAttribute("game" + gameIndex + "_team1Blocks", game[13]);
                request.setAttribute("game" + gameIndex + "_team2Blocks", game[14]);
                request.setAttribute("game" + gameIndex + "_team1FT", game[15]);
                request.setAttribute("game" + gameIndex + "_team2FT", game[16]);
                request.setAttribute("game" + gameIndex + "_team13PT", game[17]);
                request.setAttribute("game" + gameIndex + "_team23PT", game[18]);
                request.setAttribute("game" + gameIndex + "_team1TO", game[19]);
                request.setAttribute("game" + gameIndex + "_team2TO", game[20]);
                gameIndex++;
            }
            request.setAttribute("playerStats", playerStatsByTeam);
            request.setAttribute("gameCount", games.size());
            request.getRequestDispatcher("gamesDetails.jsp").forward(request, response);
        } else {
            List<String> gameDates = gamesDao.getAllDates();
            request.setAttribute("gameDates", gameDates);
            request.getRequestDispatcher("games.jsp").forward(request, response);
        }
    }
}
