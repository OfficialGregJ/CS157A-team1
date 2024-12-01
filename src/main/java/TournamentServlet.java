import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TournamentServlet")
public class TournamentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	TournamentsDao tournamentsDao = new TournamentsDao();
        // Check if a specific tournament name is provided
        String tournamentName = request.getParameter("tournamentName");

        if (tournamentName != null && !tournamentName.isEmpty()) {
            // Fetch tournament details for the specified name
            Tournament tournament = tournamentsDao.getTournamentDetails(tournamentName);
            if (tournament != null) {
                request.setAttribute("tournamentName", tournament.getName());
                request.setAttribute("date", tournament.getDate());
                request.setAttribute("team1", tournament.getTeam1());
                request.setAttribute("team2", tournament.getTeam2());
                request.setAttribute("winner", tournament.getWinner());
                request.setAttribute("location", tournament.getLocation());
                request.getRequestDispatcher("tournamentsDetails.jsp").forward(request, response);
                return;
            } else {
                request.setAttribute("errorMessage", "No details found for tournament: " + tournamentName);
                request.getRequestDispatcher("tournaments.jsp").forward(request, response);
                return;
            }
        }

        // If no specific tournament name is provided, fetch all tournament names
        List<String> tournamentNames = tournamentsDao.getAllTournamentNames();
        request.setAttribute("tournamentNames", tournamentNames);
        request.getRequestDispatcher("tournaments.jsp").forward(request, response);
    }
}
