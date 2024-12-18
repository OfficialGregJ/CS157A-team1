
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamStats;

@WebServlet("/AddTeamServlet")
public class AddTeamServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	// Necessary params for teams
        String teamName = request.getParameter("name");
        String city = request.getParameter("city");
        String stadium = request.getParameter("stadium");

        TeamDao teamDao = new TeamDao();
        TeamStatsDao statsDao = new TeamStatsDao();

        try {
            // Add team to the team table
            teamDao.addTeam(teamName, city, stadium);

            // Add default statistics to the team_statistics table
            TeamStats defaultStats = new TeamStats();
            statsDao.addTeamStats(teamName, defaultStats);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("manageTeams.jsp");
    }
}
