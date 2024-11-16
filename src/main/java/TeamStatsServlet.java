import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TeamStatsServlet")
public class TeamStatsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TeamStatsDao statsDao = new TeamStatsDao();
        TeamStats stats = statsDao.getTeamStats("Boston Celtics");

        if (stats != null) {
            request.setAttribute("ppg", stats.getPPG());
            request.setAttribute("apg", stats.getAPG());
            request.setAttribute("spg", stats.getSPG());
            request.setAttribute("bpg", stats.getBPG());
            request.setAttribute("topg", stats.getTOPG());
            request.setAttribute("ft", stats.getFTPercentage());
            request.setAttribute("threept", stats.getThreePTPercentage());
            request.setAttribute("gamesPlayed", stats.getGamesPlayed());
            request.setAttribute("wins", stats.getWins());
            request.setAttribute("losses", stats.getLosses());
            request.setAttribute("winPercentage", stats.getWinPercentage());
        } else {
            request.setAttribute("errorMessage", "No statistics found for the Boston Celtics.");
        }

        request.getRequestDispatcher("teamStats.jsp").forward(request, response);
    }
}
