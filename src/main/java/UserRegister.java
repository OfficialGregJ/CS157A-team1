import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("uname");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		User member = new User(username, password, email);
		
		UserRegisterDao rDao = new UserRegisterDao();
		String result = rDao.insert(member);
		
		if (result.equals("Data entered successfully")) {
			request.getSession().setAttribute("userUsername", username);
			response.sendRedirect("userPage.jsp");
		} else if (result.contains("Duplicate entry")) {
	        // Handle duplicate entry case
	        request.setAttribute("errorMessage", result);
	        request.getRequestDispatcher("userRegister.jsp").forward(request, response);
	    } else {
	        // Handle general errors
	        request.setAttribute("errorMessage", "An error occurred. Please try again.");
	        request.getRequestDispatcher("userRegister.jsp").forward(request, response);
	    }
		
	}

}
