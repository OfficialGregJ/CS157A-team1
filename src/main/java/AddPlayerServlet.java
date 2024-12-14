import com.PlayerDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddPlayerServlet")
public class AddPlayerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String team = request.getParameter("team");
        String position = request.getParameter("position");
        int age = Integer.parseInt(request.getParameter("age"));
        String height = request.getParameter("height");
        double weight = Double.parseDouble(request.getParameter("weight"));
        String college = request.getParameter("college");
        int yearInNBA = Integer.parseInt(request.getParameter("yearInNBA"));
        String imageUrl = request.getParameter("imageUrl");

        PlayerDao playerDao = new PlayerDao();
        try {
            playerDao.addPlayer(name, team, position, age, height, weight, college, yearInNBA, imageUrl);
            response.sendRedirect("managePlayer.jsp?success=Player added successfully");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("managePlayer.jsp?error=Failed to add player");
        }
    }
}
