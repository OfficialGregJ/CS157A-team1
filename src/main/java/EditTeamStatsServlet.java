import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamStats;

@WebServlet("/EditTeamStatsServlet")
public class EditTeamStatsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String teamName = request.getParameter("teamName");

        if (teamName == null || teamName.trim().isEmpty()) {
            response.sendRedirect("manageTeams.jsp?error=Team name is required.");
            return;
        }

        try {
            // Parse form inputs
            double ppg = Double.parseDouble(request.getParameter("ppg").trim());
            double apg = Double.parseDouble(request.getParameter("apg").trim());
            double spg = Double.parseDouble(request.getParameter("spg").trim());
            double bpg = Double.parseDouble(request.getParameter("bpg").trim());
            double topg = Double.parseDouble(request.getParameter("topg").trim());
            double ft = Double.parseDouble(request.getParameter("ft").trim());
            double threePt = Double.parseDouble(request.getParameter("threePt").trim());
            int gamesPlayed = Integer.parseInt(request.getParameter("gamesPlayed").trim());
            int wins = Integer.parseInt(request.getParameter("wins").trim());
            int losses = Integer.parseInt(request.getParameter("losses").trim());
            
            if (ppg < 0 || apg < 0 || spg < 0 || bpg < 0 || topg < 0 || ft < 0 || threePt < 0 || gamesPlayed < 0 || wins < 0 || losses < 0) {
                response.sendRedirect("manageTeams.jsp?error=Statistics cannot have negative values.");
                return;
            }

            // Update stats in the database
            TeamStats stats = new TeamStats();
            stats.setPPG(ppg);
            stats.setAPG(apg);
            stats.setSPG(spg);
            stats.setBPG(bpg);
            stats.setTOPG(topg);
            stats.setFTPercentage(ft);
            stats.setThreePTPercentage(threePt);
            stats.setGamesPlayed(gamesPlayed);
            stats.setWins(wins);
            stats.setLosses(losses);

            TeamStatsDao statsDao = new TeamStatsDao();
            statsDao.updateTeamStats(teamName, stats);

            response.sendRedirect("manageTeams.jsp?success=Stats updated successfully.");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("manageTeams.jsp?error=Invalid input values. Please try again.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manageTeams.jsp?error=An error occurred while updating stats.");
        }
    }
}
