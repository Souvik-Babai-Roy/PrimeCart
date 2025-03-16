package beans;

import java.sql.Timestamp;

public class ProductImage {
    private int imageID;     // Primary Key
    private int productID;   // Foreign Key to Products table
    private int variantID;   // Foreign Key to ProductVariants table (optional)
    private String imageURL; // URL/path to the image
    private boolean isPrimary; // 1 if this is the primary image, 0 otherwise
    private Timestamp dateAdded; // Timestamp when the image was added
    private Timestamp lastUpdated; // Timestamp when the image was last updated

    // Default Constructor
    public ProductImage() {
        super();
    }

    // Parameterized Constructor
    public ProductImage(int imageID, int productID, int variantID, String imageURL, boolean isPrimary,
                        Timestamp dateAdded, Timestamp lastUpdated) {
        super();
        this.imageID = imageID;
        this.productID = productID;
        this.variantID = variantID;
        this.imageURL = imageURL;
        this.isPrimary = isPrimary;
        this.dateAdded = dateAdded;
        this.lastUpdated = lastUpdated;
    }

    // Getters and Setters
    public int getImageID() {
        return imageID;
    }

    public void setImageID(int imageID) {
        this.imageID = imageID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getVariantID() {
        return variantID;
    }

    public void setVariantID(int variantID) {
        this.variantID = variantID;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public boolean isPrimary() {
        return isPrimary;
    }

    public void setPrimary(boolean isPrimary) {
        this.isPrimary = isPrimary;
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

    @Override
    public String toString() {
        return "ProductImage [imageID=" + imageID + ", productID=" + productID + ", variantID=" + variantID +
                ", imageURL=" + imageURL + ", isPrimary=" + isPrimary +
                ", dateAdded=" + dateAdded + ", lastUpdated=" + lastUpdated + "]";
    }
}
