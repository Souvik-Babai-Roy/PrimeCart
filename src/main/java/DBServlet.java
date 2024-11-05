

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DBServlet
 */
@WebServlet("/DBServlet")
public class DBServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DBServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Logic to fetch cart item count from the database
	      int cartItemCount = getCartItemCount(request);
	      
	      // Set the cart item count as a request attribute
	      request.setAttribute("cartItemNo", cartItemCount);
	      
	      // Forward to the JSP
	      RequestDispatcher dispatcher = request.getRequestDispatcher("components/navbar.jsp");
	      dispatcher.include(request, response);
	}

	
	 private int getCartItemCount(HttpServletRequest request) {
	        // Placeholder for actual logic to retrieve item count from the database
	        return 5; // Example count
	    }

}
