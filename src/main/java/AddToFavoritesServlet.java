

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.FavoritePlayerDao;
@WebServlet("/AddToFavorites")
public class AddToFavoritesServlet extends HttpServlet {
    private static final long serialVersionUID = -6181776080159454525L;
	private FavoritePlayerDao playerDao;
    private String dburl = "jdbc:mysql://localhost:3306/deep-drive";
	private String dbuname = "root";
	private String dbpassword = "";
    @Override
    public void init() throws ServletException {
        super.init();
        
        playerDao = FavoritePlayerDao.getInstance();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("userUsername");
        String playerName = request.getParameter("playerName");

        if (username != null && playerName != null) {
            try {
                playerDao.addFavoritePlayer(username, playerName);
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("error", "Failed to add player to favorites");
            }
        }

        response.sendRedirect("userPage.jsp");
    }
}