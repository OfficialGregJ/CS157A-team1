import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;


@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
    private String dburl = "jdbc:mysql://localhost:3306/deep-drive";
    private String dbuname = "root";
    private String dbpassword = "5222Genovesio!@";
    private String dbdriver = "com.mysql.cj.jdbc.Driver";

    public UserLogin() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("uname");
        String password = request.getParameter("password");
        
        try {
            Class.forName(dbdriver);
            try (Connection conn = DriverManager.getConnection(dburl, dbuname, dbpassword)) {
                String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
                try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                    pstmt.setString(1, username);
                    pstmt.setString(2, password); // Note: In a real application, you should hash the password
                    
                    try (ResultSet rs = pstmt.executeQuery()) {
                        if (rs.next()) {
                            // Login successful
//                            HttpSession session = request.getSession();
//                            session.setAttribute("username", username);
//                            response.sendRedirect("userPage.jsp"); // Redirect to dashboard or home page
                        } else {
//                            // Login failed
//                            request.setAttribute("errorMessage", "Invalid username or password");
//                            request.getRequestDispatcher("userLogin.jsp").forward(request, response);
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw new ServletException("Database access error", e);
        }
    }
}