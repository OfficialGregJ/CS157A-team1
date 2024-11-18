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
            // Fetch the team's details
            Team team = teamDao.getTeamDetails(selectedTeam);  // Assuming you create this method in TeamDao
            if (team != null) {
                request.setAttribute("teamName", team.getName());
                request.setAttribute("city", team.getCity());
                request.setAttribute("stadium", team.getStadium());
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