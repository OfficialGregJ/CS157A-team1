import com.GamesDao;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddGameServlet")
public class AddGameServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String date = request.getParameter("date");
        String team1 = request.getParameter("team1");
        String team2 = request.getParameter("team2");
        String winner = request.getParameter("winner");
        String loser = request.getParameter("loser");
        String location = request.getParameter("location");
        String videoUrl = request.getParameter("videoUrl");

        com.GamesDao gamesDao = new GamesDao();
        try {
            gamesDao.addGame(date, team1, team2, winner, loser, location, videoUrl);
            response.sendRedirect("manageGames.jsp?success=Game added successfully");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manageGames.jsp?error=Failed to add game");
        }
    }
}
