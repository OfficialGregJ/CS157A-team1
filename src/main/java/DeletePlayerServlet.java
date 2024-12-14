import com.PlayerStatsDao;
import com.PlayerDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


@WebServlet("/DeletePlayerServlet")
public class DeletePlayerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");

        PlayerDao playerDao = new PlayerDao();
        PlayerStatsDao statsDao = new PlayerStatsDao();
        try {
            statsDao.deletePlayerStats(name);
            playerDao.deletePlayer(name);
            response.sendRedirect("managePlayer.jsp?success=Player deleted successfully");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("managePlayer.jsp?error=Failed to delete player");
        }
    }
}
