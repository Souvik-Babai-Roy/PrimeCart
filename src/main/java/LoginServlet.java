

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve form parameters
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");

        // Validate credentials
        if (validateUser(username, password)) {
            // Create a session
            HttpSession session = request.getSession();
            session.setAttribute("username", username);

            // Determine user type and set session attributes
            if ("admin".equals(username) && "password".equals(password)) {
                session.setAttribute("userType", "Admin");
                response.sendRedirect("dashboard.jsp"); // Redirect to admin dashboard
            } else {
                session.setAttribute("userType", "User");
                response.sendRedirect("home.jsp"); // Redirect to user home page
            }

            // Handle "Remember Me" cookie
            if ("on".equals(remember)) {
                Cookie userCookie = new Cookie("username", username);
                userCookie.setMaxAge(7 * 24 * 60 * 60); // 7 days
                response.addCookie(userCookie);
            } else {
                // Delete the existing cookie if "Remember Me" is not checked
                Cookie userCookie = new Cookie("username", "");
                userCookie.setMaxAge(0);
                response.addCookie(userCookie);
            }

        } else {
            // Redirect to login page with error if credentials are invalid
            response.sendRedirect("login.html?error=invalid_credentials");
        }
    }

    /**
     * Validates the user credentials.
     * Checks for specific hardcoded usernames and passwords for demonstration purposes.
     */
    private boolean validateUser(String username, String password) {
        // Example hardcoded credentials
        return ("admin".equals(username) && "password".equals(password)) ||
               ("admin1".equals(username) && "password1".equals(password));
    }
}