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
    
    // Get request
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Setting up request + formatting of name
		String playerName = request.getParameter("name");
        
        String playerNameUpdated = playerName.replace('+', ' ');
        
        // Error checking
        if (playerNameUpdated != null && !playerNameUpdated.trim().isEmpty()) {
        	// Send request to get required information
            PlayerProfileDao dao = new PlayerProfileDao();
            Player player = dao.getPlayerByName(playerNameUpdated);
            
            // If actually got a proper response, fill out required information
            if (player != null) {
                request.setAttribute("player", player);
                
                PlayerStats stats = dao.getPlayerStatsByName(playerNameUpdated);
                if (stats != null) {
                    request.setAttribute("ppg", stats.getPPG());
                    request.setAttribute("apg", stats.getAPG());
                    request.setAttribute("bpg", stats.getBPG());
                    request.setAttribute("spg", stats.getSPG());
                    request.setAttribute("rpg", stats.getRPG());
                    request.setAttribute("ft", stats.getFTPercentage());
                    request.setAttribute("threept", stats.getThreePTPercentage());
                    request.setAttribute("topg", stats.getTOPG());
                }
                
                request.getRequestDispatcher("/playerProfile.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Player not found");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Player name is required");
        }
    }
}