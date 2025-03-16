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
                if ("userrole".equals(cookie.getName())) {
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
<meta name="title" content="PrimeCart | Orders">
<meta name="author" content="PrimeCart">
<meta name="description"
	content="PrimeCart is an advanced, fully responsive e-commerce admin dashboard with comprehensive features for managing sales, inventory, orders, marketing, and customer support. Built with Bootstrap and JSP for a seamless and dynamic experience.">
<meta name="keywords"
	content="e-commerce admin dashboard, PrimeCart, Bootstrap admin dashboard, sales analytics, inventory management, order processing, customer management, marketing tools, responsive dashboard, e-commerce analytics, JSP, admin panel, data visualization, customer support, inventory dashboard, order management">
<title>PrimeCart | Orders</title>
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
.address-modal {
	position: absolute;
	background-color: rgba(0, 0, 0, 0.7);
	color: white;
	border-radius: 5px;
	padding: 10px;
	display: none;
	z-index: 1050;
	max-width: 350px;
	transition: all 0.3s ease;
}

/* For responsiveness */
@media ( min-width : 992px) {
	.address-modal {
		max-width: 950px;
		font-size: 0.9rem;
	}
}

@media ( min-width : 577px) and (max-width: 991px) {
	.address-modal {
		max-width: 650px;
		font-size: 0.9rem;
	}
}

@media ( max-width : 576px) {
	.address-modal {
		max-width: 350px;
		font-size: 0.8rem;
	}
}

/* Dark mode support */
body.dark-mode .address-modal {
	background-color: rgba(255, 255, 255, 0.8);
	color: black;
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
				<h1 class="m-0">Your Orders</h1>
				</div>
				<!-- /.container-fluid -->
			</div>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<br>








					<!-- Order Card -->
					<div class="card shadow-sm mb-4">
						<div class="card-header">
							<div
								class="d-flex justify-content-between align-items-center flex-wrap ">

								<div>
									<strong>Order Placed:</strong> <span>27-Sept 2024</span><br>
									<strong>Order #:</strong> <span>404-7382040</span>
								</div>
								<div class="text-right mt-1">
									<span><strong>Total:</strong> ₹498888.00</span> <br>
									<button class="btn btn-warning btn-sm">
										<i class="fas fa-sync"></i> Buy it Again
									</button>
								</div>
							</div>
						</div>
						<div class="card-body">
							<!-- Delivery Info -->
							<div class="mb-3 row">
								<div class="col-md-8 col-6">
									<span class="text-success font-weight-bold">Delivered 1
										October 2024</span><br>
								</div>
								<div class="col-md-4 col-6">
									<button class="btn btn-sm btn-info float-right">
										<i class="fas fa-truck"></i> Track Shipment
									</button>
								</div>
								<small class="text-muted col">Package was handed to
									resident</small>
							</div>
							<!-- Product Info -->
							<div class="d-flex flex-wrap align-items-center">
								<div class="col-4 col-md-2 col-lg-1">
									<img src="img/logo-dark.png" alt="Product"
										class="img-thumbnail mr-3 ">
								</div>
								<div class="col">
									<h6 class="mb-1">Zebronics Zeb-Companion 107 USB Wireless
										Keyboard and Mouse Set</h6>
									<p class="text-muted mb-2">Return window closed on 8
										October 2024</p>
									<div>
										<strong>Ship To:</strong> <span
											class="text-primary ship-to-name text-reset fst-italic"
											data-id="1">Souvik Roy <small><i
												class="fa-solid fa-circle-info"></i></small></span>
										<!-- Address Tooltip Modal -->
										<div class="address-modal" data-id="1">
											<p>123 Main St, Kolkata, WB, 700084</p>
										</div>
									</div>
								</div>
							</div>
							<!-- Buttons Section -->
							<div class="d-flex flex-wrap justify-content-start mt-3">
								<div class="d-inline dropdown mr-2">
									<a href="#" class="btn btn-sm btn-toggle dropdown-toggle"
										data-bs-toggle="dropdown">Invoice</a>
									<div class="dropdown-menu">
										<a class="dropdown-item text-reset" href="#"><i
											class="fa-solid fa-file-invoice"></i> Invoice</a> <a
											class="dropdown-item text-reset" href="#"><i
											class="fa-regular fa-rectangle-list"></i> Printable Order
											Summary</a>
									</div>
								</div>
								<button class="btn btn-secondary btn-sm">
									<i class="fas fa-eye"></i> View order details
								</button>
							</div>
						</div>
						<div class="card-footer">
							<div class="d-flex flex-wrap float-right">
								<button class="btn btn-primary btn-sm">
									<i class="fas fa-star"></i> Write a Product Review
								</button>
							</div>
						</div>
					</div>



					<!-- Order Card -->
					<div class="card shadow-sm mb-4">
						<div class="card-header">
							<div
								class="d-flex justify-content-between align-items-center flex-wrap ">

								<div>
									<strong>Order Placed:</strong> <span>27-Sept 2024</span><br>
									<strong>Order #:</strong> <span>404-7382040</span>
								</div>
								<div class="text-right mt-1">
									<span><strong>Total:</strong> ₹498888.00</span> <br>
									<button class="btn btn-warning btn-sm">
										<i class="fas fa-sync"></i> Buy it Again
									</button>
								</div>
							</div>
						</div>
						<div class="card-body">
							<!-- Delivery Info -->
							<div class="mb-3 row">
								<div class="col-md-8 col-6">
									<span class="text-success font-weight-bold">Delivered 1
										October 2024</span><br>

								</div>
								<div class="col-md-4 col-6">
									<button class="btn btn-sm btn-info float-right">
										<i class="fas fa-truck"></i> Track Shipment
									</button>
								</div>
								<small class="text-muted col">Package was handed to
									resident</small>
							</div>
							<!-- Product Info -->
							<div class="d-flex flex-wrap align-items-center">
								<div class="col-4 col-md-2 col-lg-1">
									<img src="img/logo-dark.png" alt="Product"
										class="img-thumbnail mr-3 ">
								</div>
								<div class="col">
									<h6 class="mb-1">Zebronics Zeb-Companion 107 USB Wireless
										Keyboard and Mouse Set</h6>
									<p class="text-muted mb-2">Return window closed on 8
										October 2024</p>
									<div>
										<strong>Ship To:</strong> <span
											class="text-primary ship-to-name text-reset fst-italic"
											data-id="5">Aratrika Dey <small><i
												class="fa-solid fa-circle-info"></i></small></span>
										<!-- Address Tooltip Modal -->
										<div class="address-modal" data-id="5">
											<p>123 Main St, Behala, WB, 56789</p>
										</div>
									</div>
								</div>
							</div>
							<!-- Buttons Section -->
							<div class="d-flex flex-wrap justify-content-start mt-3">
								<div class="d-inline dropdown mr-2">
									<a href="#" class="btn btn-sm btn-toggle dropdown-toggle"
										data-bs-toggle="dropdown">Invoice</a>
									<div class="dropdown-menu">
										<a class="dropdown-item text-reset" href="#"><i
											class="fa-solid fa-file-invoice"></i> Invoice</a> <a
											class="dropdown-item text-reset" href="#"><i
											class="fa-regular fa-rectangle-list"></i> Printable Order
											Summary</a>
									</div>
								</div>
								<button class="btn btn-secondary btn-sm">
									<i class="fas fa-eye"></i> View order details
								</button>
							</div>
						</div>
						<div class="card-footer">
							<div class="d-flex flex-wrap float-right">
								<button class="btn btn-primary btn-sm">
									<i class="fas fa-star"></i> Write a Product Review
								</button>
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
	$(document).ready(function () {
	    // Show and hide modals dynamically for each shipToName
	    $('.ship-to-name').hover(
	        function () {
	            var id = $(this).data('id');
	            $('.address-modal[data-id="' + id + '"]').css('display', 'block');
	        },
	        function () {
	            var id = $(this).data('id');
	            $('.address-modal[data-id="' + id + '"]').css('display', 'none');
	        }
	    );

	    // Close the modal when clicking outside
	    $(document).click(function (event) {
	        if (!$(event.target).closest('.address-modal, .ship-to-name').length) {
	            $('.address-modal').css('display', 'none');
	        }
	    });
	});

    </script>
</body>
</html>