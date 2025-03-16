package dao;

import java.sql.*;
import java.util.*;

import beans.CategoriesBean;
import helpers.Helper;

public class CategoriesDao {
	private Connection connection;

	// Constructor to initialize the connection
	public CategoriesDao() throws SQLException {
		this.connection = Helper.getConnection();
	}

	// Constructor for dependency injection
	public CategoriesDao(Connection connection) {
		this.connection = connection;
	}

	// Add a New Category
	public boolean addCategory(CategoriesBean category) throws SQLException {
		if (checkCategoryByName(category.getCategoryName()) == null) {
			String sql = "INSERT INTO Categories (CategoryName, CategoryDescription, UpdatedBy) VALUES (?, ?, ?)";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, category.getCategoryName());
			ps.setString(2, category.getCategoryDescription());
			ps.setString(3, category.getUpdatedBy());
			return ps.executeUpdate() > 0;
		}
		return false;
	}

	// Update an Existing Category
	public boolean updateCategory(CategoriesBean category) throws SQLException {
			String sql = "UPDATE Categories SET CategoryName = ?, CategoryDescription = ?, UpdatedBy = ?, Status = ?, LastUpdated = CURRENT_TIMESTAMP WHERE CategoryID = ?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, category.getCategoryName());
			ps.setString(2, category.getCategoryDescription());
			ps.setString(3, category.getUpdatedBy());
			ps.setString(4, category.getStatus());
			ps.setInt(5, category.getCategoryID());
			return ps.executeUpdate() > 0;
	}

	// Delete a Category
	public boolean deleteCategory(int categoryID) throws SQLException {
		String sql = "DELETE from Categories WHERE CategoryID = ?";
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setInt(1, categoryID);
		return ps.executeUpdate() > 0;
	}

	// Fetch All Categories
	public List<CategoriesBean> getAllCategories() throws SQLException {
		String sql = "SELECT * FROM Categories order by CategoryName";
		Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery(sql);

		List<CategoriesBean> categories = new ArrayList<>();
		while (rs.next()) {
			CategoriesBean category = new CategoriesBean();
			category.setCategoryID(rs.getInt("CategoryID"));
			category.setCategoryName(rs.getString("CategoryName"));
			category.setCategoryDescription(rs.getString("CategoryDescription"));
			category.setDateAdded(rs.getTimestamp("DateAdded"));
			category.setLastUpdated(rs.getTimestamp("LastUpdated"));
			category.setUpdatedBy(rs.getString("UpdatedBy"));
			category.setStatus(rs.getString("Status"));
			categories.add(category);
		}
		return categories;
	}
	
	// Fetch Active Categories
		public List<CategoriesBean> getActiveCategories() throws SQLException {
			String sql = "SELECT CategoryID,CategoryName  FROM Categories order by CategoryName";
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			List<CategoriesBean> categories = new ArrayList<>();
			while (rs.next()) {
				CategoriesBean category = new CategoriesBean();
				category.setCategoryID(rs.getInt("CategoryID"));
				category.setCategoryName(rs.getString("CategoryName"));
				categories.add(category);
			}
			return categories;
		}

	// Fetch a Single Category by ID
	public CategoriesBean getCategoryByID(int categoryID) throws SQLException {
		String sql = "SELECT * FROM Categories WHERE CategoryID = ?";
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setInt(1, categoryID);
		ResultSet rs = ps.executeQuery();

		if (rs.next()) {
			CategoriesBean category = new CategoriesBean();
			category.setCategoryID(rs.getInt("CategoryID"));
			category.setCategoryName(rs.getString("CategoryName"));
			category.setCategoryDescription(rs.getString("CategoryDescription"));
			category.setDateAdded(rs.getTimestamp("DateAdded"));
			category.setLastUpdated(rs.getTimestamp("LastUpdated"));
			category.setUpdatedBy(rs.getString("UpdatedBy"));
			category.setStatus(rs.getString("Status"));
			return category;
		}
		return null;
	}

	// check for already exist Category by name
	public CategoriesBean checkCategoryByName(String categoryName) throws SQLException {
		String sql = "SELECT * FROM Categories WHERE CATEGORYNAME = ?";
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setString(1, categoryName);
		ResultSet rs = ps.executeQuery();

		if (rs.next()) {
			CategoriesBean category = new CategoriesBean();
			category.setCategoryID(rs.getInt("CategoryID"));
			category.setCategoryName(rs.getString("CategoryName"));
			category.setCategoryDescription(rs.getString("CategoryDescription"));
			category.setDateAdded(rs.getTimestamp("DateAdded"));
			category.setLastUpdated(rs.getTimestamp("LastUpdated"));
			category.setUpdatedBy(rs.getString("UpdatedBy"));
			category.setStatus(rs.getString("Status"));
			return category;
		}
		return null;
	}
}
