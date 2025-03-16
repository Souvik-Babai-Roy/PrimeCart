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
		<meta name="title" content="PrimeCart | Coupons">
		<meta name="author" content="PrimeCart">
		<meta name="description"
			content="PrimeCart is an advanced, fully responsive e-commerce admin dashboard with comprehensive features for managing sales, inventory, orders, marketing, and customer support. Built with Bootstrap and JSP for a seamless and dynamic experience.">
		<meta name="keywords"
			content="e-commerce admin dashboard, PrimeCart, Bootstrap admin dashboard, sales analytics, inventory management, order processing, customer management, marketing tools, responsive dashboard, e-commerce analytics, JSP, admin panel, data visualization, customer support, inventory dashboard, order management">
		<title>PrimeCart | Coupons</title>
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
				<!-- Main content -->
				<section class="content">
					<div class="container-fluid">
						<br>
						<!-- Active Coupons Card -->
						<div class="card card-solid">
							<div class="card-header text-lg">Active Coupons</div>
							<div class="card-body">
								<div class="row g-3">
									<!-- Active Coupon Card -->
									<div class="col-md-6 col-lg-4">
										<div class="card card-outline card-success">
											<div class="card-header text-bold text-success">Flat ₹100 Off</div>
											<div class="card-body text-center">
												<p class="card-text">
													Apply code <span class="font-italic coupon-code">FLAT100</span>
													for orders above ₹500.
												</p>
												<button class="btn btn-success btn-sm copy-code-btn"
													data-code="FLAT100">Copy Code</button>
											</div>
											<div class="card-footer text-muted text-center">Valid
												till: 25 Nov 2024
											</div>
										</div>
									</div>
									<!-- Add more active coupons as needed -->
									<div class="col-md-6 col-lg-4">
										<div class="card card-outline card-success">
											<div class="card-header text-bold text-success">Flat ₹250 Off</div>
											<div class="card-body text-center">
												<p class="card-text">
													Apply code <span class="font-italic coupon-code">FLAT250</span>
													for orders above ₹1250.
												</p>
												<button class="btn btn-success btn-sm copy-code-btn"
													data-code="FLAT250">Copy Code</button>
											</div>
											<div class="card-footer text-muted text-center">Valid
												till: 25 Nov 2024
											</div>
										</div>
									</div>
									<div class="col-md-6 col-lg-4">
										<div class="card card-outline card-success">
											<div class="card-header text-bold text-success">Extra 10% Off on Electronics</div>
											<div class="card-body text-center">
												<p class="card-text">
													Apply code <span class="font-italic coupon-code">Extra10</span>
													for orders only on electronics category.
												</p>
												<button class="btn btn-success btn-sm copy-code-btn"
													data-code="Extra10">Copy Code</button>
											</div>
											<div class="card-footer text-muted text-center">Valid
												till:  Nov 2024
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Upcoming Coupons Section -->
						<div class="card card-solid">
							<div class="card-header text-lg">Upcoming Coupons</div>
							<div class="card-body">
								<div class="row g-3">
									<!-- Upcoming Coupon Card -->
									<div class="col-md-6 col-lg-4">
										<div class="card card-outline card-warning">
											<div class="card-header text-bold text-warning">Get 10% Cashback</div>
											<div class="card-body text-center">
												<p class="card-text">
													Use code <span class="font-italic coupon-code">CASHBACK10</span>
													(Available soon).
												</p>
												<button class="btn btn-warning btn-sm" disabled>Coming
												Soon</button>
											</div>
											<div class="card-footer text-muted text-center">Starts
												on: 01 Dec 2024
											</div>
										</div>
									</div>
									<!-- Add more upcoming coupons as needed -->
								</div>
							</div>
						</div>
						<!-- Expired Coupons Section -->
						<div class="card card-solid">
							<div class="card-header text-lg">Expired Coupons</div>
							<div class="card-body">
								<div class="row g-3">
									<!-- Upcoming Coupon Card -->
									<div class="col-md-6 col-lg-4">
										<div class="card card-outline card-danger">
											<div class="card-header text-bold text-danger">Get 10% Cashback</div>
											<div class="card-body text-center">
												<p class="card-text">
													Code <span class="font-italic">FREESHIP</span> expired.
												</p>
											</div>
											<div class="card-footer text-center text-danger">
												Expired on: 15 Nov 2024
											</div>
										</div>
									</div>
									<!-- Add more upcoming coupons as needed -->
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
			// JavaScript to Copy Coupon Code
			document.querySelectorAll('.copy-code-btn').forEach(button => {
			  button.addEventListener('click', () => {
			    const code = button.getAttribute('data-code');
			
			    navigator.clipboard.writeText(code).then(() => {
			      // Use Swal for toast notification
			      Swal.fire({
			        icon: 'success',
			        toast: true,
			        position: 'top-end',
			        showConfirmButton: false,
			        timer: 3000,
			        title: `Coupon code copied to clipboard!` // Corrected template literal
			      });
			    }).catch(err => {
			      console.error('Error copying text: ', err);
			    });
			  });
			});
		</script>
	</body>
</html>