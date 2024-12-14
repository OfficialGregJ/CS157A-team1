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
        String date = request.getParameter("date");
        String team1 = request.getParameter("team1");
        String team2 = request.getParameter("team2");
        String winner = request.getParameter("winner");
        String location = request.getParameter("location");
        String videoUrl = request.getParameter("video_url");

        TournamentDao tournamentDao = new TournamentDao();

        try {
        	tournamentDao.updateTournament(
                    originalName, newName, date, team1, team2, winner, location, videoUrl
                );
            response.sendRedirect("manageTournaments.jsp?success=Tournament updated successfully");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("editTournament.jsp?name=" + originalName + "&error=Failed to update tournament");
        }
    }
}
