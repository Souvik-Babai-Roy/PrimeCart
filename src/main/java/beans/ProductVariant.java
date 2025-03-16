/**
 * 
 */
package beans;

/**
 * 
 */
public class ProductVariant {
    private int variantID; // Primary Key
    private int productID; // Foreign Key to Products table
    private String color;  // Color variant
    private String size;   // Optional size variant
    private String pattern; // Pattern variant

	/**
	 * 
	 */
	public ProductVariant() {
		// TODO Auto-generated constructor stub
	}

	public int getVariantID() {
		return variantID;
	}

	public void setVariantID(int variantID) {
		this.variantID = variantID;
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getPattern() {
		return pattern;
	}

	public void setPattern(String pattern) {
		this.pattern = pattern;
	}

	@Override
	public String toString() {
		return "ProductVariant [variantID=" + variantID + ", productID=" + productID + ", color=" + color + ", size="
				+ size + ", pattern=" + pattern + "]";
	}
	
	

}
