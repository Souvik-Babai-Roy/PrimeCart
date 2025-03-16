package beans;

import java.sql.Timestamp;

public class CategoriesBean {
    private int categoryID;
    private String categoryName;
    private String categoryDescription;
    private Timestamp dateAdded;
    private Timestamp lastUpdated;
    private String updatedBy;
    private String status;

    public CategoriesBean() {
        super();
    }
    
    
 // Constructor for Adding a New Category
    public CategoriesBean(String categoryName, String categoryDescription, String updatedBy) {
        this.categoryName = categoryName;
        this.categoryDescription = categoryDescription;
        this.updatedBy = updatedBy;
    }

    // Constructor for Updating a Category
    public CategoriesBean(int categoryID, String categoryName, String categoryDescription, String updatedBy, String status) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.categoryDescription = categoryDescription;
        this.updatedBy = updatedBy;
        this.status = status;
    }
	


    public int getCategoryID() {
		return categoryID;
	}



	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}



	public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryDescription() {
        return categoryDescription;
    }

    public void setCategoryDescription(String categoryDescription) {
        this.categoryDescription = categoryDescription;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}

