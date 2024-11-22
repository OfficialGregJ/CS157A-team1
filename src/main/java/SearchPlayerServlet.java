
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Player;
@WebServlet("/searchPlayers")
public class SearchPlayerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SearchPlayerDao searchPlayerDao;

    public void init() {
        searchPlayerDao = new SearchPlayerDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String position = request.getParameter("position");
        
        List<Player> players = searchPlayerDao.searchPlayers(name, position);
        
        request.setAttribute("players", players);
        request.setAttribute("searchName", name);
        request.setAttribute("searchPosition", position);
        request.getRequestDispatcher("/playerResults.jsp").forward(request, response);
    }
}

