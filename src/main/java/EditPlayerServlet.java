import com.PlayerDao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditPlayerServlet")
public class EditPlayerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String originalName = request.getParameter("originalName");
        String newName = request.getParameter("name");
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
            playerDao.updatePlayer(originalName, newName, team, position, age, height, weight, college, yearInNBA, imageUrl);
            response.sendRedirect("managePlayer.jsp?success=Player updated successfully");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("editPlayer.jsp?name=" + originalName + "&error=Failed to update player");
        }
    }
}
