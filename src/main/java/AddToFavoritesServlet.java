

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.FavoriteDao;
@WebServlet("/AddToFavorites")
public class AddToFavoritesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
	private FavoriteDao playerDao;
    @Override
    public void init() throws ServletException {
        super.init();
        
        playerDao = FavoriteDao.getInstance();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("userUsername");
        
        if (username == null || username.isEmpty()) {
            // Redirect to login page if the user is not logged in
            response.sendRedirect("userLogin.jsp");
            return;
        }
        
        
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