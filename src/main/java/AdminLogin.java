import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


@WebServlet("/AdminLogin") //Establishes AdminLogin page
public class AdminLogin extends HttpServlet {
    private static final long serialVersionUID = 3933624271271339504L;
	private String dburl = "jdbc:mysql://localhost:3306/deep-drive";
    private String dbuname = "root";
    private String dbpassword = "password123";
    private String dbdriver = "com.mysql.cj.jdbc.Driver";

    public AdminLogin() {
        super();
    }
    
    public void loadDriver(String dbDriver) { //Loads driver
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
    
    public Connection getConnection() { //Establishes connection to database using the url, username, and user password
		Connection con = null;
		try {
			con = DriverManager.getConnection(dburl,dbuname, dbpassword);
		} catch (SQLException e) {
			System.err.println("Failed to establish connection: " + e.getMessage());
			e.printStackTrace();
		}
		return con;
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { //Prints out test message to check status whenever receiving a GET request
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { //When receiving a POST request, checks if admin attempting to log in is a valid admin
        String username = request.getParameter("uname");
        String password = request.getParameter("password");

        try {
            Class.forName(dbdriver);
            try (Connection conn = DriverManager.getConnection(dburl, dbuname, dbpassword)) {
                String sql = "SELECT * FROM `deep-drive`.admin WHERE Username = ? AND Password = ?"; //SQL query statement to check if valid admin exists
                try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                    pstmt.setString(1, username);
                    pstmt.setString(2, password);

                    try (ResultSet rs = pstmt.executeQuery()) {
                        if (rs.next()) {
                            // Login successful
                            HttpSession session = request.getSession();
                            session.setAttribute("adminUsername", username);
                            response.sendRedirect("adminPage.jsp"); //If a valid admin, re-direct to the admin's home page
                        } else {
                            // Login failed
                            request.setAttribute("errorMessage", "Invalid username or password"); //Display login error message, stay within admin's login page
                            request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw new ServletException("Database access error", e); //Error thrown when running into issue accessing database
        }
    }
}