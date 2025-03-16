
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.*;
import java.sql.Date;

import helpers.Helper;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import beans.*;
import dao.*;
import java.util.*;

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
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if (action == null) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing action parameter.");
			return;
		}

		try (Connection connection = Helper.getConnection()) {

			switch (action) {
			case "fetchCartItemNo":
				// Fetch the cart item count before processing any action
				int cartItemCount = getCartItemCount(request, connection);

//	                PrintWriter out= response.getWriter();
//	        		response.setContentType("text/html");
//
//	                out.println(cartItemCount);

//	      	      // Set the cart item count as a request attribute
//	      	      request.setAttribute("cartItemNo", cartItemCount);
//	      	      
//	      	      // Forward to the JSP
//	      	      RequestDispatcher dispatcher = request.getRequestDispatcher("components/navbar.jsp");
//	      	      dispatcher.include(request, response);

				response.setContentType("application/json"); // Set response type to JSON
				response.getWriter().write("{\"cartItemCount\": " + cartItemCount + "}");

				break;

			case "updateCart":
				updateCart(request, response, connection);
				break;
			case "editPassword":
				editPassword(request, response, connection);
				break;
			case "makeDefaultAddress":
				makeDefaultAddress(request, response, connection);
				break;
			case "addCategory":
				addCategory(request, response);
				break;
			case "editCategories":
				editCategories(request, response);
				break;
			case "deleteCategories":
				deleteCategories(request, response, request.getParameter("id"));
				break;
			case "addProduct":
				addProduct(request, response);
				break;
			case "editProduct":
				editProduct(request, response);
				break;
			case "deleteProduct":
				deleteProduct(request, response, request.getParameter("id"));
				break;
			case "addInventory":
				addInventory(request, response);
				break;
			case "editInventory":
				editInventory(request, response);
				break;
			case "deleteInventory":
				deleteInventory(request, response, request.getParameter("id"));
				break;
			case "addToCart":
				addToCart(request, response, request.getParameter("id"), request.getParameter("path"));
				break;
			default:
				response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action parameter: " + action);
			}
		} catch (SQLException e) {
			e.printStackTrace(); // Consider using a logger here
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database connection error.");
		}
	}

	private int getCartItemCount(HttpServletRequest request, Connection connection) throws SQLException {
//        // Assuming the user ID is passed as a request parameter or available in session
//        int userId = Integer.parseInt(request.getParameter("userId"));  // Replace with actual logic for retrieving user ID
//
//        // SQL query to get the count of items in the cart for this user
//        String query = "SELECT COUNT(*) AS item_count FROM cart WHERE user_id = ?";
//        
//        try (PreparedStatement stmt = connection.prepareStatement(query)) {
//            stmt.setInt(1, userId);  // Set the user ID
//            try (ResultSet rs = stmt.executeQuery()) {
//                if (rs.next()) {
//                    return rs.getInt("item_count");  // Return the count of items in the cart
//                } else {
//                    return 0;  // Return 0 if no items found in the cart
//                }
//            }
//        }
		return 5;
	}

	private void updateCart(HttpServletRequest request, HttpServletResponse response, Connection connection)
			throws IOException, SQLException {
		try {
			// Extract cart details from the request
			int userId = Integer.parseInt(request.getParameter("userId"));
			int productId = Integer.parseInt(request.getParameter("productId"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));

			String query = "UPDATE cart SET quantity = ? WHERE user_id = ? AND product_id = ?";
			try (PreparedStatement stmt = connection.prepareStatement(query)) {
				stmt.setInt(1, quantity);
				stmt.setInt(2, userId);
				stmt.setInt(3, productId);

				int rowsUpdated = stmt.executeUpdate();
				response.setContentType("text/plain");
				PrintWriter out = response.getWriter();
				if (rowsUpdated > 0) {
					out.write("Cart updated successfully.");
				} else {
					out.write("No rows updated. Check if the product exists in the cart.");
				}
			}
		} catch (NumberFormatException e) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input data format.");
		}
	}

	private void editPassword(HttpServletRequest request, HttpServletResponse response, Connection connection)
			throws IOException, SQLException {
//        try {
//            // Extract password details from the request
//            int userId = Integer.parseInt(request.getParameter("userId"));
//            String currentPassword = request.getParameter("currentPassword");
//            String newPassword = request.getParameter("newPassword");
//
//            // Verify the current password
//            String verifyQuery = "SELECT password FROM users WHERE user_id = ?";
//            try (PreparedStatement verifyStmt = connection.prepareStatement(verifyQuery)) {
//                verifyStmt.setInt(1, userId);
//                try (ResultSet rs = verifyStmt.executeQuery()) {
//                    if (rs.next()) {
//                        String storedPassword = rs.getString("password");
//                        if (!storedPassword.equals(currentPassword)) {
//                            response.setContentType("text/plain");
//                            PrintWriter out = response.getWriter();
//                            out.write("Current password is incorrect.");
//                            return;
//                        }
//                    } else {
//                        response.setContentType("text/plain");
//                        PrintWriter out = response.getWriter();
//                        out.write("User not found.");
//                        return;
//                    }
//                }
//            }
//
//            // Update the password
//            String updateQuery = "UPDATE users SET password = ? WHERE user_id = ?";
//            try (PreparedStatement updateStmt = connection.prepareStatement(updateQuery)) {
//                updateStmt.setString(1, newPassword);
//                updateStmt.setInt(2, userId);
//
//                int rowsUpdated = updateStmt.executeUpdate();
//                response.setContentType("text/plain");
//                PrintWriter out = response.getWriter();
//                if (rowsUpdated > 0) {
//                    out.write("Password updated successfully.");
//                } else {
//                    out.write("Failed to update password.");
//                }
//            }
//        } catch (NumberFormatException e) {
//            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid user ID format.");
//        }

		response.sendRedirect("account.jsp");

	}

	private void makeDefaultAddress(HttpServletRequest request, HttpServletResponse response, Connection connection)
			throws IOException, SQLException {
		String username = request.getParameter("addressId");
		// response.getWriter().println(username);
		response.sendRedirect("account.jsp?message=Default address updated successfully&messageType=success");

	}

	private void addCategory(HttpServletRequest request, HttpServletResponse response)
			throws IOException, SQLException {
		try {
			String categoryName = request.getParameter("CategoryName");
			String categoryDescription = request.getParameter("CategoryDescription");
			HttpSession session = request.getSession();
			String username = (String) session.getAttribute("userType");

			if (categoryName == null) {
				response.sendRedirect(
						"category_management.jsp?message=" + URLEncoder.encode("Please enter Category name", "UTF-8")
								+ "&messageType=" + URLEncoder.encode("error", "UTF-8"));
				return;
			}

			CategoriesBean newCategory = new CategoriesBean(categoryName, categoryDescription, username);
			CategoriesDao categoryDAO = new CategoriesDao();

			boolean success = categoryDAO.addCategory(newCategory);

			String message = success ? "Category added successfully!" : "Failed to add Category.";
			String messageType = success ? "success" : "error";

			response.sendRedirect("category_management.jsp?message=" + URLEncoder.encode(message, "UTF-8")
					+ "&messageType=" + URLEncoder.encode(messageType, "UTF-8"));
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
		}
	}

	private void editCategories(HttpServletRequest request, HttpServletResponse response)
			throws IOException, SQLException {

		int categoryId = Integer.parseInt(request.getParameter("editCategoryID"));
		String categoryName = request.getParameter("editCategoryName");
		String categoryDescription = request.getParameter("editCategoryDescription");
		String categoryStatus = request.getParameter("editCategoryStatus");
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("userType");

		try {
			CategoriesBean editCategory = new CategoriesBean(categoryId, categoryName, categoryDescription, username,
					categoryStatus);
			CategoriesDao categoryDAO = new CategoriesDao();

			boolean success = categoryDAO.updateCategory(editCategory);

			String message = success ? "Category updated successfully!" : "Failed to update Category.";
			String messageType = success ? "success" : "error";

			response.sendRedirect("category_management.jsp?message=" + URLEncoder.encode(message, "UTF-8")
					+ "&messageType=" + URLEncoder.encode(messageType, "UTF-8"));

		} catch (SQLException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
		}

	}

	private void deleteCategories(HttpServletRequest request, HttpServletResponse response, String categoryId)
			throws IOException, SQLException {

		int id = Integer.parseInt(categoryId);

		try {
			CategoriesDao categoryDAO = new CategoriesDao();

			boolean success = categoryDAO.deleteCategory(id);

			String message = success ? "Category deleted successfully!" : "Failed to delete Category.";
			String messageType = success ? "success" : "error";

			response.sendRedirect("category_management.jsp?message=" + URLEncoder.encode(message, "UTF-8")
					+ "&messageType=" + URLEncoder.encode(messageType, "UTF-8"));

		} catch (SQLException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
		}

	}

	private void addProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		try {
			// Retrieve parameters from the request
			String productCode = request.getParameter("productCode");
			int categoryID = Integer.parseInt(request.getParameter("categoryID"));
			String productName = request.getParameter("productName");
			String brand = request.getParameter("brand");
			double price = Double.parseDouble(request.getParameter("price"));
			double mrp = Double.parseDouble(request.getParameter("mrp"));

			double discountPercentage = 0.0;
			if (request.getParameter("discountPercentage") != "")
				discountPercentage = Double.parseDouble(request.getParameter("discountPercentage"));

			String description = request.getParameter("description");
			String specifications = request.getParameter("specificationsJson"); // Assuming specifications are sent as
																				// JSON

			double shippingWeight = Double.parseDouble(request.getParameter("shippingWeight"));
			String shippingDimensions = request.getParameter("shippingDimensions");
			int payOnDelivery = Integer.parseInt(request.getParameter("payOnDelivery"));
			int replacementDay = Integer.parseInt(request.getParameter("replacementDays"));
			String warrantyPeriod = request.getParameter("warrantyPeriod");
			String manufacturer = request.getParameter("manufacturerName");
			String brandOrigin = request.getParameter("brandOrigin");
			String modelName = request.getParameter("modelName");
			String unit = "PCS"; // Set to a default value or retrieve from request if applicable
			String hsn = request.getParameter("hsn");

			// Create a new ProductsBean object
			ProductsBean newProduct = new ProductsBean(productCode, categoryID, productName, brand, price, mrp,
					discountPercentage, description, specifications, shippingWeight, shippingDimensions, payOnDelivery,
					replacementDay, warrantyPeriod, manufacturer, brandOrigin, modelName, unit, hsn);

			// Call the DAO to add the product
			ProductDao productDao = new ProductDao();
			boolean success = productDao.addProduct(newProduct);
			// response.getWriter().println(newProduct.toString());

			// Set the response message
			String message = success ? "Product added successfully!" : "Failed to add product.";
			String messageType = success ? "success" : "error";

			// Redirect with message
			response.sendRedirect("product_management.jsp?message=" + URLEncoder.encode(message, "UTF-8")
					+ "&messageType=" + URLEncoder.encode(messageType, "UTF-8"));
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
		} catch (NumberFormatException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input format: " + e.getMessage());
		}
	}

	private void editProduct(HttpServletRequest request, HttpServletResponse response)
			throws IOException, SQLException {
		// Retrieve product details from the request
		int productId = Integer.parseInt(request.getParameter("editProductID"));
		String productName = request.getParameter("editProductName");
		String productCode = request.getParameter("editProductCode");
		String modelName = request.getParameter("editModelName");
		String manufacturer = request.getParameter("editManufacturerName");
		int categoryId = Integer.parseInt(request.getParameter("editCategoryID"));
		String brand = request.getParameter("editBrand");
		String brandOrigin = request.getParameter("editBrandOrigin");
		double price = Double.parseDouble(request.getParameter("editPrice"));
		double mrp = Double.parseDouble(request.getParameter("editMRP"));
		double discountPercentage = Double.parseDouble(request.getParameter("editDiscountPercentage"));
		String description = request.getParameter("editDescription");
		String specifications = request.getParameter("editSpecificationsJson");
		double shippingWeight = Double.parseDouble(request.getParameter("editShippingWeight"));
		String shippingDimensions = request.getParameter("editShippingDimensions");
		int payOnDelivery = Boolean.parseBoolean(request.getParameter("editPayOnDelivery")) ? 1 : 0; // Convert to int
		int replacementDays = Integer.parseInt(request.getParameter("editReplacementDays"));
		String warrantyPeriod = request.getParameter("editWarrantyPeriod");
		String hsn = request.getParameter("editHSN");
		String unit = request.getParameter("editUnit");
		String productStatus = request.getParameter("editStatus");

		// Retrieve the username from session
		HttpSession session = request.getSession();
		String updatedBy = (String) session.getAttribute("userType");

		try {
			// Create a ProductsBean object with the updated details
			ProductsBean editProduct = new ProductsBean(productId, productCode, categoryId, productName, brand, price,
					mrp, discountPercentage, description, specifications, shippingWeight, shippingDimensions,
					payOnDelivery, replacementDays, warrantyPeriod, manufacturer, brandOrigin, modelName, unit, hsn,
					updatedBy, productStatus);

			// Call the DAO to update the product
			ProductDao productDao = new ProductDao();
			boolean success = productDao.updateProduct(editProduct);

			// Prepare success/error message
			String message = success ? "Product updated successfully!" : "Failed to update product.";
			String messageType = success ? "success" : "error";

			// Redirect with a message
			response.sendRedirect("product_management.jsp?message=" + URLEncoder.encode(message, "UTF-8")
					+ "&messageType=" + URLEncoder.encode(messageType, "UTF-8"));

		} catch (SQLException e) {
			// Handle database errors
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
		}
	}

	private void deleteProduct(HttpServletRequest request, HttpServletResponse response, String categoryId)
			throws IOException, SQLException {

		int id = Integer.parseInt(categoryId);

		try {
			ProductDao productDao = new ProductDao();

			boolean success = productDao.deleteProduct(id);

			String message = success ? "Product deleted successfully!" : "Failed to delete Product.";
			String messageType = success ? "success" : "error";

			response.sendRedirect("product_management.jsp?message=" + URLEncoder.encode(message, "UTF-8")
					+ "&messageType=" + URLEncoder.encode(messageType, "UTF-8"));

		} catch (SQLException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
		}

	}

	private void addInventory(HttpServletRequest request, HttpServletResponse response)
			throws IOException, SQLException {
		try {

			if (request.getParameter("productID") == "") {
				response.sendRedirect("inventory_management.jsp?message="
						+ URLEncoder.encode("Please enter actual product name", "UTF-8") + "&messageType="
						+ URLEncoder.encode("error", "UTF-8"));
				return;
			}

			int productId = Integer.parseInt(request.getParameter("productID"));
			int stockLevel = Integer.parseInt(request.getParameter("stockLevel"));
			int minimumStockLevel = Integer.parseInt(request.getParameter("minimumStockLevel"));
			String restockDate = request.getParameter("restockDate");
			String warehouseLocation = request.getParameter("warehouseLocation");
			HttpSession session = request.getSession();
			String username = (String) session.getAttribute("username");

			InventoryBean newInventory = new InventoryBean(productId, null, warehouseLocation, stockLevel, 0,
					minimumStockLevel, restockDate, username);
			InventoryDao inventoryDao = new InventoryDao();

			boolean success = inventoryDao.addInventory(newInventory);
			// boolean success= true;

			// response.getWriter().println(newInventory.toString());

			String message = success ? "Inventory added successfully!"
					: "Failed to add Inventory. Already exist for same product";
			String messageType = success ? "success" : "error";

			response.sendRedirect("inventory_management.jsp?message=" + URLEncoder.encode(message, "UTF-8")
					+ "&messageType=" + URLEncoder.encode(messageType, "UTF-8"));
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
		}
	}

	private void editInventory(HttpServletRequest request, HttpServletResponse response)
			throws IOException, SQLException {

		// Parse parameters from the request
		int inventoryID = Integer.parseInt(request.getParameter("editInventoryID"));
		int stockLevel = Integer.parseInt(request.getParameter("editStockLevel"));
		int minimumStockLevel = Integer.parseInt(request.getParameter("editMinimumStockLevel"));
		String restockDate = request.getParameter("editRestockDate");
		HttpSession session = request.getSession();
		String updatedBy = (String) session.getAttribute("userType"); // User performing the update

		try {
			// Create an instance of InventoryBean with the updated data
			InventoryBean updatedInventory = new InventoryBean(inventoryID, stockLevel, minimumStockLevel, restockDate, updatedBy);

			// Call DAO to update the inventory
			InventoryDao inventoryDao = new InventoryDao();
			boolean success = inventoryDao.updateInventory(updatedInventory);

			// Prepare a success or error message
			String message = success ? "Inventory updated successfully!" : "Failed to update inventory.";
			String messageType = success ? "success" : "error";

			// Redirect with a status message
			response.sendRedirect("inventory_management.jsp?message=" + URLEncoder.encode(message, "UTF-8")
					+ "&messageType=" + URLEncoder.encode(messageType, "UTF-8"));

		} catch (SQLException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
		} catch (NumberFormatException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input: " + e.getMessage());
		}
	}

	private void deleteInventory(HttpServletRequest request, HttpServletResponse response, String categoryId)
			throws IOException, SQLException {

		int id = Integer.parseInt(categoryId);

		try {
			InventoryDao inventoryDao = new InventoryDao();

			boolean success = inventoryDao.deleteInventory(id);

			String message = success ? "Inventory deleted successfully!" : "Failed to delete Inventory.";
			String messageType = success ? "success" : "error";

			response.sendRedirect("inventory_management.jsp?message=" + URLEncoder.encode(message, "UTF-8")
					+ "&messageType=" + URLEncoder.encode(messageType, "UTF-8"));

		} catch (SQLException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
		}

	}
	
	
	private void addToCart(HttpServletRequest request, HttpServletResponse response, String productId, String requestFromPath)
			throws IOException, SQLException {

		int id = Integer.parseInt(productId);

		try {
			
			UsermasterDao userDao = new UsermasterDao();
			HttpSession session = request.getSession();
			int userId = userDao.getUserID((String) session.getAttribute("username"), (String) session.getAttribute("userRole"));
			
			CartBean addCart = new CartBean(userId, id);
			addCart.setQuantity(1);
			CartDao cartDao = new CartDao();

			boolean success = cartDao.addOrUpdateCart(addCart);

			String message = success ? "Product added to cart successfully!" : "Failed to add product to cart.";

			String messageType = success ? "success" : "error";

			response.sendRedirect(requestFromPath + "&message=" + URLEncoder.encode(message, "UTF-8")
					+ "&messageType=" + URLEncoder.encode(messageType, "UTF-8"));

		} catch (SQLException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
		}

	}
	
	

}
