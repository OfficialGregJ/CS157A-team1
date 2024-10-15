import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Player;
@WebServlet("/playerProfile")
public class PlayerProfile extends HttpServlet {
    private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String playerName = request.getParameter("name");
        System.out.print(playerName);
        String playerNameUpdated = playerName.replace('+', ' ');
        
        if (playerNameUpdated != null && !playerNameUpdated.trim().isEmpty()) {
            PlayerProfileDao dao = new PlayerProfileDao();
            Player player = dao.getPlayerByName(playerNameUpdated);

            if (player != null) {
                request.setAttribute("player", player);
                request.getRequestDispatcher("/playerProfile.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Player not found");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Player name is required");
        }
    }
}