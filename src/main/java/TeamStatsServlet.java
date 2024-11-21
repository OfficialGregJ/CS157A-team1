import java.io.IOException;
import java.util.List;

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

        // Fetch team names and pass them to the JSP
        List<String> teamNames = statsDao.getAllTeams();
        request.setAttribute("teamNames", teamNames);

        // Handle specific team stats if a team is selected
        String team = request.getParameter("team");
        if (team != null && !team.isEmpty()) {
            TeamStats stats = statsDao.getTeamStats(team);
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
            } else {
                request.setAttribute("errorMessage", "No statistics found for team: " + team);
            }
        }

        request.getRequestDispatcher("teamStats.jsp").forward(request, response);
    }
}

