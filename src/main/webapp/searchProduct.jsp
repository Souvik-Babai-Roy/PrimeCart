<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.ProductDao, beans.ProductsBean, java.util.List" %>
<%
    String query = request.getParameter("query");
    if (query != null && !query.trim().isEmpty()) {
        try {
            ProductDao productDao = new ProductDao(); // Initialize DAO
            List<ProductsBean> products = productDao.searchProductsByName(query); // Fetch products matching the query
            
            // Display results as list items
            if (products != null && !products.isEmpty()) {
                for (ProductsBean product : products) {
                    out.println("<a href='javascript:void(0);' class='list-group-item list-group-item-action suggestion-item' data-id='" 
                        + product.getProductID() + "'>" 
                        + product.getProductName() + "</a>");
                }
            } else {
                out.println("<div class='list-group-item'>No products found</div>");
            }
        } catch (Exception e) {
            out.println("<div class='list-group-item'>Error: " + e.getMessage() + "</div>");
        }
    }
%>
