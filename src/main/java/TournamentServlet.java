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
                request.setAttribute("video_url", tournament.getVideoUrl());
                request.setAttribute("team1Pts", tournament.getTeam1Pts());
                request.setAttribute("team2Pts", tournament.getTeam2Pts());
                request.setAttribute("team1Rebounds", tournament.getTeam1Rebounds());
                request.setAttribute("team2Rebounds", tournament.getTeam2Rebounds());
                request.setAttribute("team1Assists", tournament.getTeam1Assists());
                request.setAttribute("team2Assists", tournament.getTeam2Assists());
                request.setAttribute("team1Blocks", tournament.getTeam1Blocks());
                request.setAttribute("team2Blocks", tournament.getTeam2Blocks());
                request.setAttribute("team1FT", tournament.getTeam1FT());
                request.setAttribute("team2FT", tournament.getTeam2FT());
                request.setAttribute("team13PT", tournament.getTeam13PT());
                request.setAttribute("team23PT", tournament.getTeam23PT());
                request.setAttribute("team1TO", tournament.getTeam1TO());
                request.setAttribute("team2TO", tournament.getTeam2TO());
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
