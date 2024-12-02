import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.FavoriteDao;

@WebServlet("/AddToTeamFavorites")
public class AddToTeamFavoriteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private FavoriteDao teamDao;

    @Override
    public void init() throws ServletException {
        super.init();
        teamDao = FavoriteDao.getInstance();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String username = (String) session.getAttribute("userUsername");
        String teamName = request.getParameter("teamNames");
        


      
        if (username != null && teamName != null) {
            try {
                // Add the team to the user's favorite teams
                teamDao.addFavoriteTeam(username, teamName);
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("error", "Failed to add team to favorites");
            }
        }
        response.sendRedirect("userPage.jsp");
    }
}
