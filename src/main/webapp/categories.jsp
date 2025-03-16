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
            response.sendRedirect("categories.jsp");
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
<meta name="title" content="PrimeCart | Products">
<meta name="author" content="PrimeCart">
<meta name="description"
	content="PrimeCart is an advanced, fully responsive e-commerce admin dashboard with comprehensive features for managing sales, inventory, orders, marketing, and customer support. Built with Bootstrap and JSP for a seamless and dynamic experience.">
<meta name="keywords"
	content="e-commerce admin dashboard, PrimeCart, Bootstrap admin dashboard, sales analytics, inventory management, order processing, customer management, marketing tools, responsive dashboard, e-commerce analytics, JSP, admin panel, data visualization, customer support, inventory dashboard, order management">
<title>PrimeCart | Products</title>
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

			<%
			String categoryParam = request.getParameter("category");
			String category = null;
			if (categoryParam != null && !categoryParam.isEmpty()) {
			Statement stmt = Helper.getConnection().createStatement();
			ResultSet rs = stmt.executeQuery("SELECT CategoryName FROM Categories where CategoryID=" + Integer.parseInt(categoryParam));
			while (rs.next()) {	
				
				category = rs.getString("CategoryName");
			}
			}
			 %>
			<div class="content-header pb-0">
				<div class="container-fluid">
					<h1 class="m-0">
						Products for Category :
						<%=category %></h1>
				</div>
				<!-- /.container-fluid -->
			</div>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<br>


					<%
						
					    if (categoryParam != null && !categoryParam.isEmpty()) {
						int categoryId = Integer.parseInt(categoryParam);
						Statement stmt1 = Helper.getConnection().createStatement();
						ResultSet rs1 = stmt1.executeQuery("SELECT * FROM Products where categoryid = "+ categoryId);
						while (rs1.next()) {
						%>


					<div class="info-box mb-3">
						<span class="info-box-icon col-3 col-sm-2"> <img
							src="img/logo-light.png" alt="user-avatar"
							class="img-fluid img-thumbnail">

						</span>
						<div class="info-box-content col-9 col-sm-10">

							<a href="product.jsp?productid=<%= rs1.getInt("productid") %>"
								class="product-name"><%=rs1.getString("productName") %></a>

							<div class="d-flex align-items-center ">
								<%= rs1.getDouble("rating") %>
								&nbsp; <span class="star-rating"> <span class="stars">
										<span class="stars-filled"
										style="width: <%=(rs1.getDouble("rating")/5)*100 %>%;"></span>
										<!-- Adjust the width for percentage -->
								</span>
								</span> (<%= rs1.getInt("totalratings") %>)
							</div>

							<div
								class="row d-flex justify-content-between align-items-center">
								<div class="col-11">
									<div class="text-muted ">
										Price: <span
											class="text-bold text-sm text-gray text-decoration-line-through">₹</span><span
											class="unit-mrp text-sm text-gray text-bold text-decoration-line-through"><%= rs1.getInt("mrp") %></span>
										<span class="text-bold">₹</span><span
											class="unit-price text-bold text-lg"><%= rs1.getInt("price") %></span>
									</div>
									<p class="small">Eligible for FREE Shipping</p>
								</div>
							</div>



							<div class="row">
								<span class="col"> <a role="button"
									class="btn btn-warning"
									href="DBServlet?action=addToCart&id=<%=rs1.getInt("productid") %>
									&path=<%=request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1) + "?"+ request.getQueryString() %>">
										<i class="fas fa-shopping-cart"></i> Add to Cart
								</a>
									<button class="btn btn-success">
										<i class="fas fa-bolt"></i> Buy Now
									</button>
								</span>


							</div>

						</div>
						<!-- /.info-box-content -->
					</div>


					<%
						}
						} %>

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
         //window.history.replaceState(null, '', window.location.pathname);
         // Get the current URL query string
const urlParams = new URLSearchParams(window.location.search);

// Remove 'message' and 'messageType' parameters
urlParams.delete('message');
urlParams.delete('messageType');

// Update the URL without reloading the page
window.history.replaceState(null, '', window.location.pathname + '?' + urlParams.toString());
         
            // Use JSP to pass query parameters to JavaScript
            const message = "<%=message%>";
            const messageType = "<%=messageType%>";
         
            // Trigger Swal if a message is available
            if (message.trim() !== "") {
                Swal.fire({
                    text: message,
                    icon: messageType, // Type can be 'success', 'error', 'warning', 'info', or 'question'
                    toast: true,
                 position: 'top-end',
                 showConfirmButton: false,
                 timer: 3000
                });
            }
      </script>
</body>
</html>