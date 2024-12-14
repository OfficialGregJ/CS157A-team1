import com.TournamentDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteTournamentServlet")
public class DeleteTournamentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");

        TournamentDao tournamentDao = new TournamentDao();
        try {
            tournamentDao.deleteTournamentAndStats(name);
            response.sendRedirect("manageTournaments.jsp?success=Tournament deleted successfully");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manageTournaments.jsp?error=Failed to delete tournament");
        }
    }
}
