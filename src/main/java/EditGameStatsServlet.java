import com.GameStatisticsDao;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditGameStatsServlet")
public class EditGameStatsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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

        GameStatisticsDao statsDao = new GameStatisticsDao();
        try {
            statsDao.updateGameStatistics(date, team1, team2, team1Pts, team2Pts, team1Rebounds, team2Rebounds, team1Assists, team2Assists, team1Blocks, team2Blocks, team1FTPercent, team2FTPercent, team13PTPercent, team23PTPercent, team1TO, team2TO); //Runs same function as update for games, except now it is with game stats
            response.sendRedirect("manageGames.jsp?success=Stats updated successfully");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("editGameStats.jsp?date=" + date + "&team1=" + team1 + "&team2=" + team2 + "&error=Failed to update stats");
        }
    }
}
