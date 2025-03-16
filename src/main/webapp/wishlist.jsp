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
<meta name="title" content="PrimeCart | Wishlist">
<meta name="author" content="PrimeCart">
<meta name="description"
	content="PrimeCart is an advanced, fully responsive e-commerce admin dashboard with comprehensive features for managing sales, inventory, orders, marketing, and customer support. Built with Bootstrap and JSP for a seamless and dynamic experience.">
<meta name="keywords"
	content="e-commerce admin dashboard, PrimeCart, Bootstrap admin dashboard, sales analytics, inventory management, order processing, customer management, marketing tools, responsive dashboard, e-commerce analytics, JSP, admin panel, data visualization, customer support, inventory dashboard, order management">
<title>PrimeCart | Wishlist</title>
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
		font-size: 0.8em;

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
					<h1 class="m-0">Your Wishlist</h1>
				</div>
				<!-- /.container-fluid -->
			</div>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<br>

					<div class="info-box mb-3">
						<span class="info-box-icon col-3 col-sm-2">
							<img src="img/logo-light.png" alt="user-avatar"
							class="img-fluid img-thumbnail">

						</span>
						<div class="info-box-content col-9 col-sm-10">

							<span class="product-name">AGARO Compressed Air Duster,
								48000RPM, 2 Speed, Copper Motor, Air Blower, Air Spray, Portable
								Black</span>

							<div class="d-flex align-items-center ">
								4.5 &nbsp; <span class="star-rating"> <span class="stars">
										<span class="stars-filled" style="width: 90%;"></span> <!-- Adjust the width for percentage -->
								</span>
								</span> (3,951)
							</div>

							<div
								class="row d-flex justify-content-between align-items-center">
								<div class="col-11">
									<div class="text-muted ">
										Price: <span
											class="text-bold text-sm text-gray text-decoration-line-through">₹</span><span
											class="unit-mrp text-sm text-gray text-bold text-decoration-line-through">3699</span>
										<span class="text-bold">₹</span><span
											class="unit-price text-bold text-lg">3164</span>
									</div>
									<p class="small">Eligible for FREE Shipping</p>
								</div>
								<span class="col-1">
									<button class="btn btn-app btn-sm bg-danger float-right">
										<i class="fas fa-trash-alt"></i>Remove
									</button>
								</span>
							</div>



							<div
								class="row">
								<span class="col">
									<button class="btn btn-warning">
										<i class="fas fa-shopping-cart"></i> Add to Cart
									</button>
									<button class="btn btn-success">
										<i class="fas fa-bolt"></i> Buy Now
									</button>
								</span>


							</div>

						</div>
						<!-- /.info-box-content -->
					</div>
					
					
										<div class="info-box mb-3">
						<span class="info-box-icon col-3 col-sm-2">
							<img src="img/logo-light.png" alt="user-avatar"
							class="img-fluid img-thumbnail">

						</span>
						<div class="info-box-content col-9 col-sm-10">

							<span class="product-name">AGARO Compressed Air Duster,
								48000RPM, 2 Speed, Copper Motor, Air Blower, Air Spray, Portable
								Black</span>

							<div class="d-flex align-items-center ">
								4.5 &nbsp; <span class="star-rating"> <span class="stars">
										<span class="stars-filled" style="width: 90%;"></span> <!-- Adjust the width for percentage -->
								</span>
								</span> (3,951)
							</div>

							<div
								class="row d-flex justify-content-between align-items-center">
								<div class="col-11">
									<div class="text-muted ">
										Price: <span
											class="text-bold text-sm text-gray text-decoration-line-through">₹</span><span
											class="unit-mrp text-sm text-gray text-bold text-decoration-line-through">3699</span>
										<span class="text-bold">₹</span><span
											class="unit-price text-bold text-lg">3164</span>
									</div>
									<p class="small">Eligible for FREE Shipping</p>
								</div>
								<span class="col-1">
									<button class="btn btn-app btn-sm bg-danger float-right">
										<i class="fas fa-trash-alt"></i>Remove
									</button>
								</span>
							</div>



							<div
								class="row">
								<span class="col">
									<button class="btn btn-warning">
										<i class="fas fa-shopping-cart"></i> Add to Cart
									</button>
									<button class="btn btn-success">
										<i class="fas fa-bolt"></i> Buy Now
									</button>
								</span>


							</div>

						</div>
						<!-- /.info-box-content -->
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
</body>
</html>