import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditTeamServlet")
public class EditTeamServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String originalName = request.getParameter("originalName");
        String newName = request.getParameter("name");
        String city = request.getParameter("city");
        String stadium = request.getParameter("stadium");

        TeamDao teamDao = new TeamDao();

        if (originalName != null && !originalName.isEmpty()) {
            teamDao.updateTeam(originalName, newName, city, stadium);
            response.sendRedirect("manageTeams.jsp");
        } else {
            response.sendRedirect("manageTeams.jsp?error=Team not found.");
        }
    }
}
