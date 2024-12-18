import com.GamesDao;
import com.GameStatisticsDao;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteGameServlet")
public class DeleteGameServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String date = request.getParameter("date");
        String team1 = request.getParameter("team1");
        String team2 = request.getParameter("team2");

        com.GamesDao gamesDao = new GamesDao();
        GameStatisticsDao statsDao = new GameStatisticsDao();
        try {
        	gamesDao.deleteGame(date, team1, team2); //Deletes desired game from the 'games' table
            statsDao.deleteGameStatistics(date, team1, team2); //Also deletes that game's statistics
            response.sendRedirect("manageGames.jsp?success=Game deleted successfully");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manageGames.jsp?error=Failed to delete game");
        }
    }
}
