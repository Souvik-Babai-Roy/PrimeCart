<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Records</title>
</head>
<body>
<%
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
    try {
        // Load Oracle JDBC driver
        Class.forName("oracle.jdbc.driver.OracleDriver");
        
        // Establish a connection to the database
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xepdb1", "admin", "password");

        // Debug: Check connection status
        if (con == null) {
%>
            <p>Connection not established.</p>
<%
        } else {
            out.println("Connection established successfully.<br>");

            // Create a statement and execute query
            stmt = con.createStatement();
            out.println("Executing query...<br>");
            
            // Debug: Use schema name if necessary
            String query = "SELECT * FROM user_master";
            out.println("Query: " + query + "<br>");
            rs = stmt.executeQuery(query);

            // Debug: Check if ResultSet is empty
            if (!rs.isBeforeFirst()) { // Checks if ResultSet has any rows
                out.println("ResultSet is empty. No records found.<br>");
%>
                <p>No records found in the STUDENT table.</p>
<%
            } else {
                out.println("ResultSet has data.<br>");

                // Get metadata for column names
                ResultSetMetaData rsm = rs.getMetaData();
                int colCount = rsm.getColumnCount();

                // Display column names dynamically
%>
                <table border="1">
                <tr>
                <%
                    // Display column headers dynamically
                    for (int i = 1; i <= colCount; i++) {
                %>
                    <th><%= rsm.getColumnName(i) %></th>
                <%
                    }
                %>
                </tr>
<%
                // Loop through and display rows of data
                while (rs.next()) {
%>
                    <tr>
                    <%
                        for (int i = 1; i <= colCount; i++) {
                    %>
                        <td><%= rs.getString(i) %></td>
                    <%
                        }
                    %>
                    </tr>
<%
                }
%>
                </table>
<%
            }
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage() + "<br>");
        java.io.StringWriter sw = new java.io.StringWriter();
        java.io.PrintWriter pw = new java.io.PrintWriter(sw);
        e.printStackTrace(pw); // Write the stack trace to the StringWriter
        out.println("<pre>" + sw.toString() + "</pre>"); // Output the stack trace as formatted text
    } finally {
        // Close resources
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        } catch (SQLException se) {
            out.println("Error closing resources: " + se.getMessage() + "<br>");
        }
    }
%>
</body>
</html>
