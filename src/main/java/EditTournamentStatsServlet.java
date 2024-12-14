import com.TournamentDao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditTournamentStatsServlet")
public class EditTournamentStatsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tournamentName = request.getParameter("tournamentName");
        String date = request.getParameter("date");
        String team1 = request.getParameter("team1");
        String team2 = request.getParameter("team2");
        int team1Pts = Integer.parseInt(request.getParameter("team1Pts"));
        int team2Pts = Integer.parseInt(request.getParameter("team2Pts"));
        int team1Rebounds = Integer.parseInt(request.getParameter("team1Rebounds"));
        int team2Rebounds = Integer.parseInt(request.getParameter("team2Rebounds"));
        int team1Assists = Integer.parseInt(request.getParameter("team1Assists"));
        int team2Assists = Integer.parseInt(request.getParameter("team2Assists"));
        int team1Blocks = Integer.parseInt(request.getParameter("team1Blocks"));
        int team2Blocks = Integer.parseInt(request.getParameter("team2Blocks"));
        double team1FTPercent = Double.parseDouble(request.getParameter("team1FTPercent"));
        double team2FTPercent = Double.parseDouble(request.getParameter("team2FTPercent"));
        double team13PTPercent = Double.parseDouble(request.getParameter("team13PTPercent"));
        double team23PTPercent = Double.parseDouble(request.getParameter("team23PTPercent"));
        int team1TO = Integer.parseInt(request.getParameter("team1TO"));
        int team2TO = Integer.parseInt(request.getParameter("team2TO"));

        TournamentDao tournamentDao = new TournamentDao();

        try {
            tournamentDao.updateTournamentStats(
                tournamentName, date, team1, team2, team1Pts, team2Pts, team1Rebounds, team2Rebounds, 
                team1Assists, team2Assists, team1Blocks, team2Blocks, team1FTPercent, team2FTPercent, 
                team13PTPercent, team23PTPercent, team1TO, team2TO
            );
            response.sendRedirect("manageTournaments.jsp?success=Stats updated successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("editTournamentStats.jsp?name=" + tournamentName + "&error=Failed to update stats");
        }
    }
}
