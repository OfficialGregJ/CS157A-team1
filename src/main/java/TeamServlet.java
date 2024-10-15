import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DisplayTeams")
public class TeamServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TeamDao teamDao = new TeamDao();
        List<Team> teams = teamDao.getTeams();
        
        System.out.println("Teams retrieved: " + teams);

        // Set teams as a request attribute and forward to JSP
        request.setAttribute("teams", teams);
        request.getRequestDispatcher("displayTeams.jsp").forward(request, response);
    }
}
