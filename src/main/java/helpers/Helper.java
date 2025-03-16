package helpers;

import java.sql.*;

public class Helper {
	
	static {
	    try {
	        Class.forName("oracle.jdbc.OracleDriver");
	    } catch (ClassNotFoundException e) {
	        throw new RuntimeException("Oracle JDBC Driver not found.", e);
	    }
	}

	
	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xepdb1", "admin", "password"); 	
    }
    // Star color logic
    public static String getStarColour(int ratingPercentage) {
        if (ratingPercentage == 100) return "#4caf50";
        else if (ratingPercentage >= 80) return "#8bc34a";
        else if (ratingPercentage >= 60) return "#ffeb3b";
        else if (ratingPercentage >= 40) return "#ff9800";
        else return "#f44336";
    }
    
    
    
    

}
