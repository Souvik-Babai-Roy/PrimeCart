package dao;

import java.sql.*;
import java.util.*;
import beans.ProductsBean;
import helpers.Helper;

public class ProductDao {
    private Connection connection;

    // Constructor to initialize the connection
    public ProductDao() throws SQLException {
        this.connection = Helper.getConnection();
    }

    // Constructor for dependency injection
    public ProductDao(Connection connection) {
        this.connection = connection;
    }

    // Add a New Product
    public boolean addProduct(ProductsBean product) throws SQLException {
        if (checkProductByName(product.getProductName()) == null) {
            String sql = "INSERT INTO Products (ProductCode, CategoryID, ProductName, Brand, Price, MRP, DiscountPercentage, "
                    + "Description, Specifications, ShippingWeight, ShippingDimensions, PayOnDelivery, ReplacementDay, WarrantyPeriod, Manufacturer, BrandOrigin, "
                    + "ModelName, Unit, HSN) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, product.getProductCode());
            ps.setInt(2, product.getCategoryID());
            ps.setString(3, product.getProductName());
            ps.setString(4, product.getBrand());
            ps.setDouble(5, product.getPrice());
            ps.setDouble(6, product.getMrp());
            ps.setDouble(7, product.getDiscountPercentage());
            ps.setString(8, product.getDescription());
            ps.setString(9, product.getSpecifications());
            ps.setDouble(10, product.getShippingWeight());
            ps.setString(11, product.getShippingDimensions());
            ps.setInt(12, product.isPayOnDelivery());
            ps.setInt(13, product.getReplacementDay());
            ps.setString(14, product.getWarrantyPeriod());
            ps.setString(15, product.getManufacturer());
            ps.setString(16, product.getBrandOrigin());
            ps.setString(17, product.getModelName());
            ps.setString(18, product.getUnit());
            ps.setString(19, product.getHsn());
            return ps.executeUpdate() > 0;
        }
        return false;
    }

    // Update an Existing Product
    public boolean updateProduct(ProductsBean product) throws SQLException {
        String sql = "UPDATE Products SET ProductCode=?, CategoryID=?, ProductName=?, Brand=?, Rating=?, TotalRatings=?, Price=?, MRP=?, "
                + "DiscountPercentage=?, Description=?, Specifications=?, ShippingWeight=?, ShippingDimensions=?, PayOnDelivery=?, "
                + "ReplacementDay=?, WarrantyPeriod=?, Manufacturer=?, BrandOrigin=?, ModelName=?, Unit=?, HSN=?, UpdatedBy=?, Status=?, "
                + "LastUpdated=CURRENT_TIMESTAMP WHERE ProductID=?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, product.getProductCode());
        ps.setInt(2, product.getCategoryID());
        ps.setString(3, product.getProductName());
        ps.setString(4, product.getBrand());
        ps.setDouble(5, product.getRating());
        ps.setInt(6, product.getTotalRatings());
        ps.setDouble(7, product.getPrice());
        ps.setDouble(8, product.getMrp());
        ps.setDouble(9, product.getDiscountPercentage());
        ps.setString(10, product.getDescription());
        ps.setString(11, product.getSpecifications());
        ps.setDouble(12, product.getShippingWeight());
        ps.setString(13, product.getShippingDimensions());
        ps.setInt(14, product.isPayOnDelivery());
        ps.setInt(15, product.getReplacementDay());
        ps.setString(16, product.getWarrantyPeriod());
        ps.setString(17, product.getManufacturer());
        ps.setString(18, product.getBrandOrigin());
        ps.setString(19, product.getModelName());
        ps.setString(20, product.getUnit());
        ps.setString(21, product.getHsn());
        ps.setString(22, product.getUpdatedBy());
        ps.setString(23, product.getStatus());
        ps.setInt(24, product.getProductID());
        return ps.executeUpdate() > 0;
    }

    // Delete a Product
    public boolean deleteProduct(int productID) throws SQLException {
        String sql = "DELETE FROM Products WHERE ProductID=?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, productID);
        return ps.executeUpdate() > 0;
    }

    // Get Product by ID
    public ProductsBean getProductByID(int productID) throws SQLException {
        String sql = "SELECT * FROM Products WHERE ProductID=?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, productID);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return extractProductFromResultSet(rs);
        }
        return null;
    }

    // Check Product by Name
    public ProductsBean checkProductByName(String productName) throws SQLException {
        String sql = "SELECT * FROM Products WHERE ProductName=?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, productName);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return extractProductFromResultSet(rs);
        }
        return null;
    }

    // Get All Products
    public List<ProductsBean> getAllProducts() throws SQLException {
        String sql = "SELECT * FROM Products order by productid desc";
        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        List<ProductsBean> productList = new ArrayList<>();
        while (rs.next()) {
            productList.add(extractProductFromResultSet(rs));
        }
        return productList;
    }

    // Helper Method to Extract Product from ResultSet
    private ProductsBean extractProductFromResultSet(ResultSet rs) throws SQLException {
        ProductsBean product = new ProductsBean();
        product.setProductID(rs.getInt("ProductID"));
        product.setProductCode(rs.getString("ProductCode"));
        product.setCategoryID(rs.getInt("CategoryID"));
        product.setProductName(rs.getString("ProductName"));
        product.setBrand(rs.getString("Brand"));
        product.setRating(rs.getDouble("Rating"));
        product.setTotalRatings(rs.getInt("TotalRatings"));
        product.setPrice(rs.getDouble("Price"));
        product.setMrp(rs.getDouble("MRP"));
        product.setDiscountPercentage(rs.getDouble("DiscountPercentage"));
        product.setDescription(rs.getString("Description"));
        product.setSpecifications(rs.getString("Specifications"));
        product.setShippingWeight(rs.getDouble("ShippingWeight"));
        product.setShippingDimensions(rs.getString("ShippingDimensions"));
        product.setPayOnDelivery(rs.getInt("PayOnDelivery"));
        product.setReplacementDay(rs.getInt("ReplacementDay"));
        product.setWarrantyPeriod(rs.getString("WarrantyPeriod"));
        product.setManufacturer(rs.getString("Manufacturer"));
        product.setBrandOrigin(rs.getString("BrandOrigin"));
        product.setModelName(rs.getString("ModelName"));
        product.setUnit(rs.getString("Unit"));
        product.setHsn(rs.getString("HSN"));
        product.setDateAdded(rs.getTimestamp("DateAdded"));
        product.setLastUpdated(rs.getTimestamp("LastUpdated"));
        product.setUpdatedBy(rs.getString("UpdatedBy"));
        product.setStatus(rs.getString("Status"));
        return product;
    }
    
 // Method to search products by name (used for autocomplete)
    public List<ProductsBean> searchProductsByName(String query) throws SQLException {
        String sql = "SELECT * FROM PRODUCTS WHERE lower(PRODUCTNAME) LIKE lower(?) FETCH FIRST 10 ROWS ONLY"; // Adjust for your DB setup
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, "%" + query + "%"); // Use wildcard for partial matching
        ResultSet rs = ps.executeQuery();
        
        List<ProductsBean> productList = new ArrayList<>();
        while (rs.next()) {
            productList.add(extractProductFromResultSet(rs)); // Add matched product to the list
        }
        return productList;
    }

    
}
