import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Team;


@WebServlet("/searchTeams")
public class SearchTeamServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SearchTeamDao searchTeamDao;

    public void init() {
        searchTeamDao = new SearchTeamDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String city = request.getParameter("city");
        
        List<Team> teams = searchTeamDao.searchTeams(name, city);
        
        request.setAttribute("teams", teams);
        request.setAttribute("searchName", name);
        request.setAttribute("searchCity", city);
        request.getRequestDispatcher("/teamResults.jsp").forward(request, response);
    }
}