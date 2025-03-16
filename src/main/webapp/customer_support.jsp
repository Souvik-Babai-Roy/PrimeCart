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
<meta name="title" content="PrimeCart | Customer Support">
<meta name="author" content="PrimeCart">
<meta name="description"
	content="PrimeCart is an advanced, fully responsive e-commerce admin dashboard with comprehensive features for managing sales, inventory, orders, marketing, and customer support. Built with Bootstrap and JSP for a seamless and dynamic experience.">
<meta name="keywords"
	content="e-commerce admin dashboard, PrimeCart, Bootstrap admin dashboard, sales analytics, inventory management, order processing, customer management, marketing tools, responsive dashboard, e-commerce analytics, JSP, admin panel, data visualization, customer support, inventory dashboard, order management">
<title>PrimeCart | Customer Support</title>
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
			<div class="content-header bg-gradient-primary">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h5 class="m-0">Welcome to PrimeCart&trade; Support</h5>
						</div>
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>


			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<br>

					<div class="card">
						<div class="card-header">
							<strong>Your satisfaction is our priority. We're here to
								help!</strong>
						</div>

						<div class="card-body">
							<div class="row text-center">
								<div class="col-md-4 mb-4">
									<div class="card support-card p-4">
										<i class="fas fa-truck-fast mb-3"></i>
										<h5>Track Your Order</h5>
										<p>Get real-time updates on your order status.</p>
										<a href="#" class="btn btn-primary btn-sm">Track Now</a>
									</div>
								</div>
								<div class="col-md-4 mb-4">
									<div class="card support-card p-4">
										<i class="fas fa-exchange-alt mb-3"></i>
										<h5>Returns & Refunds</h5>
										<p>Need help with a return or refund? Let us assist you.</p>
										<a href="#" class="btn btn-primary btn-sm">Learn More</a>
									</div>
								</div>
								<div class="col-md-4 mb-4">
									<div class="card support-card p-4">
										<i class="fas fa-phone mb-3"></i>
										<h5>Contact Us</h5>
										<p>Reach out to our support team for assistance.</p>
										<a href="#contact-form" class="btn btn-primary btn-sm">Contact
											Now</a>
									</div>
								</div>
							</div>

							<!-- FAQ Section -->
							<section class="bg-light py-2 py-4 card card-primary">
								<div class="px-4">
									<h3 class="text-center mb-4">Frequently Asked Questions</h3>
									<div class="" id="faqAccordion">
										<!-- FAQ Item 1 -->
										<h2 id="headingOne">
											<button class="btn btn-block btn-default collapsed text-left"
												type="button" data-bs-toggle="collapse"
												data-bs-target="#faq1" aria-expanded="true"
												aria-controls="faq1">
												<i class="fa-solid fa-circle-info"></i> &nbsp; How can I
												track my order?
											</button>
										</h2>
										<div id="faq1" class="collapse show pb-4"
											aria-labelledby="headingOne" data-bs-parent="#faqAccordion">
											<div class="pl-4 font-italic">You can track your order
												by visiting the "Track Your Order" page and entering your
												order ID.</div>
										</div>

										<!-- FAQ Item 2 -->
										<h2 id="headingTwo">
											<button class="btn btn-block btn-default collapsed text-left"
												type="button" data-bs-toggle="collapse"
												data-bs-target="#faq2" aria-expanded="false"
												aria-controls="faq2">
												<i class="fa-solid fa-circle-info"></i> &nbsp; What is your
												return policy?
											</button>
										</h2>
										<div id="faq2" class="collapse pb-4"
											aria-labelledby="headingTwo" data-bs-parent="#faqAccordion">
											<div class="pl-4 font-italic">We accept returns within 7 days to
												30 days of delivery based on the product. Items must be in original condition
												with all packaging.</div>
										</div>

										<!-- FAQ Item 3 -->
										<h2 id="headingThree">
											<button class="btn btn-block btn-default collapsed text-left"
												type="button" data-bs-toggle="collapse"
												data-bs-target="#faq3" aria-expanded="false"
												aria-controls="faq3">

												<i class="fa-solid fa-circle-info"></i> &nbsp; How can I
												contact support?
											</button>
										</h2>
										<div id="faq3" class="collapse" aria-labelledby="headingThree"
											data-bs-parent="#faqAccordion">
											<div class="pl-4 font-italic">You can contact us via
												the form below or call our support line at (123) 456-7890.</div>
										</div>
									</div>
								</div>
							</section>
						</div>
					</div>


					<!-- Contact Form -->
					<div class="card card-solid" id="contact-form">
					<div class="card-body mb-3">
						<h3 class="text-center mb-4">Get in Touch</h3>
						<div class="row justify-content-center">
							<div class="col-md-8">
								<form class="contact-form">
									<div class="mb-3">
										<label for="name" class="form-label">Your Name</label> <input
											type="text" class="form-control" id="name"
											placeholder="Enter your name" required>
									</div>
									<div class="mb-3">
										<label for="email" class="form-label">Your Email</label> <input
											type="email" class="form-control" id="email"
											placeholder="Enter your email" required>
									</div>
									<div class="mb-3">
										<label for="message" class="form-label">Your Message</label>
										<textarea class="form-control" id="message" rows="4"
											placeholder="Write your message here" required></textarea>
									</div>
									<button type="submit" class="btn btn-primary w-100">Submit</button>
								</form>
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
</body>
</html>