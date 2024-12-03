import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteTeamAndStatsServlet")
public class DeleteTeamAndStatsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String teamName = request.getParameter("teamName");

        if (teamName != null && !teamName.trim().isEmpty()) {
            TeamDao teamDao = new TeamDao();
            TeamStatsDao statsDao = new TeamStatsDao();

            // Delete team statistics
            statsDao.deleteTeamStats(teamName);

            // Delete the team
            teamDao.deleteTeam(teamName);

            // Redirect back to the management page
            response.sendRedirect("manageTeams.jsp");
        } else {
            response.sendRedirect("manageTeams.jsp?error=Invalid team name");
        }
    }
}
