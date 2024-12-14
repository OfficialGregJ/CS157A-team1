import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.User;
/**
 * Servlet implementation class Register
 */
@WebServlet("/UserRegister")
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { //When POST request sent, attempt to add newly registered user to the "user" table
		String username = request.getParameter("uname");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		User member = new User(username, password, email); //Creates new User object
		
		UserRegisterDao rDao = new UserRegisterDao(); //Create new UserRegisterDao object to run methods
		String result = rDao.insert(member);
		
		if (result.equals("Data entered successfully")) { //If user added successfully, update current user's username and password to match newly registered user
			request.getSession().setAttribute("userUsername", username);
			request.getSession().setAttribute("userPassword", password);
			response.sendRedirect("userPage.jsp");
		} else if (result.contains("Duplicate entry")) { //Handles duplicate entry case
	        request.setAttribute("errorMessage", result);
	        request.getRequestDispatcher("userRegister.jsp").forward(request, response);
	    } else { //Handle any exceptions caught
	        request.setAttribute("errorMessage", "An error occurred. Please try again.");
	        request.getRequestDispatcher("userRegister.jsp").forward(request, response);
	    }
		
	}

}
