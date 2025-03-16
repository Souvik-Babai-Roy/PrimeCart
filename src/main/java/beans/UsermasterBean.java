package beans;

import java.sql.Timestamp;

public class UsermasterBean {

    private int userMasterID;
    private String firstName;
    private String lastName;
    private String email;
    private String passwordHash;
    private String phoneNumber;
    private String gender;
    private String userRole;
    private Timestamp dateCreated;
    private String modifiedBy;
    private Timestamp dateModified;
    private Timestamp lastLogin;
    private String status;

    // Default Constructor
    public UsermasterBean() {
    }

    // Parameterized Constructor
    public UsermasterBean(int userMasterID, String firstName, String lastName, String email, String passwordHash,
                          String phoneNumber, String gender, String userRole, Timestamp dateCreated,
                          String modifiedBy, Timestamp dateModified, Timestamp lastLogin, String status) {
        this.userMasterID = userMasterID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.passwordHash = passwordHash;
        this.phoneNumber = phoneNumber;
        this.gender = gender;
        this.userRole = userRole;
        this.dateCreated = dateCreated;
        this.modifiedBy = modifiedBy;
        this.dateModified = dateModified;
        this.lastLogin = lastLogin;
        this.status = status;
    }

    // Getters and Setters
    public int getUserMasterID() {
        return userMasterID;
    }

    public void setUserMasterID(int userMasterID) {
        this.userMasterID = userMasterID;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    public Timestamp getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Timestamp dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public Timestamp getDateModified() {
        return dateModified;
    }

    public void setDateModified(Timestamp dateModified) {
        this.dateModified = dateModified;
    }

    public Timestamp getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Timestamp lastLogin) {
        this.lastLogin = lastLogin;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
