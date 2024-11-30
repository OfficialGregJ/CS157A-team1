import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TeamServlet")
public class TeamServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        TeamDao teamDao = new TeamDao();

        // Check if a team name is passed as a parameter
        String selectedTeam = request.getParameter("team");
        if (selectedTeam != null) {
            // Fetch the team's details along with stats
            Team team = teamDao.getTeamDetailsWithStats(selectedTeam);
            if (team != null) {
                request.setAttribute("teamName", team.getName());
                request.setAttribute("city", team.getCity());
                request.setAttribute("stadium", team.getStadium());

                TeamStats stats = team.getStats();
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
                }
            } else {
                request.setAttribute("errorMessage", "No team details found for: " + selectedTeam);
            }

            // Forward to the teamDetails.jsp page
            request.getRequestDispatcher("teamDetails.jsp").forward(request, response);
            return; // Stop further execution
        }

        // Otherwise, fetch all team names and display them
        List<String> teamNames = teamDao.getAllTeamNames();
        request.setAttribute("teamNames", teamNames);
        request.getRequestDispatcher("displayTeams.jsp").forward(request, response);
    }
}

