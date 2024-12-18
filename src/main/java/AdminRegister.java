import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
@WebServlet("/AdminRegister")
public class AdminRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public AdminRegister() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { //Used to check if AdminRegister is running by checking response from GET request
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("uname");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		
		Admin admin = new Admin(username, password, email);
		
		
		AdminRegisterDao aDao = new AdminRegisterDao();
		String result = aDao.insert(admin); //runs adminDao to insert the new Admin object, checks if it already exists or does not exist
		
		
		if (result.equals("Data entered successfully")) {
			request.getSession().setAttribute("adminUsername", username);
			response.sendRedirect("adminPage.jsp");
		} else if (result.contains("Duplicate entry")) {
	        // Handle duplicate entry case
	        request.setAttribute("errorMessage", result);
	        request.getRequestDispatcher("adminRegister.jsp").forward(request, response);
	    } else {
	        // Handle general errors
	        request.setAttribute("errorMessage", "An error occurred. Please try again.");
	        request.getRequestDispatcher("adminRegister.jsp").forward(request, response);
	    }
	}

}