/**
 * 
 */
package beans;

import java.sql.Date;
/**
 * 
 */
import java.sql.Timestamp;

public class InventoryBean {
    private int inventoryID;
    private int productID;
    private String productName;
    private Integer variantID; // Optional, can be null
    private String warehouseLocation;
    private int stockLevel;
    private int reservedStock;
    private int minimumStockLevel;
    private String restockDate;
    private Timestamp dateUpdated;
    private String updatedBy;
    
    
    // Default Constructor
    public InventoryBean() {
    }

    // Constructor for Adding Inventory
    public InventoryBean(int productID, Integer variantID, String warehouseLocation, int stockLevel, int reservedStock,
                         int minimumStockLevel, String restockDate, String updatedBy) {
        this.productID = productID;
        this.variantID = variantID;
        this.warehouseLocation = warehouseLocation;
        this.stockLevel = stockLevel;
        this.reservedStock = reservedStock;
        this.minimumStockLevel = minimumStockLevel;
        this.restockDate = restockDate;
        this.updatedBy = updatedBy;
    }

    // Constructor for Updating Inventory
    /**
     * @param inventoryID
     * @param stockLevel
     * @param reservedStock
     * @param minimumStockLevel
     * @param restockDate
     * @param updatedBy
     */
    public InventoryBean(int inventoryID, int stockLevel, int minimumStockLevel, String restockDate,
                         String updatedBy) {
        this.inventoryID = inventoryID;
        this.stockLevel = stockLevel;
        this.minimumStockLevel = minimumStockLevel;
        this.restockDate = restockDate;
        this.updatedBy = updatedBy;
    }

    // Constructor for Retrieving Inventory (including all fields)
    public InventoryBean(int inventoryID, int productID, Integer variantID, String warehouseLocation, int stockLevel,
                         int reservedStock, int minimumStockLevel, String restockDate, Timestamp dateUpdated,
                         String updatedBy) {
        this.inventoryID = inventoryID;
        this.productID = productID;
        this.variantID = variantID;
        this.warehouseLocation = warehouseLocation;
        this.stockLevel = stockLevel;
        this.reservedStock = reservedStock;
        this.minimumStockLevel = minimumStockLevel;
        this.restockDate = restockDate;
        this.dateUpdated = dateUpdated;
        this.updatedBy = updatedBy;
    }

    @Override
	public String toString() {
		return "InventoryBean [inventoryID=" + inventoryID + ", productID=" + productID + ", variantID=" + variantID
				+ ", warehouseLocation=" + warehouseLocation + ", stockLevel=" + stockLevel + ", reservedStock="
				+ reservedStock + ", minimumStockLevel=" + minimumStockLevel + ", restockDate=" + restockDate
				+ ", dateUpdated=" + dateUpdated + ", updatedBy=" + updatedBy + "]";
	}

	// Getters and Setters
    public int getInventoryID() {
        return inventoryID;
    }

    public void setInventoryID(int inventoryID) {
        this.inventoryID = inventoryID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public Integer getVariantID() {
        return variantID;
    }

    public void setVariantID(Integer variantID) {
        this.variantID = variantID;
    }

    public String getWarehouseLocation() {
        return warehouseLocation;
    }

    public void setWarehouseLocation(String warehouseLocation) {
        this.warehouseLocation = warehouseLocation;
    }

    public int getStockLevel() {
        return stockLevel;
    }

    public void setStockLevel(int stockLevel) {
        this.stockLevel = stockLevel;
    }

    public int getReservedStock() {
        return reservedStock;
    }

    public void setReservedStock(int reservedStock) {
        this.reservedStock = reservedStock;
    }

    public int getMinimumStockLevel() {
        return minimumStockLevel;
    }

    public void setMinimumStockLevel(int minimumStockLevel) {
        this.minimumStockLevel = minimumStockLevel;
    }

    public String getRestockDate() {
        return restockDate;
    }

    public void setRestockDate(String restockDate) {
        this.restockDate = restockDate;
    }

    public Timestamp getDateUpdated() {
        return dateUpdated;
    }

    public void setDateUpdated(Timestamp dateUpdated) {
        this.dateUpdated = dateUpdated;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}
}
