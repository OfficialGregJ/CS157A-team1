import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


@WebServlet("/UserLogin") //Establishes UserLogin page
public class UserLogin extends HttpServlet {
    private static final long serialVersionUID = 5044311397524138203L;
	private String dburl = "jdbc:mysql://localhost:3306/deep-drive";
    private String dbuname = "root";
    private String dbpassword = "admin";
    private String dbdriver = "com.mysql.cj.jdbc.Driver";

    public UserLogin() {
        super();
    }
    
    public void loadDriver(String dbDriver) { //Loads driver
		try {
			Class.forName(dbDriver);
		}
		
		catch (ClassNotFoundException e) {
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
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { //When receiving a POST request, checks if user attempting to log in is a valid user
        String username = request.getParameter("uname");
        String password = request.getParameter("password");

        try {
            Class.forName(dbdriver);
            try (Connection conn = DriverManager.getConnection(dburl, dbuname, dbpassword)) {
                String sql = "SELECT * FROM `deep-drive`.users WHERE Username = ? AND Password = ?"; //SQL query statement to check if valid user exists
                try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                    pstmt.setString(1, username);
                    pstmt.setString(2, password);

                    try (ResultSet rs = pstmt.executeQuery()) {
                        if (rs.next()) {
                            // Login successful
                            HttpSession session = request.getSession();
                            session.setAttribute("userUsername", username);
                            session.setAttribute("userPassword", password);
                            response.sendRedirect("userPage.jsp"); //If a valid user, re-direct to the user's home page
                        } else {
                            // Login failed
                            request.setAttribute("errorMessage", "Invalid username or password"); //Display login error message, stay within admin's login page
                            request.getRequestDispatcher("userLogin.jsp").forward(request, response);
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw new ServletException("Database access error", e); //Error thrown when running into issue accessing database
        }
    }
    }