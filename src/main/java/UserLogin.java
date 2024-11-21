import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
    private static final long serialVersionUID = 5044311397524138203L;
	private String dburl = "jdbc:mysql://localhost:3306/deep-drive";
    private String dbuname = "root";
    private String dbpassword = "5222Genovesio!@";
    private String dbdriver = "com.mysql.cj.jdbc.Driver";

    public UserLogin() {
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
                String sql = "SELECT * FROM `deep-drive`.users WHERE Username = ? AND Password = ?";
                try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                    pstmt.setString(1, username);
                    pstmt.setString(2, password);

                    try (ResultSet rs = pstmt.executeQuery()) {
                        if (rs.next()) {
                            // Login successful
                            HttpSession session = request.getSession();
                            session.setAttribute("userUsername", username);
                            response.sendRedirect("userPage.jsp"); // Redirect to dashboard or home page
                        } else {
                            // Login failed
                            request.setAttribute("errorMessage", "Invalid username or password");
                            request.getRequestDispatcher("userLogin.jsp").forward(request, response);
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw new ServletException("Database access error", e);
        }
    }
    }