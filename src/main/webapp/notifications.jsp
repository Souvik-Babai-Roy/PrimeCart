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
<meta name="title" content="PrimeCart | Notifications">
<meta name="author" content="PrimeCart">
<meta name="description"
	content="PrimeCart is an advanced, fully responsive e-commerce admin dashboard with comprehensive features for managing sales, inventory, orders, marketing, and customer support. Built with Bootstrap and JSP for a seamless and dynamic experience.">
<meta name="keywords"
	content="e-commerce admin dashboard, PrimeCart, Bootstrap admin dashboard, sales analytics, inventory management, order processing, customer management, marketing tools, responsive dashboard, e-commerce analytics, JSP, admin panel, data visualization, customer support, inventory dashboard, order management">
<title>PrimeCart | Notifications</title>
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
	class="hold-transition <%=theme%> layout-fixed layout-navbar-fixed layout-footer-fixed ">
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
					<!-- Latest Notifications -->
					<div class="card">
						<div class="card-header">Latest Notifications</div>
						<div class="card-body">
							<div class="callout callout-info">
								<div class="d-flex justify-content-between">
									<p class="mb-1">Your order #12345 has been shipped!</p>
									<span class="text-muted small" style="min-width: 60px;">30
										min ago</span>
								</div>
								<p class="mb-0 text-muted small">Track your shipment now for
									the latest updates.</p>
							</div>
							<div class="callout callout-info">
								<div class="d-flex justify-content-between">
									<p class="mb-1">Flat 30% Off on Electronics!</p>
									<span class="text-muted small" style="min-width: 60px;">2
										hours ago</span>
								</div>
								<p class="mb-0 text-muted small">Use coupon code SAVE30.
									Hurry, limited time offer!</p>
							</div>
						</div>
					</div>
					<!-- Older Notifications -->
					<div class="card">
						<div class="card-header">Older Notifications</div>
						<div class="card-body">
							<div class="callout callout-danger">
								<div class="d-flex justify-content-between">
									<p class="mb-1">Your profile has been updated successfully.</p>
									<span class="text-muted small" style="min-width: 70px;">10-Nov
										2024</span>
								</div>
							</div>
							<div class="callout callout-danger">
								<div class="d-flex justify-content-between">
									<p class="mb-1">Thank you for your feedback!</p>
									<span class="text-muted small" style="min-width: 70px;">09-Nov
										2024</span>
								</div>
							</div>
							<div class="callout callout-danger hidden-notification d-none">
								<div class="d-flex justify-content-between">
									<p class="mb-1">Special offer: Get 50% off on your next
										purchase!</p>
									<span class="text-muted small" style="min-width: 70px;">05-Nov
										2024</span>
								</div>
							</div>
							<div class="callout callout-danger hidden-notification d-none">
								<div class="d-flex justify-content-between">
									<p class="mb-1">Your password was changed successfully.</p>
									<span class="text-muted small" style="min-width: 70px;">31-Oct
										2024</span>
								</div>
							</div>
						</div>
						<!-- View All Button -->
						<div class="card-footer text-center">
							<div class="container col-md-3 col-8">
								<button class="btn btn-default btn-block btn-sm"
									id="view-all-btn"><i class="fa-solid fa-eye"></i> &nbsp; View All Notifications</button>
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
			document.getElementById('view-all-btn').addEventListener('click', function () {
			  const hiddenNotifications = document.querySelectorAll('.hidden-notification');
			  hiddenNotifications.forEach(notification => {
			    notification.classList.remove('d-none') // Show hidden notifications
			  });
			  this.style.display = 'none'; // Hide the "View All" button
			});
		</script>
</body>
</html>