
import com.PlayerStatsDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


@WebServlet("/EditPlayerStatsServlet")
public class EditPlayerStatsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String playerName = request.getParameter("playerName");
        double ppg = Double.parseDouble(request.getParameter("ppg"));
        double apg = Double.parseDouble(request.getParameter("apg"));
        double bpg = Double.parseDouble(request.getParameter("bpg"));
        double spg = Double.parseDouble(request.getParameter("spg"));
        double rpg = Double.parseDouble(request.getParameter("rpg"));
        double ftPercentage = Double.parseDouble(request.getParameter("ftPercentage"));
        double threePtPercentage = Double.parseDouble(request.getParameter("threePtPercentage"));
        double topg = Double.parseDouble(request.getParameter("topg"));

        PlayerStatsDao statsDao = new PlayerStatsDao();
        try {
            statsDao.updatePlayerStats(playerName, ppg, apg, bpg, spg, rpg, ftPercentage, threePtPercentage, topg); //Updates the player's stats from the admin's new parameters
            response.sendRedirect("managePlayer.jsp?success=Stats updated successfully");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("editPlayer.jsp?name=" + playerName + "&error=Failed to update stats");
        }
    }
}
