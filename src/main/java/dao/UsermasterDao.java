package dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import helpers.Helper;

import beans.UsermasterBean;

public class UsermasterDao {

    private Connection connection;

 // Constructor to initialize the connection
 	public UsermasterDao() throws SQLException {
 		this.connection = Helper.getConnection();
 	}

 	// Constructor for dependency injection
 	public UsermasterDao(Connection connection) {
 		this.connection = connection;
 	}

    // Add a new user
    public boolean addUser(UsermasterBean user) throws SQLException {
        String query = "INSERT INTO USERMASTER (USERMASTERID, FIRSTNAME, LASTNAME, EMAIL, PASSWORDHASH, " +
                       "PHONENUMBER, GENDER, USERROLE, DATECREATED, MODIFIEDBY, DATEMODIFIED, LASTLOGIN, STATUS) " +
                       "VALUES (USER_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP, ?, CURRENT_TIMESTAMP, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPasswordHash());
            ps.setString(5, user.getPhoneNumber());
            ps.setString(6, user.getGender());
            ps.setString(7, user.getUserRole());
            ps.setString(8, user.getModifiedBy());
            ps.setTimestamp(9, user.getLastLogin());
            ps.setString(10, user.getStatus());
            return ps.executeUpdate() > 0;
        }
    }

    // Retrieve all users
    public List<UsermasterBean> getAllUsers() throws SQLException {
        List<UsermasterBean> users = new ArrayList<>();
        String query = "SELECT * FROM USERMASTER";
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                users.add(new UsermasterBean(
                        rs.getInt("USERMASTERID"),
                        rs.getString("FIRSTNAME"),
                        rs.getString("LASTNAME"),
                        rs.getString("EMAIL"),
                        rs.getString("PASSWORDHASH"),
                        rs.getString("PHONENUMBER"),
                        rs.getString("GENDER"),
                        rs.getString("USERROLE"),
                        rs.getTimestamp("DATECREATED"),
                        rs.getString("MODIFIEDBY"),
                        rs.getTimestamp("DATEMODIFIED"),
                        rs.getTimestamp("LASTLOGIN"),
                        rs.getString("STATUS")
                ));
            }
        }
        return users;
    }

    // Update a user
    public boolean updateUser(UsermasterBean user) throws SQLException {
        String query = "UPDATE USERMASTER SET FIRSTNAME=?, LASTNAME=?, EMAIL=?, PHONENUMBER=?, GENDER=?, " +
                       "USERROLE=?, MODIFIEDBY=?, DATEMODIFIED=CURRENT_TIMESTAMP, LASTLOGIN=?, STATUS=? " +
                       "WHERE USERMASTERID=?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhoneNumber());
            ps.setString(5, user.getGender());
            ps.setString(6, user.getUserRole());
            ps.setString(7, user.getModifiedBy());
            ps.setTimestamp(8, user.getLastLogin());
            ps.setString(9, user.getStatus());
            ps.setInt(10, user.getUserMasterID());
            return ps.executeUpdate() > 0;
        }
    }
    
    // Update First and Last Name
    public boolean updateName(int userMasterID, String firstName, String lastName, String modifiedBy) throws SQLException {
        String query = "UPDATE USERMASTER SET FIRSTNAME = ?, LASTNAME = ?, MODIFIEDBY = ?, DATEMODIFIED = CURRENT_TIMESTAMP WHERE USERMASTERID = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, modifiedBy);
            ps.setInt(4, userMasterID);
            return ps.executeUpdate() > 0;
        }
    }

    // Update Email
    public boolean updateEmail(int userMasterID, String email, String modifiedBy) throws SQLException {
        String query = "UPDATE USERMASTER SET EMAIL = ?, MODIFIEDBY = ?, DATEMODIFIED = CURRENT_TIMESTAMP WHERE USERMASTERID = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, email);
            ps.setString(2, modifiedBy);
            ps.setInt(3, userMasterID);
            return ps.executeUpdate() > 0;
        }
    }

    // Update Gender
    public boolean updateGender(int userMasterID, String gender, String modifiedBy) throws SQLException {
        String query = "UPDATE USERMASTER SET GENDER = ?, MODIFIEDBY = ?, DATEMODIFIED = CURRENT_TIMESTAMP WHERE USERMASTERID = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, gender);
            ps.setString(2, modifiedBy);
            ps.setInt(3, userMasterID);
            return ps.executeUpdate() > 0;
        }
    }

    // Update Mobile Number
    public boolean updatePhoneNumber(int userMasterID, String phoneNumber, String modifiedBy) throws SQLException {
        String query = "UPDATE USERMASTER SET PHONENUMBER = ?, MODIFIEDBY = ?, DATEMODIFIED = CURRENT_TIMESTAMP WHERE USERMASTERID = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, phoneNumber);
            ps.setString(2, modifiedBy);
            ps.setInt(3, userMasterID);
            return ps.executeUpdate() > 0;
        }
    }

    // Update Password
    public boolean updatePassword(int userMasterID, String passwordHash, String modifiedBy) throws SQLException {
        String query = "UPDATE USERMASTER SET PASSWORDHASH = ?, MODIFIEDBY = ?, DATEMODIFIED = CURRENT_TIMESTAMP WHERE USERMASTERID = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, passwordHash);
            ps.setString(2, modifiedBy);
            ps.setInt(3, userMasterID);
            return ps.executeUpdate() > 0;
        }
    }

    // Delete a user by ID
    public boolean deleteUser(int userMasterID) throws SQLException {
        String query = "DELETE FROM USERMASTER WHERE USERMASTERID=?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, userMasterID);
            return ps.executeUpdate() > 0;
        }
    }

    // Retrieve a user by ID
    public UsermasterBean getUserById(int userMasterID) throws SQLException {
        String query = "SELECT * FROM USERMASTER WHERE USERMASTERID=?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, userMasterID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new UsermasterBean(
                            rs.getInt("USERMASTERID"),
                            rs.getString("FIRSTNAME"),
                            rs.getString("LASTNAME"),
                            rs.getString("EMAIL"),
                            rs.getString("PASSWORDHASH"),
                            rs.getString("PHONENUMBER"),
                            rs.getString("GENDER"),
                            rs.getString("USERROLE"),
                            rs.getTimestamp("DATECREATED"),
                            rs.getString("MODIFIEDBY"),
                            rs.getTimestamp("DATEMODIFIED"),
                            rs.getTimestamp("LASTLOGIN"),
                            rs.getString("STATUS")
                    );
                }
            }
        }
        return null;
    }
    
    
    public String validateLoginAndGetRole(String email, String passwordHash) throws SQLException {
        String query = "SELECT USERROLE FROM USERMASTER WHERE EMAIL = ? AND PASSWORDHASH = ? AND STATUS = 'Active'";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, email);
            ps.setString(2, passwordHash);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("USERROLE");
                }
            }
        }
        return null; // Return null if no matching user found
    }
    
    public int getUserID(String email, String userRole) throws SQLException {
        String query = "SELECT USERMASTERID FROM USERMASTER WHERE EMAIL = ? AND USERROLE = ?";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, email);
            ps.setString(2, userRole);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("USERMASTERID");
                }
            }
        }
        return -1; // Return -1 if no matching user found
    }

    
    
    
}
