package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import beans.CartBean;
import helpers.Helper;

public class CartDao {
	private Connection connection;

	// Constructor to initialize the connection
	public CartDao() throws SQLException {
		this.connection = Helper.getConnection();
	}

	// Constructor for dependency injection
	public CartDao(Connection connection) {
		this.connection = connection;
	}

	// Method to insert a new cart entry into the database
	public boolean insertCart(CartBean cart) throws SQLException {
	    String sql = "INSERT INTO Cart (UserID, ProductID, Quantity) VALUES (?, ?, 1)";

	    try (PreparedStatement stmt = connection.prepareStatement(sql)) {
	        stmt.setInt(1, cart.getUserId());
	        stmt.setInt(2, cart.getProductId());
	        return stmt.executeUpdate() > 0;
	    }
	}

	// Method to add or update a cart entry
	public boolean addOrUpdateCart(CartBean cart) throws SQLException {
	    String checkProductQuery = "SELECT QUANTITY FROM Cart WHERE USERID = ? AND PRODUCTID = ? AND STATUS = 'Active'";
	    String updateQuantityQuery = "UPDATE Cart SET QUANTITY = QUANTITY + ? WHERE USERID = ? AND PRODUCTID = ? AND STATUS = 'Active'";

	    try {
	        connection.setAutoCommit(false); // Start transaction

	        try (PreparedStatement checkStmt = connection.prepareStatement(checkProductQuery)) {
	            checkStmt.setInt(1, cart.getUserId());
	            checkStmt.setInt(2, cart.getProductId());


	            try (ResultSet rs = checkStmt.executeQuery()) {
	                if (rs.next()) {
	                    // Product exists: Update the quantity
	                    try (PreparedStatement updateStmt = connection.prepareStatement(updateQuantityQuery)) {
	                        updateStmt.setInt(1, cart.getQuantity());
	                        updateStmt.setInt(2, cart.getUserId());
	                        updateStmt.setInt(3, cart.getProductId());
	                        boolean result = updateStmt.executeUpdate() > 0;
	                        connection.commit();
	                        return result;
	                    }
	                } else {
	                    // Product does not exist: Insert a new record
	                    boolean result = insertCart(cart);
	                    connection.commit();
	                    return result;
	                }
	            }
	        }
	    } catch (SQLException e) {
	        connection.rollback(); // Rollback on failure
	        throw e;
	    } finally {
	        connection.setAutoCommit(true); // Restore default
	    }
	}


	// Method to get a cart by its CartID
	public CartBean getCartById(int cartId) throws SQLException {
		String sql = "SELECT * FROM Cart WHERE CartID = ?";
		try (PreparedStatement stmt = connection.prepareStatement(sql)) {
			stmt.setInt(1, cartId);
			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					return mapRowToCart(rs);
				}
			}
		}
		return null;
	}

	// Method to get all carts for a specific user
	public List<CartBean> getCartsByUserId(int userId) throws SQLException {
		String sql = "SELECT * FROM Cart WHERE UserID = ?";
		List<CartBean> carts = new ArrayList<>();
		try (PreparedStatement stmt = connection.prepareStatement(sql)) {
			stmt.setInt(1, userId);
			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					carts.add(mapRowToCart(rs));
				}
			}
		}
		return carts;
	}

	// Method to update a cart item quantity
	public boolean updateCartQuantity(CartBean cart) throws SQLException {
		String sql = "UPDATE Cart SET Quantity = ? WHERE CartID = ?";
		try (PreparedStatement stmt = connection.prepareStatement(sql)) {
			stmt.setInt(1, cart.getQuantity());
			stmt.setInt(2, cart.getCartId());
			return stmt.executeUpdate() > 0;
		}
	}

	// Method to update a cart item status
	public boolean updateCartItemStatus(CartBean cart) throws SQLException {
		String sql = "UPDATE Cart SET status = ? WHERE CartID = ?";
		try (PreparedStatement stmt = connection.prepareStatement(sql)) {
			stmt.setString(1, cart.getStatus());
			stmt.setInt(2, cart.getCartId());
			return stmt.executeUpdate() > 0;
		}
	}

	// Method to delete a cart entry
	public boolean deleteCart(int cartId) throws SQLException {
		String sql = "DELETE FROM Cart WHERE CartID = ?";
		try (PreparedStatement stmt = connection.prepareStatement(sql)) {
			stmt.setInt(1, cartId);
			return stmt.executeUpdate() > 0;
		}
	}

	// Helper method to map a ResultSet row to a CartBean object
	private CartBean mapRowToCart(ResultSet rs) throws SQLException {
		int cartId = rs.getInt("CartID");
		int userId = rs.getInt("UserID");
		int productId = rs.getInt("ProductID");
		int quantity = rs.getInt("Quantity");
		Timestamp addedDate = rs.getTimestamp("AddedDate");
		String status = rs.getString("Status");

		CartBean cart = new CartBean(userId, productId, quantity, addedDate, status);
		cart.setCartId(cartId);
		return cart;
	}
	
//	private int 
	
}
