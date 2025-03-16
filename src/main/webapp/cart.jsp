<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    // Check if a session already exists (JSP provides a session object by default)
    Cookie[] cookies = request.getCookies();
    String rememberedUser = null;
    String rememberRole = null;

    if (session == null || session.getAttribute("username") == null) {
        // No active session, check for "username" cookie
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("username".equals(cookie.getName())) {
                    rememberedUser = cookie.getValue();
                }
                if ("userRole".equals(cookie.getName())) {
                	rememberRole = cookie.getValue();
                }
            }
        }

        // If "username" cookie is found, create a new session and set attributes
        if (rememberedUser != null && !rememberedUser.isEmpty()) {
            session = request.getSession(true);  // Recreate session
            session.setAttribute("username", rememberedUser);
            session.setAttribute("userRole", rememberRole);
            response.sendRedirect("dashboard.jsp");
        } else {
            // Redirect to login if no session or valid "username" cookie is found
            response.sendRedirect("login.html");
            return;
        }
    }

    // Retrieve theme from the session
    String theme = (String) session.getAttribute("theme");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Primary Meta Tags -->
<meta name="title" content="PrimeCart | Cart">
<meta name="author" content="PrimeCart">
<meta name="description"
	content="PrimeCart is an advanced, fully responsive e-commerce admin dashboard with comprehensive features for managing sales, inventory, orders, marketing, and customer support. Built with Bootstrap and JSP for a seamless and dynamic experience.">
<meta name="keywords"
	content="e-commerce admin dashboard, PrimeCart, Bootstrap admin dashboard, sales analytics, inventory management, order processing, customer management, marketing tools, responsive dashboard, e-commerce analytics, JSP, admin panel, data visualization, customer support, inventory dashboard, order management">
<title>PrimeCart | Cart</title>
<!-- <link rel="icon" href="img/title_icon.png" type="image/png" /> -->
<link rel="apple-touch-icon" sizes="57x57"
	href="img/favicon/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60"
	href="img/favicon/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="img/favicon/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="img/favicon/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="img/favicon/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="img/favicon/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="img/favicon/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="img/favicon/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="img/favicon/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"
	href="img/favicon/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="img/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="img/favicon/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="img/favicon/favicon-16x16.png">
<link rel="manifest" href="img/favicon/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage"
	content="img/favicon/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
<%@include file="/components/css-imports.jsp"%>


<style>
.card:hover {
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}
/* Quantity Section */
.quantity-container {
	display: flex;
	align-items: center;
	justify-content: center;
}

.btn-minus, .btn-plus {
	cursor: pointer;
	border: 1px solid #ccc;
	width: 32px;
	height: 32px;
	border-radius: 50%;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	background: #fff;
	font-size: 18px;
}

.btn-minus:hover, .btn-plus:hover {
	background: #ddd;
}

.quantity-input {
	width: 50px;
	text-align: center;
	border: none;
	outline: none;
	background: #f9f9f9;
	pointer-events: none; /* Disable manual editing */
	font-size: 16px;
	font-weight: bold;
}

/* Cart Summary */
.cart-summary {
	position: sticky;
	top: 60px;
	border-radius: 10px;
}

/* Mobile Styling */
@media ( max-width : 576px) {
	.cart-summary {
		position: relative;
		top: 0;
	}
	/* 	.product-name { */
	/* 		font-size: 0.8em; */
	/* 		line-height: 0.8; */
	/* 		word-wrap: break-word; */
	/* 	} */
}

/* Common styling for all screen sizes */
.product-name {
	display: -webkit-box; /* Required for line-clamping */
	-webkit-box-orient: vertical; /* Ensures text is stacked vertically */
	overflow: hidden; /* Hide the overflowing content */
	text-overflow: ellipsis; /* Add ellipsis (...) */
}

/* For large screens, limit to 2 lines */
@media ( min-width : 992px) {
	.product-name {
		-webkit-line-clamp: 2; /* Clamp to 2 lines */
	}
}

/* For medium screens (tablets), limit to 3 lines */
@media ( min-width : 768px) and (max-width: 991px) {
	.product-name {
		-webkit-line-clamp: 3; /* Clamp to 3 lines */
	}
}

/* For small screens (mobiles), limit to 3 lines */
@media ( max-width : 767px) {
	.product-name {
		-webkit-line-clamp: 3; /* Clamp to 3 lines */
	}
}
</style>


</head>
<body
	class="hold-transition <%=theme%> layout-fixed layout-navbar-fixed layout-footer-fixed">
	<div class="wrapper">
		<!-- Navbar -->
		<!-- Navbar Menu Items -->
		<span id="navbar-reload"> <%@include
				file="/components/navbar.jsp"%>
		</span>
		<!-- Automatically forward to DBServlet upon loading -->
		<jsp:include page="/DBServlet" />
		<!-- Sidebar -->
		<!-- Main Sidebar Container -->
		<%@include file="/components/sidebar.jsp"%>
		<!-- Content Wrapper. Contains page content -->


		<div class="content-wrapper">

			<div class="content-header pb-0">
				<div class="container-fluid">
					<h1 class="m-0">Your Cart</h1>
				</div>
				<!-- /.container-fluid -->
			</div>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<br>









					<div class="row">
						<!-- Cart Items Section -->
						<div class="col-lg-8">
						
						


							<div class="text-center mb-4">
								<% if (isDarkMode_side) { %>
								<img src="img/empty-cart-light.png" alt="Empty Cart"
									class="img-fluid">
								<% } else { %>
								<img src="img/empty-cart-dark.png" alt="Empty Cart"
									class="img-fluid">
								<%} %>
								<div class=" mb-4 text-bold"
									style="font-family: lato; font-size: 1.2em;">NO ITEMS IN
									CART</div>
								<a href="bestsellers.jsp" class="btn btn-primary col-6 col-md-4" role="button">
									<i class="fa-solid fa-basket-shopping"></i> Continue Shopping
								</a>
							</div>



							<!-- Cart Item -->
							<div class="card d-flex flex-fill">
								<div class="card-header text-muted border-bottom-0"></div>
								<div class="card-body pt-0">
									<div class="row">
										<div class="col-4 col-md-2 text-center">
											<img src="img/logo-light.png" alt="user-avatar"
												class="img-fluid img-thumbnail">

											<div class="quantity-container mt-2">
												<button class="btn-minus">-</button>
												<input type="number"
													class="form-control quantity-input number-no-arrow"
													value="1" min="1">
												<button class="btn-plus">+</button>
											</div>
										</div>

										<div class="col-8 col-md-10">
											<span class="product-name">AGARO Compressed Air
												Duster, 48000RPM, 2 Speed, Copper Motor, Air Blower, Air
												Spray, Portable Black</span>
											<p class="text-muted ">
												Price: <span
													class="text-bold text-sm text-gray text-decoration-line-through">₹</span><span
													class="unit-mrp text-sm text-gray text-bold text-decoration-line-through">3699</span>
												<span class="text-bold">₹</span><span
													class="unit-price text-bold text-lg">3164</span>
											</p>
											<ul class="ml-2 mb-0 fa-ul text-muted">
												<li class="text-success">In stock</li>
												<li class="small">Eligible for FREE Shipping</li>
											</ul>
										</div>

									</div>
								</div>
								<div class="card-footer">
									<div class="row">
										<div class="col-5">
											<a class="text-danger text-reset" role="button"> <i
												class="fas fa-trash-alt"></i> Remove
											</a>
										</div>
										<div class="col-7 text-right">
											<strong>Total: <span
												class="text-decoration-line-through text-sm">₹</span><span
												class="total-mrp text-decoration-line-through text-sm"></span></strong>
											<strong>₹<span class="total-price"></span></strong>
										</div>
									</div>
								</div>
							</div>

							<!-- Cart Item -->
							<div class="card d-flex flex-fill">
								<div class="card-header text-muted border-bottom-0"></div>
								<div class="card-body pt-0">
									<div class="row">
										<div class="col-4 col-md-2 text-center">
											<img src="img/logo-light.png" alt="user-avatar"
												class="img-fluid img-thumbnail">

											<div class="quantity-container mt-2">
												<button class="btn-minus">-</button>
												<input type="number"
													class="form-control quantity-input number-no-arrow"
													value="1" min="1">
												<button class="btn-plus">+</button>
											</div>
										</div>

										<div class="col-8 col-md-10">
											<span class="product-name">SAMSUNG EVO Plus 256GB
												Micro w/SD Adaptor SDXC, Up-to 160MB/s, Expanded Storage for
												Gaming Devices, Android Tablets and Smart Phones</span>
											<p class="text-muted ">
												Price: <span
													class="text-bold text-sm text-gray text-decoration-line-through">₹</span><span
													class="unit-mrp text-sm text-gray text-bold text-decoration-line-through">4399</span>
												<span class="text-bold">₹</span><span
													class="unit-price text-bold text-lg">1849</span>
											</p>
											<ul class="ml-2 mb-0 fa-ul text-muted">
												<li class="text-success">In stock</li>
												<li class="small">Eligible for FREE Shipping</li>
											</ul>
										</div>

									</div>
								</div>
								<div class="card-footer">
									<div class="row">
										<div class="col-5">
											<a class="text-danger text-reset" role="button"> <i
												class="fas fa-trash-alt"></i> Remove
											</a>
										</div>
										<div class="col-7 text-right">
											<strong>Total: <span
												class="text-decoration-line-through text-sm">₹</span><span
												class="total-mrp text-decoration-line-through text-sm"></span></strong>
											<strong> ₹<span class="total-price">1849</span></strong>
										</div>
									</div>
								</div>
							</div>


							<!-- Cart Item -->
							<div class="card d-flex flex-fill">
								<div class="card-header text-muted border-bottom-0"></div>
								<div class="card-body pt-0">
									<div class="row">
										<div class="col-4 col-md-2 text-center">
											<img src="img/logo-light.png" alt="user-avatar"
												class="img-fluid img-thumbnail">

											<div class="quantity-container mt-2">
												<button class="btn-minus">-</button>
												<input type="number"
													class="form-control quantity-input number-no-arrow"
													value="1" min="1">
												<button class="btn-plus">+</button>
											</div>
										</div>

										<div class="col-8 col-md-10">
											<span class="product-name">SAMSUNG EVO Plus 256GB
												Micro w/SD Adaptor SDXC, Up-to 160MB/s, Expanded Storage for
												Gaming Devices, Android Tablets and Smart Phones</span>
											<p class="text-muted ">
												Price: <span
													class="text-bold text-sm text-gray text-decoration-line-through">₹</span><span
													class="unit-mrp text-sm text-gray text-bold text-decoration-line-through">4399</span>
												<span class="text-bold">₹</span><span
													class="unit-price text-bold text-lg">1849</span>
											</p>
											<ul class="ml-2 mb-0 fa-ul text-muted">
												<li class="text-success">In stock</li>
												<li class="small">Eligible for FREE Shipping</li>
											</ul>
										</div>

									</div>
								</div>
								<div class="card-footer">
									<div class="row">
										<div class="col-5">
											<a class="text-danger text-reset" role="button"> <i
												class="fas fa-trash-alt"></i> Remove
											</a>
										</div>
										<div class="col-7 text-right">
											<strong>Total: <span
												class="text-decoration-line-through text-sm">₹</span><span
												class="total-mrp text-decoration-line-through text-sm"></span></strong>
											<strong> ₹<span class="total-price"></span></strong>
										</div>
									</div>
								</div>
							</div>







						</div>

						<!-- Cart Summary Section -->
						<div class="col-lg-4">
							<div class="card cart-summary">
								<div class="card-header">
									<h5 class="">Price Details</h5>
								</div>
								<div class="card-body pb-0 mb-0">
									<div class="d-flex justify-content-between">
										<p>Total MRP</p>
										<p>
											₹<span id="total-cart-mrp"></span>
										</p>
									</div>
									<div class="d-flex justify-content-between">
										<p>Discount</p>
										<p class="text-success">
											- ₹<span id="total-discount">862</span>
										</p>
									</div>
									<div class="d-flex justify-content-between">
										<p>Delivery Charges</p>
										<p class="text-success">Free</p>
									</div>

								</div>
								<hr>
								<div class="card-footer mt-0">
									<div class="row">
										<div class="col-6 col-md-12">
											<div class="d-flex justify-content-between font-weight-bold">
												<p>Total Amount</p>
												<p>
													₹<span id="total-amount"></span>
												</p>
											</div>
										</div>
										<div class="col-6 col-md-12">
											<a href="" class="btn btn-warning btn-block btn-sm"
												role="button"> <i class="fas fa-credit-card"></i>
												Proceed to Buy
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>














				</div>
				<!--/. container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<!-- Overlay Theme Toggle Button -->
		<div class="theme-toggle-container">
			<a id="themeToggle" role="button" onclick="reloadNavbar()"> <i
				class="fa-solid fa-cloud-moon" id="toggleIcon"></i>
			</a>
		</div>
		<!-- Footer -->
		<%@include file="/components/footer.jsp"%>
		<!-- /Footer -->
	</div>
	<!-- ./wrapper -->
	<%@include file="/components/js-imports.jsp"%>


	<script>
    document.addEventListener("DOMContentLoaded", () => {
        // Add event listeners for quantity changes and item removal
        document.querySelectorAll(".btn-minus, .btn-plus").forEach(button => {
            button.addEventListener("click", handleQuantityChange);
        });

        // Add event listeners for removing items
        document.querySelectorAll(".text-danger").forEach(removeButton => {
            removeButton.addEventListener("click", handleRemoveItem);
        });

        // Initial total calculation
        calculateTotalAmount();
    });

    // Function to calculate the total amount
    function calculateTotalAmount() {
    	let totalMRPAmount = 0;
    	let totalAmount = 0;

        // Loop through each cart item to calculate individual and total prices
        document.querySelectorAll(".card").forEach(card => {
            const quantityInput = card.querySelector(".quantity-input");
            const unitMRPElement = card.querySelector(".unit-mrp");
            const unitPriceElement = card.querySelector(".unit-price");
            const totalMRPElement = card.querySelector(".total-mrp");
            const totalPriceElement = card.querySelector(".total-price");

            if (quantityInput && totalMRPElement && unitPriceElement && totalPriceElement) {
                const quantity = parseInt(quantityInput.value, 10);
                const unitMRP = parseFloat(unitMRPElement.textContent);
                const unitPrice = parseFloat(unitPriceElement.textContent);

                // Calculate and display the individual item's total price
                const mrpTotal = quantity * unitMRP;
                const itemTotal = quantity * unitPrice;
                totalMRPElement.textContent =  Math.round(mrpTotal.toFixed(2));
                totalPriceElement.textContent =  Math.round(itemTotal.toFixed(2));

                // Add to the overall total amount
                totalMRPAmount += mrpTotal;
                totalAmount += itemTotal;
            }
        });

        // Calculate discount and update the cart summary totals
        const totalMRPElement = document.getElementById("total-cart-mrp");
        const totalDiscountElement = document.getElementById("total-discount");
        const totalAmountElement = document.getElementById("total-amount");

        if (totalMRPElement && totalDiscountElement && totalAmountElement) {
            // Update the MRP (Total without discount)
            totalMRPElement.textContent =  Math.round(totalMRPAmount.toFixed(2));
            totalAmountElement.textContent =  Math.round(totalAmount.toFixed(2));

            let discount = totalMRPAmount - totalAmount;

            totalDiscountElement.textContent = Math.round(discount);
        }
    }

    // Function to handle quantity change (via + or - buttons)
    function handleQuantityChange(event) {
        const button = event.target;
        const quantityContainer = button.closest(".quantity-container");
        const quantityInput = quantityContainer.querySelector(".quantity-input");

        if (quantityInput) {
            let quantity = parseInt(quantityInput.value, 10);

            // Adjust the quantity based on the button clicked
            if (button.classList.contains("btn-minus") && quantity > 1) {
                quantity--;
            } else if (button.classList.contains("btn-plus")) {
                quantity++;
            }

            // Update the quantity input value
            quantityInput.value = quantity;

            // Recalculate totals
            calculateTotalAmount();
        }
    }

    // Function to handle removing an item from the cart
    function handleRemoveItem(event) {
        const button = event.target;
        const card = button.closest(".card");

        if (card) {
            // Remove the card from the DOM
            Swal.fire({
  title: "Do you want remove the cart item?",
  showCancelButton: true,
  confirmButtonText: "Confirm",
}).then((result) => {
  /* Read more about isConfirmed, isDenied below */
  if (result.isConfirmed) {
	  card.remove();
	// Recalculate totals after removal
      calculateTotalAmount();
	  Swal.fire({
	        icon: 'success',
	        toast: true,
	        position: 'top-end',
	        showConfirmButton: false,
	        timer: 3000,
	        title: `Cart item removed sucessfully!`
	      });
  }
});
//             card.remove();

//             // Recalculate totals after removal
//             calculateTotalAmount();
        }
    }
</script>



</body>
</html>