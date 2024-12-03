import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamStats;

@WebServlet("/AddTeamStatsServlet")
public class AddTeamStatsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String team = request.getParameter("team");
        double ppg = Double.parseDouble(request.getParameter("ppg"));
        double apg = Double.parseDouble(request.getParameter("apg"));
        double spg = Double.parseDouble(request.getParameter("spg"));
        double bpg = Double.parseDouble(request.getParameter("bpg"));
        double topg = Double.parseDouble(request.getParameter("topg"));
        double ftPercentage = Double.parseDouble(request.getParameter("ftPercentage"));
        double threePTPercentage = Double.parseDouble(request.getParameter("threePTPercentage"));
        int gamesPlayed = Integer.parseInt(request.getParameter("gamesPlayed"));
        int wins = Integer.parseInt(request.getParameter("wins"));
        int losses = Integer.parseInt(request.getParameter("losses"));

        TeamStats stats = new TeamStats();
        stats.setPPG(ppg);
        stats.setAPG(apg);
        stats.setSPG(spg);
        stats.setBPG(bpg);
        stats.setTOPG(topg);
        stats.setFTPercentage(ftPercentage);
        stats.setThreePTPercentage(threePTPercentage);
        stats.setGamesPlayed(gamesPlayed);
        stats.setWins(wins);
        stats.setLosses(losses);

        TeamStatsDao statsDao = new TeamStatsDao();
        statsDao.addTeamStats(team, stats);

        response.sendRedirect("manageTeams.jsp");
    }
}
