import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.FavoriteDao;

@WebServlet("/FavoritesServlet")
public class RemoveFavorites extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FavoriteDao favoriteDao = FavoriteDao.getInstance();

        String action = request.getParameter("action");
        String username = (String) request.getSession().getAttribute("userUsername");
        
        System.out.println("Action: " + action);
        System.out.println("Player/Team to remove: " + request.getParameter("playerName") + "/" + request.getParameter("teamName"));


        try {
            if ("removePlayer".equals(action)) {
                String playerName = request.getParameter("playerName");
                favoriteDao.removeFavoritePlayer(username, playerName);
            } else if ("removeTeam".equals(action)) {
                String teamName = request.getParameter("teamName");
                favoriteDao.removeFavoriteTeam(username, teamName);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        List<String> favoritePlayers = favoriteDao.getFavoritePlayers(username);
        List<String> favoriteTeams = favoriteDao.getFavoriteTeams(username);
        request.setAttribute("favoritePlayers", favoritePlayers);
        request.setAttribute("favoriteTeams", favoriteTeams);

        response.sendRedirect("userPage.jsp");
    }
}
