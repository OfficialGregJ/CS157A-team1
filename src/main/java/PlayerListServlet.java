import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/players")
public class PlayerListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PlayerListDao playerDAO = new PlayerListDao();
        List<String> playerNames = playerDAO.getAllPlayerNames();

        request.setAttribute("playerNames", playerNames);
        request.getRequestDispatcher("/players.jsp").forward(request, response);
    }
}