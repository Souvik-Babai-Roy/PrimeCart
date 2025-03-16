package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import beans.CategoriesBean;
import beans.InventoryBean;
import helpers.Helper;

public class InventoryDao {
	private Connection connection;

	// Constructor to initialize the connection
	public InventoryDao() throws SQLException {
		this.connection = Helper.getConnection();
	}

	// Constructor for dependency injection
	public InventoryDao(Connection connection) {
		this.connection = connection;
	}

	// Method to Add Inventory
	public boolean addInventory(InventoryBean inventory) throws SQLException {
		if (getInventoryByProductId(inventory.getProductID()) == null) {
			String sql = "INSERT INTO Inventory (ProductID, WarehouseLocation, StockLevel, "
					+ "MinimumStockLevel, RestockDate, UpdatedBy) VALUES (?, ?, ?, ?, TO_TIMESTAMP(? , 'YYYY-MM-DD'), ?)";
			try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
				pstmt.setInt(1, inventory.getProductID());
				pstmt.setString(2, inventory.getWarehouseLocation());
				pstmt.setInt(3, inventory.getStockLevel());
				pstmt.setInt(4, inventory.getMinimumStockLevel());
				pstmt.setString(5, inventory.getRestockDate());
				pstmt.setString(6, inventory.getUpdatedBy());
				return pstmt.executeUpdate() > 0;
			}
		}
		return false;
	}

	// Method to Update Inventory
	public boolean updateInventory(InventoryBean inventory) throws SQLException {
		String sql = "UPDATE Inventory SET StockLevel = ?, MinimumStockLevel = ?, RestockDate = TO_TIMESTAMP(? , 'YYYY-MM-DD'), "
				+ "UpdatedBy = ?, DateUpdated = CURRENT_TIMESTAMP WHERE InventoryID = ?";
		try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
			pstmt.setInt(1, inventory.getStockLevel());
			pstmt.setInt(2, inventory.getMinimumStockLevel());
			pstmt.setString(3, inventory.getRestockDate());
			pstmt.setString(4, inventory.getUpdatedBy());
			pstmt.setInt(5, inventory.getInventoryID());
			return pstmt.executeUpdate() > 0;
		}
	}

	// Method to Get All Inventory Records
	public List<InventoryBean> getAllInventory() throws SQLException {
		String sql = "SELECT inventory.INVENTORYID, inventory.PRODUCTID, products.productname, inventory.WAREHOUSELOCATION, "
				+ "inventory.STOCKLEVEL, inventory.MINIMUMSTOCKLEVEL, TRUNC(inventory.restockdate) AS restockdate, "
				+ "TRUNC(inventory.DATEUPDATED) AS dateupdated, inventory.UPDATEDBY " + "FROM inventory, products "
				+ "WHERE inventory.PRODUCTID = products.productid";

		List<InventoryBean> inventoryList = new ArrayList<>();
		try (Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
			while (rs.next()) {
				InventoryBean inventory = new InventoryBean();
				inventory.setInventoryID(rs.getInt("InventoryID"));
				inventory.setProductID(rs.getInt("ProductID"));
				inventory.setProductName(rs.getString("productname"));
				inventory.setWarehouseLocation(rs.getString("WarehouseLocation"));
				inventory.setStockLevel(rs.getInt("StockLevel"));
				inventory.setMinimumStockLevel(rs.getInt("MinimumStockLevel"));
				inventory.setRestockDate(rs.getString("RestockDate"));
				inventory.setDateUpdated(rs.getTimestamp("DateUpdated"));
				inventory.setUpdatedBy(rs.getString("UpdatedBy"));
				inventoryList.add(inventory);
			}
		}
		return inventoryList;
	}

	// Method to Get Inventory by InventoryID
	public InventoryBean getInventoryById(int inventoryID) throws SQLException {
		String sql = "SELECT * FROM Inventory WHERE InventoryID = ?";
		try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
			pstmt.setInt(1, inventoryID);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return extractInventoryFromResultSet(rs);
				}
			}
		}
		return null; // Return null if no record is found
	}

	// Method to Get Inventory by ProductID
	public InventoryBean getInventoryByProductId(int productID) throws SQLException {
		String sql = "SELECT * FROM Inventory WHERE ProductID = ?";
		try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
			pstmt.setInt(1, productID);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return extractInventoryFromResultSet(rs);
				}
			}
		}
		return null; // Return null if no record is found
	}

	// Method to Delete Inventory by InventoryID
	public boolean deleteInventory(int inventoryID) throws SQLException {
		String sql = "DELETE FROM Inventory WHERE InventoryID = ?";
		try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
			pstmt.setInt(1, inventoryID);
			return pstmt.executeUpdate() > 0;
		}
	}

	// Helper Method to Extract Inventory from ResultSet
	private InventoryBean extractInventoryFromResultSet(ResultSet rs) throws SQLException {
		InventoryBean inventory = new InventoryBean();
		inventory.setInventoryID(rs.getInt("InventoryID"));
		inventory.setProductID(rs.getInt("ProductID"));
		inventory.setVariantID(rs.getObject("VariantID") != null ? rs.getInt("VariantID") : null);
		inventory.setWarehouseLocation(rs.getString("WarehouseLocation"));
		inventory.setStockLevel(rs.getInt("StockLevel"));
		inventory.setReservedStock(rs.getInt("ReservedStock"));
		inventory.setMinimumStockLevel(rs.getInt("MinimumStockLevel"));
		inventory.setRestockDate(rs.getString("RestockDate"));
		inventory.setDateUpdated(rs.getTimestamp("DateUpdated"));
		inventory.setUpdatedBy(rs.getString("UpdatedBy"));
		return inventory;
	}

	// check for already exist Category by name
	public int checkInventoryBeforeAdd(int productID, String WarehouseLocation) throws SQLException {
		String sql = "SELECT * FROM Inventory WHERE productID = ? and WarehouseLocation = ?";
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setInt(1, productID);
		ps.setString(2, WarehouseLocation);
		ResultSet rs = ps.executeQuery();

		int rowCount = 0; // Initialize row count variable

		while (rs.next()) {
			rowCount++; // Increment row count for each row fetched
		}

		// Return the row count (number of records fetched)
		return rowCount;
	}

}