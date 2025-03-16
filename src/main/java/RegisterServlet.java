import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import helpers.Helper;

/**
 * Servlet implementation class RegisterServlet
 */

public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor
     */
    public RegisterServlet() {
        super();
    }

    /**
     * Handles GET requests
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("This servlet only handles POST requests.");
    }

    /**
     * Handles POST requests
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Call the method to create the product table
        try {
            createProductTable();
            res.getWriter().println("Table 'Products' created successfully!");
        } catch (SQLException e) {
            res.getWriter().println("Error creating the table: " + e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * Method to create the "Products" table in the database
     */
    public static void createProductTable() throws SQLException {
        // SQL query to create the "Products" table
        String sql = "CREATE TABLE Products_new ("
                + "id NUMBER PRIMARY KEY NOT NULL, "
                + "product_category_name VARCHAR2(100), "
                + "product_name VARCHAR2(100), "
                + "product_description VARCHAR2(500), "
                + "product_price NUMBER(10,2), "
                + "product_image_path VARCHAR2(500))";

        // Database connection details

        // Establish a connection and execute the query
        try (Connection con = Helper.getConnection();
             Statement st = con.createStatement()) {
            st.execute(sql); // Execute the SQL query to create the table
            System.out.println("Table 'Products' successfully created!");
        }
    }
}
