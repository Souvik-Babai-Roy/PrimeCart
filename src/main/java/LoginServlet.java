import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import dao.UsermasterDao;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

    /**
     * Processes the POST request for user login.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve form parameters
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember"); // "on" if checked
        
        try {
            UsermasterDao usermasterDao = new UsermasterDao();

            // Validate login credentials and get the role of the user
            String userRole = usermasterDao.validateLoginAndGetRole(email, password);

            if (userRole != null) {
                // Create a session for the user
                HttpSession session = request.getSession();
                session.setAttribute("username", email);
                session.setAttribute("userRole", userRole);

                // Handle the "Remember Me" cookie
                manageRememberMeCookie(response, email, userRole, remember);

                // Redirect based on user role
                if ("Admin".equalsIgnoreCase(userRole)) {
                    response.sendRedirect("dashboard.jsp?message=Logged in as Admin&messageType=success");
                } else {
                    response.sendRedirect("home.jsp?message=Logged in as User&messageType=success");
                }
            } else {
                // Invalid credentials, redirect to login page with error
                response.sendRedirect("login.html?message=Invalid Credentials&messageType=error");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("login.html?message=Database error&messageType=error");
        }
    }

    /**
     * Manages the "Remember Me" cookie based on the user's choice.
     * If "Remember Me" is selected, the cookie is stored for 30 days.
     * If not selected, any existing "username" cookie is removed.
     */
    private void manageRememberMeCookie(HttpServletResponse response, String email, String userRole, String remember) {
        Cookie userCookie;
        if ("on".equals(remember)) {
            // Save username and role in the cookie
            userCookie = new Cookie("username", email);
            userCookie = new Cookie("userrole", userRole);
            userCookie.setMaxAge(30 * 24 * 60 * 60); // Set expiration to 30 days
        } else {
            // Clear the cookie if "Remember Me" is unchecked
            userCookie = new Cookie("userDetails", null);
            userCookie.setMaxAge(0); // Expire the cookie immediately
        }
        userCookie.setPath("/"); // Make the cookie available to the entire app
        response.addCookie(userCookie); // Add the cookie to the response
    }
}
