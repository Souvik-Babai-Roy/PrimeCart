package beans;

import java.sql.Timestamp;

public class CartBean {
    private int cartId;
    private int userId;
    private int productId;
    private int variantId;
    private int quantity;
    private Timestamp addedDate;
    private String status;

    // Constructor to initialize Cart with required fields
    public CartBean(int userId, int productId, int quantity, Timestamp addedDate, String status) {
        this.userId = userId;
        this.productId = productId;
        this.quantity = quantity;
        this.addedDate = addedDate;
        this.status = status;
    }
    
    public CartBean(int userId, int productId) {
        this.userId = userId;
        this.productId = productId;
    }

    // Getters and Setters
    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getVariantId() {
        return variantId;
    }

    public void setVariantId(int variantId) {
        this.variantId = variantId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Timestamp getAddedDate() {
        return addedDate;
    }

    public void setAddedDate(Timestamp addedDate) {
        this.addedDate = addedDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
