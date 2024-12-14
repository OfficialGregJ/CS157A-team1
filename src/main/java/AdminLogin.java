import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
    private static final long serialVersionUID = 3933624271271339504L;
	private String dburl = "jdbc:mysql://localhost:3306/deep-drive";
    private String dbuname = "root";
    private String dbpassword = "password123";
    private String dbdriver = "com.mysql.cj.jdbc.Driver";

    public AdminLogin() {
        super();
    }
    
    public void loadDriver(String dbDriver) {
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
    
    public Connection getConnection() {
		Connection con = null;
		try {
			con = DriverManager.getConnection(dburl,dbuname, dbpassword);
		} catch (SQLException e) {
			System.err.println("Failed to establish connection: " + e.getMessage());
			e.printStackTrace();
		}
		return con;
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("uname");
        String password = request.getParameter("password");

        try {
            Class.forName(dbdriver);
            try (Connection conn = DriverManager.getConnection(dburl, dbuname, dbpassword)) {
                String sql = "SELECT * FROM `deep-drive`.admin WHERE Username = ? AND Password = ?";
                try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                    pstmt.setString(1, username);
                    pstmt.setString(2, password);

                    try (ResultSet rs = pstmt.executeQuery()) {
                        if (rs.next()) {
                            // Login successful
                            HttpSession session = request.getSession();
                            session.setAttribute("adminUsername", username);
                            response.sendRedirect("adminPage.jsp"); // Redirect to dashboard or home page
                        } else {
                            // Login failed
                            request.setAttribute("errorMessage", "Invalid username or password");
                            request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw new ServletException("Database access error", e);
        }
    }
}