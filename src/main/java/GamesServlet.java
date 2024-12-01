import java.io.IOException;
import java.util.List;
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

        // Check if a specific date is provided
        String date = request.getParameter("date");

        if (date != null && !date.isEmpty()) {
            // Fetch game details for the specified date
            Game game = gamesDao.getAllGameDetails(date);
            if (game != null) {
                request.setAttribute("date", game.getDate());
                request.setAttribute("team1", game.getTeam1());
                request.setAttribute("team2", game.getTeam2());
                request.setAttribute("winner", game.getWinner());
                request.setAttribute("loser", game.getLoser());
                request.setAttribute("location", game.getLocation());
                request.setAttribute("team1Pts", game.getTeam1Pts());
                request.setAttribute("team2Pts", game.getTeam2Pts());
                request.setAttribute("team1Rebounds", game.getTeam1Rebounds());
                request.setAttribute("team2Rebounds", game.getTeam2Rebounds());
                request.setAttribute("team1Assists", game.getTeam1Assists());
                request.setAttribute("team2Assists", game.getTeam2Assists());
                request.setAttribute("team1Blocks", game.getTeam1Blocks());
                request.setAttribute("team2Blocks", game.getTeam2Blocks());
                request.setAttribute("team1FT", game.getTeam1FT());
                request.setAttribute("team2FT", game.getTeam2FT());
                request.setAttribute("team13PT", game.getTeam13PT());
                request.setAttribute("team23PT", game.getTeam23PT());
                request.setAttribute("team1TO", game.getTeam1TO());
                request.setAttribute("team2TO", game.getTeam2TO());
                request.getRequestDispatcher("gamesDetails.jsp").forward(request, response);
                return; // Stop further execution
            } else {
                request.setAttribute("errorMessage", "No game details found for the date: " + date);
                request.getRequestDispatcher("games.jsp").forward(request, response);
                return;
            }
        }

        // If no specific date is provided, fetch all available game dates
        List<String> gameDates = gamesDao.getAllDates();
        request.setAttribute("gameDates", gameDates);
        request.getRequestDispatcher("games.jsp").forward(request, response);
    }
}
