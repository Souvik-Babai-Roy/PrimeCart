<%@ page import="helpers.Helper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<meta name="title" content="PrimeCart | Bestsellers">
<meta name="author" content="PrimeCart">
<meta name="description"
	content="PrimeCart is an advanced, fully responsive e-commerce admin dashboard with comprehensive features for managing sales, inventory, orders, marketing, and customer support. Built with Bootstrap and JSP for a seamless and dynamic experience.">
<meta name="keywords"
	content="e-commerce admin dashboard, PrimeCart, Bootstrap admin dashboard, sales analytics, inventory management, order processing, customer management, marketing tools, responsive dashboard, e-commerce analytics, JSP, admin panel, data visualization, customer support, inventory dashboard, order management">
<title>PrimeCart | Bestsellers</title>
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
					<div class="card">
						<div class="card-header">
							<h4>
								<strong>Bestsellers in Category 1</strong>
							</h4>
						</div>
						<div class="card-body horizontal-scroll-container ">
							<!-- Scroll Buttons (only visible on large screens) -->
							<button class="horizontal-scroll-button left"
								onclick="scrollHorizontal('category1','left')">‹</button>
							<!-- Horizontal Scroll Bar with Bootstrap Grid Classes -->
							<div class="horizontal-scroll-bar" id="category1">
								<div class="horizontal-scroll-item ">
									<div class="small-box">
										<div class="ribbon-wrapper">
											<div class="ribbon bg-danger" style="font-weight: bold;">
												1</div>
										</div>
										<div class="">
											<img src="img/logo-light.png" alt="Logo" type="image/png"
												class="w-100">
										</div>
										<div class="inner">
											<p>Portronics Power Plate 10 Extension Board with 4
												Universal Sockets, 3 Meter Long Cord, 1500 Watts, 6 Amp
												Multi Plug for Office & Home Appliances (Black)</p>
											<div class="d-flex align-items-center ">
												4.5 &nbsp; <span class="star-rating"> <span
													class="stars"> <span class="stars-filled"
														style="width: 90%;"></span> <!-- Adjust the width for percentage -->
												</span>
												</span> (3,951)
											</div>
											<span><em><strong>₹1,499</strong></em></span>
										</div>
										<a href="#" type="button"
											class="w-100 btn btn-toggle btn-outline-light">More info
											<i class="fas fa-arrow-circle-right"></i>
										</a>
									</div>
								</div>
								<div class="horizontal-scroll-item ">
									<div class="small-box">
										<div class="ribbon-wrapper">
											<div class="ribbon bg-danger" style="font-weight: bold;">
												2</div>
										</div>
										<div class="">
											<img src="img/logo-light.png" alt="Logo" type="image/png"
												class="w-100">
										</div>
										<div class="inner">
											<p>Portronics Power Plate 10 Extension Board with 4
												Universal Sockets, 3 Meter Long Cord, 1500 Watts, 6 Amp
												Multi Plug for Office & Home Appliances (Black)</p>
											<div class="d-flex align-items-center ">
												4.5 &nbsp; <span class="star-rating"> <span
													class="stars"> <span class="stars-filled"
														style="width: 90%;"></span> <!-- Adjust the width for percentage -->
												</span>
												</span> (3,951)
											</div>
											<span><em><strong>₹1,499</strong></em></span>
										</div>
										<a href="#" type="button"
											class="w-100 btn btn-toggle btn-outline-light">More info
											<i class="fas fa-arrow-circle-right"></i>
										</a>
									</div>
								</div>
								<div class="horizontal-scroll-item ">
									<div class="small-box">
										<div class="ribbon-wrapper">
											<div class="ribbon bg-danger" style="font-weight: bold;">
												3</div>
										</div>
										<div class="">
											<img src="img/logo-light.png" alt="Logo" type="image/png"
												class="w-100">
										</div>
										<div class="inner">
											<p>Portronics Power Plate 10 Extension Board with 4
												Universal Sockets, 3 Meter Long Cord, 1500 Watts, 6 Amp
												Multi Plug for Office & Home Appliances (Black)</p>
											<div class="d-flex align-items-center ">
												4.5 &nbsp; <span class="star-rating"> <span
													class="stars"> <span class="stars-filled"
														style="width: 90%;"></span> <!-- Adjust the width for percentage -->
												</span>
												</span> (3,951)
											</div>
											<span><em><strong>₹1,499</strong></em></span>
										</div>
										<a href="#" type="button"
											class="w-100 btn btn-toggle btn-outline-light">More info
											<i class="fas fa-arrow-circle-right"></i>
										</a>
									</div>
								</div>
								<div class="horizontal-scroll-item ">
									<div class="small-box">
										<div class="ribbon-wrapper">
											<div class="ribbon bg-danger" style="font-weight: bold;">
												4</div>
										</div>
										<div class="">
											<img src="img/logo-light.png" alt="Logo" type="image/png"
												class="w-100">
										</div>
										<div class="inner">
											<p>Portronics Power Plate 10 Extension Board with 4
												Universal Sockets, 3 Meter Long Cord, 1500 Watts, 6 Amp
												Multi Plug for Office & Home Appliances (Black)</p>
											<div class="d-flex align-items-center ">
												4.5 &nbsp; <span class="star-rating"> <span
													class="stars"> <span class="stars-filled"
														style="width: 90%;"></span> <!-- Adjust the width for percentage -->
												</span>
												</span> (3,951)
											</div>
											<span><em><strong>₹1,499</strong></em></span>
										</div>
										<a href="#" type="button"
											class="w-100 btn btn-toggle btn-outline-light">More info
											<i class="fas fa-arrow-circle-right"></i>
										</a>
									</div>
								</div>
								<div class="horizontal-scroll-item ">
									<div class="small-box">
										<div class="ribbon-wrapper">
											<div class="ribbon bg-danger" style="font-weight: bold;">
												5</div>
										</div>
										<div class="">
											<img src="img/logo-light.png" alt="Logo" type="image/png"
												class="w-100">
										</div>
										<div class="inner">
											<p>Portronics Power Plate 10 Extension Board with 4
												Universal Sockets, 3 Meter Long Cord, 1500 Watts, 6 Amp
												Multi Plug for Office & Home Appliances (Black)</p>
											<div class="d-flex align-items-center ">
												4.5 &nbsp; <span class="star-rating"> <span
													class="stars"> <span class="stars-filled"
														style="width: 90%;"></span> <!-- Adjust the width for percentage -->
												</span>
												</span> (3,951)
											</div>
											<span><em><strong>₹1,499</strong></em></span>
										</div>
										<a href="#" type="button"
											class="w-100 btn btn-toggle btn-outline-light">More info
											<i class="fas fa-arrow-circle-right"></i>
										</a>
									</div>
								</div>
								<div class="horizontal-scroll-item ">
									<div class="small-box">
										<div class="ribbon-wrapper">
											<div class="ribbon bg-danger" style="font-weight: bold;">
												6</div>
										</div>
										<div class="">
											<img src="img/logo-light.png" alt="Logo" type="image/png"
												class="w-100">
										</div>
										<div class="inner">
											<p>Portronics Power Plate 10 Extension Board with 4
												Universal Sockets, 3 Meter Long Cord, 1500 Watts, 6 Amp
												Multi Plug for Office & Home Appliances (Black)</p>
											<div class="d-flex align-items-center ">
												4.5 &nbsp; <span class="star-rating"> <span
													class="stars"> <span class="stars-filled"
														style="width: 90%;"></span> <!-- Adjust the width for percentage -->
												</span>
												</span> (3,951)
											</div>
											<span><em><strong>₹1,499</strong></em></span>
										</div>
										<a href="#" type="button"
											class="w-100 btn btn-toggle btn-outline-light">More info
											<i class="fas fa-arrow-circle-right"></i>
										</a>
									</div>
								</div>
								
							</div>
							<!-- Scroll Button -->
							<button class="horizontal-scroll-button right"
								onclick="scrollHorizontal('category1','right')">›</button>
						</div>
					</div>
					
					<div class="card">
						<div class="card-header">
							<h4>
								<strong>Bestsellers in Category 2</strong>
							</h4>
						</div>
						<div class="card-body horizontal-scroll-container ">
							<!-- Scroll Buttons (only visible on large screens) -->
							<button class="horizontal-scroll-button left"
								onclick="scrollHorizontal('category2','left')">‹</button>
							<!-- Horizontal Scroll Bar with Bootstrap Grid Classes -->
							<div class="horizontal-scroll-bar" id="category2">
								<div class="horizontal-scroll-item ">
									<div class="small-box">
										<div class="ribbon-wrapper">
											<div class="ribbon bg-danger" style="font-weight: bold;">
												1</div>
										</div>
										<div class="">
											<img src="img/logo-light.png" alt="Logo" type="image/png"
												class="w-100">
										</div>
										<div class="inner">
											<p>Portronics Power Plate 10 Extension Board with 4
												Universal Sockets, 3 Meter Long Cord, 1500 Watts, 6 Amp
												Multi Plug for Office & Home Appliances (Black)</p>
											<div class="d-flex align-items-center ">
												4.5 &nbsp; <span class="star-rating"> <span
													class="stars"> <span class="stars-filled"
														style="width: 90%;"></span> <!-- Adjust the width for percentage -->
												</span>
												</span> (3,951)
											</div>
											<span><em><strong>₹1,499</strong></em></span>
										</div>
										<a href="#" type="button"
											class="w-100 btn btn-toggle btn-outline-light">More info
											<i class="fas fa-arrow-circle-right"></i>
										</a>
									</div>
								</div>
								<div class="horizontal-scroll-item ">
									<div class="small-box">
										<div class="ribbon-wrapper">
											<div class="ribbon bg-danger" style="font-weight: bold;">
												2</div>
										</div>
										<div class="">
											<img src="img/logo-light.png" alt="Logo" type="image/png"
												class="w-100">
										</div>
										<div class="inner">
											<p>Portronics Power Plate 10 Extension Board with 4
												Universal Sockets, 3 Meter Long Cord, 1500 Watts, 6 Amp
												Multi Plug for Office & Home Appliances (Black)</p>
											<div class="d-flex align-items-center ">
												4.5 &nbsp; <span class="star-rating"> <span
													class="stars"> <span class="stars-filled"
														style="width: 90%;"></span> <!-- Adjust the width for percentage -->
												</span>
												</span> (3,951)
											</div>
											<span><em><strong>₹1,499</strong></em></span>
										</div>
										<a href="#" type="button"
											class="w-100 btn btn-toggle btn-outline-light">More info
											<i class="fas fa-arrow-circle-right"></i>
										</a>
									</div>
								</div>
								<div class="horizontal-scroll-item ">
									<div class="small-box">
										<div class="ribbon-wrapper">
											<div class="ribbon bg-danger" style="font-weight: bold;">
												3</div>
										</div>
										<div class="">
											<img src="img/logo-light.png" alt="Logo" type="image/png"
												class="w-100">
										</div>
										<div class="inner">
											<p>Portronics Power Plate 10 Extension Board with 4
												Universal Sockets, 3 Meter Long Cord, 1500 Watts, 6 Amp
												Multi Plug for Office & Home Appliances (Black)</p>
											<div class="d-flex align-items-center ">
												4.5 &nbsp; <span class="star-rating"> <span
													class="stars"> <span class="stars-filled"
														style="width: 90%;"></span> <!-- Adjust the width for percentage -->
												</span>
												</span> (3,951)
											</div>
											<span><em><strong>₹1,499</strong></em></span>
										</div>
										<a href="#" type="button"
											class="w-100 btn btn-toggle btn-outline-light">More info
											<i class="fas fa-arrow-circle-right"></i>
										</a>
									</div>
								</div>
								<div class="horizontal-scroll-item ">
									<div class="small-box">
										<div class="ribbon-wrapper">
											<div class="ribbon bg-danger" style="font-weight: bold;">
												4</div>
										</div>
										<div class="">
											<img src="img/logo-light.png" alt="Logo" type="image/png"
												class="w-100">
										</div>
										<div class="inner">
											<p>Portronics Power Plate 10 Extension Board with 4
												Universal Sockets, 3 Meter Long Cord, 1500 Watts, 6 Amp
												Multi Plug for Office & Home Appliances (Black)</p>
											<div class="d-flex align-items-center ">
												4.5 &nbsp; <span class="star-rating"> <span
													class="stars"> <span class="stars-filled"
														style="width: 90%;"></span> <!-- Adjust the width for percentage -->
												</span>
												</span> (3,951)
											</div>
											<span><em><strong>₹1,499</strong></em></span>
										</div>
										<a href="#" type="button"
											class="w-100 btn btn-toggle btn-outline-light">More info
											<i class="fas fa-arrow-circle-right"></i>
										</a>
									</div>
								</div>
								<div class="horizontal-scroll-item ">
									<div class="small-box">
										<div class="ribbon-wrapper">
											<div class="ribbon bg-danger" style="font-weight: bold;">
												5</div>
										</div>
										<div class="">
											<img src="img/logo-light.png" alt="Logo" type="image/png"
												class="w-100">
										</div>
										<div class="inner">
											<p>Portronics Power Plate 10 Extension Board with 4
												Universal Sockets, 3 Meter Long Cord, 1500 Watts, 6 Amp
												Multi Plug for Office & Home Appliances (Black)</p>
											<div class="d-flex align-items-center ">
												4.5 &nbsp; <span class="star-rating"> <span
													class="stars"> <span class="stars-filled"
														style="width: 90%;"></span> <!-- Adjust the width for percentage -->
												</span>
												</span> (3,951)
											</div>
											<span><em><strong>₹1,499</strong></em></span>
										</div>
										<a href="#" type="button"
											class="w-100 btn btn-toggle btn-outline-light">More info
											<i class="fas fa-arrow-circle-right"></i>
										</a>
									</div>
								</div>
								<div class="horizontal-scroll-item ">
									<div class="small-box">
										<div class="ribbon-wrapper">
											<div class="ribbon bg-danger" style="font-weight: bold;">
												6</div>
										</div>
										<div class="">
											<img src="img/logo-light.png" alt="Logo" type="image/png"
												class="w-100">
										</div>
										<div class="inner">
											<p>Portronics Power Plate 10 Extension Board with 4
												Universal Sockets, 3 Meter Long Cord, 1500 Watts, 6 Amp
												Multi Plug for Office & Home Appliances (Black)</p>
											<div class="d-flex align-items-center ">
												4.5 &nbsp; <span class="star-rating"> <span
													class="stars"> <span class="stars-filled"
														style="width: 90%;"></span> <!-- Adjust the width for percentage -->
												</span>
												</span> (3,951)
											</div>
											<span><em><strong>₹1,499</strong></em></span>
										</div>
										<a href="#" type="button"
											class="w-100 btn btn-toggle btn-outline-light">More info
											<i class="fas fa-arrow-circle-right"></i>
										</a>
									</div>
								</div>
								
							</div>
							<!-- Scroll Button -->
							<button class="horizontal-scroll-button right"
								onclick="scrollHorizontal('category2','right')">›</button>
						</div>
					</div>
					
					<div class="card">
						<div class="card-header">
							<h4>
								<strong>Bestsellers in Category 3</strong>
							</h4>
						</div>
						<div class="card-body horizontal-scroll-container ">
							<!-- Scroll Buttons (only visible on large screens) -->
							<button class="horizontal-scroll-button left"
								onclick="scrollHorizontal('category3','left')">‹</button>
							<!-- Horizontal Scroll Bar with Bootstrap Grid Classes -->
							<div class="horizontal-scroll-bar" id="category3">
								<div class="horizontal-scroll-item ">
									<div class="small-box">
										<div class="ribbon-wrapper">
											<div class="ribbon bg-danger" style="font-weight: bold;">
												1</div>
										</div>
										<div class="">
											<img src="img/logo-light.png" alt="Logo" type="image/png"
												class="w-100">
										</div>
										<div class="inner">
											<p>Portronics Power Plate 10 Extension Board with 4
												Universal Sockets, 3 Meter Long Cord, 1500 Watts, 6 Amp
												Multi Plug for Office & Home Appliances (Black)</p>
											<div class="d-flex align-items-center ">
												4.5 &nbsp; <span class="star-rating"> <span
													class="stars"> <span class="stars-filled"
														style="width: 90%;"></span> <!-- Adjust the width for percentage -->
												</span>
												</span> (3,951)
											</div>
											<span><em><strong>₹1,499</strong></em></span>
										</div>
										<a href="#" type="button"
											class="w-100 btn btn-toggle btn-outline-light">More info
											<i class="fas fa-arrow-circle-right"></i>
										</a>
									</div>
								</div>
								<div class="horizontal-scroll-item ">
									<div class="small-box">
										<div class="ribbon-wrapper">
											<div class="ribbon bg-danger" style="font-weight: bold;">
												2</div>
										</div>
										<div class="">
											<img src="img/logo-light.png" alt="Logo" type="image/png"
												class="w-100">
										</div>
										<div class="inner">
											<p>Portronics Power Plate 10 Extension Board with 4
												Universal Sockets, 3 Meter Long Cord, 1500 Watts, 6 Amp
												Multi Plug for Office & Home Appliances (Black)</p>
											<div class="d-flex align-items-center ">
												4.5 &nbsp; <span class="star-rating"> <span
													class="stars"> <span class="stars-filled"
														style="width: 90%;"></span> <!-- Adjust the width for percentage -->
												</span>
												</span> (3,951)
											</div>
											<span><em><strong>₹1,499</strong></em></span>
										</div>
										<a href="#" type="button"
											class="w-100 btn btn-toggle btn-outline-light">More info
											<i class="fas fa-arrow-circle-right"></i>
										</a>
									</div>
								</div>
								<div class="horizontal-scroll-item ">
									<div class="small-box">
										<div class="ribbon-wrapper">
											<div class="ribbon bg-danger" style="font-weight: bold;">
												3</div>
										</div>
										<div class="">
											<img src="img/logo-light.png" alt="Logo" type="image/png"
												class="w-100">
										</div>
										<div class="inner">
											<p>Portronics Power Plate 10 Extension Board with 4
												Universal Sockets, 3 Meter Long Cord, 1500 Watts, 6 Amp
												Multi Plug for Office & Home Appliances (Black)</p>
											<div class="d-flex align-items-center ">
												4.5 &nbsp; <span class="star-rating"> <span
													class="stars"> <span class="stars-filled"
														style="width: 90%;"></span> <!-- Adjust the width for percentage -->
												</span>
												</span> (3,951)
											</div>
											<span><em><strong>₹1,499</strong></em></span>
										</div>
										<a href="#" type="button"
											class="w-100 btn btn-toggle btn-outline-light">More info
											<i class="fas fa-arrow-circle-right"></i>
										</a>
									</div>
								</div>
								<div class="horizontal-scroll-item ">
									<div class="small-box">
										<div class="ribbon-wrapper">
											<div class="ribbon bg-danger" style="font-weight: bold;">
												4</div>
										</div>
										<div class="">
											<img src="img/logo-light.png" alt="Logo" type="image/png"
												class="w-100">
										</div>
										<div class="inner">
											<p>Portronics Power Plate 10 Extension Board with 4
												Universal Sockets, 3 Meter Long Cord, 1500 Watts, 6 Amp
												Multi Plug for Office & Home Appliances (Black)</p>
											<div class="d-flex align-items-center ">
												4.5 &nbsp; <span class="star-rating"> <span
													class="stars"> <span class="stars-filled"
														style="width: 90%;"></span> <!-- Adjust the width for percentage -->
												</span>
												</span> (3,951)
											</div>
											<span><em><strong>₹1,499</strong></em></span>
										</div>
										<a href="#" type="button"
											class="w-100 btn btn-toggle btn-outline-light">More info
											<i class="fas fa-arrow-circle-right"></i>
										</a>
									</div>
								</div>
								<div class="horizontal-scroll-item ">
									<div class="small-box">
										<div class="ribbon-wrapper">
											<div class="ribbon bg-danger" style="font-weight: bold;">
												5</div>
										</div>
										<div class="">
											<img src="img/logo-light.png" alt="Logo" type="image/png"
												class="w-100">
										</div>
										<div class="inner">
											<p>Portronics Power Plate 10 Extension Board with 4
												Universal Sockets, 3 Meter Long Cord, 1500 Watts, 6 Amp
												Multi Plug for Office & Home Appliances (Black)</p>
											<div class="d-flex align-items-center ">
												4.5 &nbsp; <span class="star-rating"> <span
													class="stars"> <span class="stars-filled"
														style="width: 90%;"></span> <!-- Adjust the width for percentage -->
												</span>
												</span> (3,951)
											</div>
											<span><em><strong>₹1,499</strong></em></span>
										</div>
										<a href="#" type="button"
											class="w-100 btn btn-toggle btn-outline-light">More info
											<i class="fas fa-arrow-circle-right"></i>
										</a>
									</div>
								</div>
								<div class="horizontal-scroll-item ">
									<div class="small-box">
										<div class="ribbon-wrapper">
											<div class="ribbon bg-danger" style="font-weight: bold;">
												6</div>
										</div>
										<div class="">
											<img src="img/logo-light.png" alt="Logo" type="image/png"
												class="w-100">
										</div>
										<div class="inner">
											<p>Portronics Power Plate 10 Extension Board with 4
												Universal Sockets, 3 Meter Long Cord, 1500 Watts, 6 Amp
												Multi Plug for Office & Home Appliances (Black)</p>
											<div class="d-flex align-items-center ">
												4.5 &nbsp; <span class="star-rating"> <span
													class="stars"> <span class="stars-filled"
														style="width: 90%;"></span> <!-- Adjust the width for percentage -->
												</span>
												</span> (3,951)
											</div>
											<span><em><strong>₹1,499</strong></em></span>
										</div>
										<a href="#" type="button"
											class="w-100 btn btn-toggle btn-outline-light">More info
											<i class="fas fa-arrow-circle-right"></i>
										</a>
									</div>
								</div>
								
							</div>
							<!-- Scroll Button -->
							<button class="horizontal-scroll-button right"
								onclick="scrollHorizontal('category3','right')">›</button>
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
</body>
</html>