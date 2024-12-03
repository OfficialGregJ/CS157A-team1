import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GamesServlet")
public class GamesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        GamesDao gamesDao = new GamesDao();

        String date = request.getParameter("date");

        if (date != null && !date.isEmpty()) {
            List<Game> games = gamesDao.getAllGamesForDate(date);
            if (!games.isEmpty()) {
                request.setAttribute("date", date);
                request.setAttribute("games", games);

                // Fetch player stats for each game
                for (Game game : games) {
                    Map<String, List<PlayerGameStats>> playerStats = gamesDao.getPlayerStatsForGame(date, game.getTeam1(), game.getTeam2());
                    game.setPlayerStats(playerStats);
                }

                request.getRequestDispatcher("gamesDetails.jsp").forward(request, response);
                return;
            } else {
                request.setAttribute("errorMessage", "No games found for the date: " + date);
                request.getRequestDispatcher("games.jsp").forward(request, response);
                return;
            }
        }

        List<String> gameDates = gamesDao.getAllDates();
        request.setAttribute("gameDates", gameDates);
        request.getRequestDispatcher("games.jsp").forward(request, response);
    }
}

