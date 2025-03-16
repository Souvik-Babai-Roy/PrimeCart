package beans;

import java.sql.Timestamp;
import java.util.Date;

public class ProductsBean {
    private int productID;
    private String productCode;
    private int categoryID;
    private String productName;
    private String brand;
    private double rating;
    private int totalRatings;
    private double price;
    private double mrp;
    private double discountPercentage;
    private String description;
    private String specifications;
    private double shippingWeight;
    private String shippingDimensions;
    private int payOnDelivery;
    private int replacementDay;
    private String warrantyPeriod;
    private String manufacturer;
    private String brandOrigin;
    private String modelName;
    private String unit;
    private String hsn;
    private Timestamp dateAdded;
    private Timestamp lastUpdated;
    private String updatedBy;
    private Date promoStartDate;
    private Date promoEndDate;
    private String status;

    public ProductsBean() {
        super();
    }
    
 // Constructor for Add a Product
    public ProductsBean(String productCode, int categoryID, String productName, String brand,
			double price, double mrp, double discountPercentage, String description,
			String specifications, double shippingWeight, String shippingDimensions, int payOnDelivery,
			int replacementDay, String warrantyPeriod, String manufacturer, String brandOrigin, String modelName,
			String unit, String hsn) {
		this.productCode = productCode;
		this.categoryID = categoryID;
		this.productName = productName;
		this.brand = brand;
		this.price = price;
		this.mrp = mrp;
		this.discountPercentage = discountPercentage;
		this.description = description;
		this.specifications = specifications;
		this.shippingWeight = shippingWeight;
		this.shippingDimensions = shippingDimensions;
		this.payOnDelivery = payOnDelivery;
		this.replacementDay = replacementDay;
		this.warrantyPeriod = warrantyPeriod;
		this.manufacturer = manufacturer;
		this.brandOrigin = brandOrigin;
		this.modelName = modelName;
		this.unit = unit;
		this.hsn = hsn;
	}
    
 // Constructor for General Info Updation of a Product
    public ProductsBean(int productID, String productCode, int categoryID, String productName, String brand,
    		double price, double mrp, double discountPercentage, String description,
			String specifications, double shippingWeight, String shippingDimensions, int payOnDelivery,
			int replacementDay, String warrantyPeriod, String manufacturer, String brandOrigin, String modelName,
			String unit, String hsn, String updatedBy, String status) {
		this.productID = productID;
		this.productCode = productCode;
		this.categoryID = categoryID;
		this.productName = productName;
		this.brand = brand;
		this.price = price;
		this.mrp = mrp;
		this.discountPercentage = discountPercentage;
		this.description = description;
		this.specifications = specifications;
		this.shippingWeight = shippingWeight;
		this.shippingDimensions = shippingDimensions;
		this.payOnDelivery = payOnDelivery;
		this.replacementDay = replacementDay;
		this.warrantyPeriod = warrantyPeriod;
		this.manufacturer = manufacturer;
		this.brandOrigin = brandOrigin;
		this.modelName = modelName;
		this.unit = unit;
		this.hsn = hsn;
		this.updatedBy = updatedBy;
		this.status = status;
	}



	public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public int getTotalRatings() {
        return totalRatings;
    }

    public void setTotalRatings(int totalRatings) {
        this.totalRatings = totalRatings;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getMrp() {
        return mrp;
    }

    public void setMrp(double mrp) {
        this.mrp = mrp;
    }

    public double getDiscountPercentage() {
        return discountPercentage;
    }

    public void setDiscountPercentage(double discountPercentage) {
        this.discountPercentage = discountPercentage;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSpecifications() {
        return specifications;
    }

    public void setSpecifications(String specifications) {
        this.specifications = specifications;
    }

    public double getShippingWeight() {
        return shippingWeight;
    }

    public void setShippingWeight(double shippingWeight) {
        this.shippingWeight = shippingWeight;
    }

    public String getShippingDimensions() {
        return shippingDimensions;
    }

    public void setShippingDimensions(String shippingDimensions) {
        this.shippingDimensions = shippingDimensions;
    }

    public int isPayOnDelivery() {
        return payOnDelivery;
    }

    public void setPayOnDelivery(int payOnDelivery) {
        this.payOnDelivery = payOnDelivery;
    }

    public int getReplacementDay() {
        return replacementDay;
    }

    public void setReplacementDay(int replacementDay) {
        this.replacementDay = replacementDay;
    }

    public String getWarrantyPeriod() {
        return warrantyPeriod;
    }

    public void setWarrantyPeriod(String warrantyPeriod) {
        this.warrantyPeriod = warrantyPeriod;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getBrandOrigin() {
        return brandOrigin;
    }

    public void setBrandOrigin(String brandOrigin) {
        this.brandOrigin = brandOrigin;
    }

    public String getModelName() {
        return modelName;
    }

    public void setModelName(String modelName) {
        this.modelName = modelName;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getHsn() {
        return hsn;
    }

    public void setHsn(String hsn) {
        this.hsn = hsn;
    }

    public Timestamp getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(Timestamp dateAdded) {
        this.dateAdded = dateAdded;
    }

    public Timestamp getLastUpdated() {
        return lastUpdated;
    }

    public void setLastUpdated(Timestamp lastUpdated) {
        this.lastUpdated = lastUpdated;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }

    public Date getPromoStartDate() {
        return promoStartDate;
    }

    public void setPromoStartDate(Date promoStartDate) {
        this.promoStartDate = promoStartDate;
    }

    public Date getPromoEndDate() {
        return promoEndDate;
    }

    public void setPromoEndDate(Date promoEndDate) {
        this.promoEndDate = promoEndDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

	@Override
	public String toString() {
		return "ProductsBean [productID=" + productID + ", productCode=" + productCode + ", categoryID=" + categoryID
				+ ", productName=" + productName + ", brand=" + brand + ", rating=" + rating + ", totalRatings="
				+ totalRatings + ", price=" + price + ", mrp=" + mrp + ", discountPercentage=" + discountPercentage
				+ ", description=" + description + ", specifications=" + specifications + ", shippingWeight="
				+ shippingWeight + ", shippingDimensions=" + shippingDimensions + ", payOnDelivery=" + payOnDelivery
				+ ", replacementDay=" + replacementDay + ", warrantyPeriod=" + warrantyPeriod + ", manufacturer="
				+ manufacturer + ", brandOrigin=" + brandOrigin + ", modelName=" + modelName + ", unit=" + unit
				+ ", hsn=" + hsn + ", dateAdded=" + dateAdded + ", lastUpdated=" + lastUpdated + ", updatedBy="
				+ updatedBy + ", promoStartDate=" + promoStartDate + ", promoEndDate=" + promoEndDate + ", status="
				+ status + "]";
	}
    
    
}
