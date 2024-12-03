import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/verifyAdminCodeServlet")
public class VerifyAdminCodeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    
    private static final String ADMIN_ACCESS_CODE = "SecureAdmin123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String enteredCode = request.getParameter("accessCode");

        if (ADMIN_ACCESS_CODE.equals(enteredCode)) {
            // Redirect to the admin registration form
            response.sendRedirect("adminRegister.jsp");
        } else {
            // Redirect back with an error message
            request.setAttribute("error", "Invalid Access Code!");
            request.getRequestDispatcher("verifyAdminCode.jsp").forward(request, response);
        }
    }
}
