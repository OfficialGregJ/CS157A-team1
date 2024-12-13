import com.TournamentDao;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditTournamentServlet")
public class EditTournamentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String originalName = request.getParameter("originalName");
        String newName = request.getParameter("name");
        String location = request.getParameter("location");
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        Date endDate = Date.valueOf(request.getParameter("endDate"));

        TournamentDao tournamentDao = new TournamentDao();

        try {
            tournamentDao.updateTournament(originalName, newName, location, startDate, endDate);
            response.sendRedirect("manageTournaments.jsp?success=Tournament updated successfully");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("editTournament.jsp?name=" + originalName + "&error=Failed to update tournament");
        }
    }
}
