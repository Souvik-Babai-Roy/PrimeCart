<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart Count Example</title>
</head>
<body>
    <!-- Display the cart item count -->
    <p>Items in Cart: <span id="cartCount">0</span></p>

    <!-- Script to dynamically update cart count -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Fetch the cart item count
        fetch('/PrimeCart1//DBServlet?action=fetchCartItemNo', { method: 'GET' })
            .then(response => response.json())  // Handle JSON response
            .then(data => {
                // Update the cart count with the data received
                const cartItemCount = data.cartItemCount;
                document.getElementById('cartCount').textContent = cartItemCount;
                
                // Display an alert with the cart item count
                alert("Items in your cart: " + cartItemCount);
            })
            .catch(error => {
                console.error('Error fetching cart item count:', error);
                
                // Display an alert for the error
                alert("There was an error fetching the cart item count.");
            });
    });
</script>

</body>
</html>
