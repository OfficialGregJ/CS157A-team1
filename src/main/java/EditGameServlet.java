import com.GamesDao;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditGameServlet")
public class EditGameServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String originalDate = request.getParameter("originalDate");
        String originalTeam1 = request.getParameter("originalTeam1");
        String originalTeam2 = request.getParameter("originalTeam2");
        String newDate = request.getParameter("newDate");
        String team1 = request.getParameter("team1");
        String team2 = request.getParameter("team2");
        String winner = request.getParameter("winner");
        String loser = request.getParameter("loser");
        String location = request.getParameter("location");
        String videoUrl = request.getParameter("videoUrl");

        com.GamesDao gamesDao = new GamesDao();
        try {
            gamesDao.updateGame(originalDate, originalTeam1, originalTeam2, newDate, team1, team2, winner, loser, location, videoUrl); //Updates the game with the new parameters/statistics for it
            response.sendRedirect("manageGames.jsp?success=Game updated successfully");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("editGame.jsp?date=" + originalDate + "&team1=" + originalTeam1 + "&team2=" + originalTeam2 + "&error=Failed to update game");
        }
    }
}
