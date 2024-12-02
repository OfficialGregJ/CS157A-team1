import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UpdateSettingsServlet")
public class UpdateSettingsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/deep-drive";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "admin";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String currentUsername = (String) session.getAttribute("userUsername");

        String updateType = request.getParameter("updateType");
        String newValue = request.getParameter(updateType);

        if (currentUsername == null || updateType == null || newValue == null) {
            response.sendRedirect("userPage.jsp");
            return;
        }

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            if (updateType.equals("username")) {
                // Update username in the `users` table
                String updateUserQuery = "UPDATE users SET Username = ? WHERE Username = ?";
                try (PreparedStatement ps = conn.prepareStatement(updateUserQuery)) {
                    ps.setString(1, newValue);
                    ps.setString(2, currentUsername);
                    ps.executeUpdate();
                }

                // Update username in the `favorites` table
                String updateFavoritesQuery = "UPDATE favorites SET User = ? WHERE User = ?";
                try (PreparedStatement ps = conn.prepareStatement(updateFavoritesQuery)) {
                    ps.setString(1, newValue);
                    ps.setString(2, currentUsername);
                    ps.executeUpdate();
                }

                session.setAttribute("userUsername", newValue);

            } else if (updateType.equals("password")) {
                // Update password in the `users` table
                String updatePasswordQuery = "UPDATE users SET Password = ? WHERE Username = ?";
                try (PreparedStatement ps = conn.prepareStatement(updatePasswordQuery)) {
                    ps.setString(1, newValue);
                    ps.setString(2, currentUsername);
                    ps.executeUpdate();
                }

                // Update session attribute
                session.setAttribute("userPassword", newValue);
            }

            response.sendRedirect("userPage.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
