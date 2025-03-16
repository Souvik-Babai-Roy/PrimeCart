<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*, beans.*, java.util.*, helpers.*, java.sql.*"%>
<%
String theme_side = (String) session.getAttribute("theme");
boolean isDarkMode_side = "dark-mode".equals(theme_side);
%>

<!-- Preloader Section -->
<!-- Display a preloader animation while the page is loading -->
<div
	class="preloader flex-column justify-content-center align-items-center">
	<img class="animation__shake" src="img/loading.gif"
		alt="Loading Animation" height="120" width="200" />
</div>

<!-- Sidebar -->
<!-- Main Sidebar Container -->
<aside
	class="main-sidebar <%=isDarkMode_side ? "sidebar-dark-primary" : "sidebar-light-blue"%> elevation-4"
	id="sidebar">

	<%
	String homePath = (String) session.getAttribute("homePath");
	%>

	<%!// Helper function to check if the current path matches a given page
	public String isActive(String page, String currentPath) {
		return currentPath.equals(page) ? "active" : "";
	}%>

	<!-- Brand Logo -->
	<a href="<%=homePath%>" class="brand-link"> <%
 if (isDarkMode_side) {
 %> <img src="img/logo-dark.png" alt="Logo" type="image/png"
		class="brand-image img-circle elevation-3" style="opacity: .8">
		<%
		} else {
		%> <img src="img/logo-light.png" alt="Logo" type="image/png"
		class="brand-image img-circle elevation-3" style="opacity: .8">
		<%
		}
		%> <span class="brand-text font-effect-shadow-multiple text-bold ">PrimeCart
			&trade;</span>
	</a>
	<!-- Sidebar Content -->
	<div class="sidebar layout-fixed">
		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">
				<!-- User Panel -->
				<li class="nav-item user-panel mt-3 pb-3 mb-3 bg-muted "><a
					class="nav-link"> <span class="image"> <img
							src="img/user-profile-icon.png" class="img-circle elevation-2"
							alt="User Image">
					</span> &nbsp; Hello, Admin <br> <small class="">
							&emsp;Account Overview & Preferences &nbsp;<i
							class="fas fa-caret-left right"></i>
					</small>
				</a>
					<ul class="nav nav-treeview">
						<li class="list-group-item d-flex pr-0"><a href="account.jsp"
							class="text-reset w-100"><i class="fas fa-user-gear"></i>
								Your Account</a></li>
						<li class="list-group-item d-flex pr-0"><a href="orders.jsp"
							class="text-reset w-100"><i class="fa-brands fa-shopify"></i>
								Your Orders</a></li>
						<li class="list-group-item d-flex pr-0"><a href="cart.jsp"
							class="text-reset w-100"><i class="fas fa-cart-arrow-down"></i>
								Your Cart</a></li>
						<li class="list-group-item d-flex  pr-0"><a
							href="wishlist.jsp" class="text-reset w-100"><i
								class="fas fa-heart"></i> Your WishList</a></li>
						<!-- Logout Button -->
						<li class="list-group-item d-flex bg-danger" role="button"
							onclick="confirmLogout()"><a class=""> <i
								class="fas fa-power-off"></i> Logout
						</a></li>
					</ul></li>
				<!-- Dashboard Link -->
				<li class="nav-item" id="lidashboard"><a href="<%=homePath%>"
					class="nav-link <%=isActive(homePath, currentPath)%>"> <i
						class="nav-icon fas fa-tachometer-alt"></i>
						<p>Dashboard</p>
				</a></li>
				<%
				if ("Admin".equals((String) session.getAttribute("userRole"))) {
				%>
				<!-- Product Management Header -->
				<li class="nav-header"><i class="fas fa-box"></i> <b>Product
						Oversight</b></li>
				<!-- Product Management Items -->
				<li class="nav-item"><a href="product_management.jsp"
					class="nav-link <%=isActive("product_management.jsp", currentPath)%>">
						<i class="nav-icon fas fa-box-archive"></i>
						<p>Product Management</p>
				</a></li>
				<li class="nav-item"><a href="category_management.jsp"
					class="nav-link <%=isActive("category_management.jsp", currentPath)%>">
						<i class="nav-icon fas fa-tags"></i>
						<p>Category Management</p>
				</a></li>
				<li class="nav-item"><a href="inventory_management.jsp"
					class="nav-link <%=isActive("inventory_management.jsp", currentPath)%>">
						<i class="nav-icon fas fa-boxes-stacked"></i>
						<p>Inventory Management</p>
				</a></li>
				<!-- Order Management Header -->
				<li class="nav-header"><i class="fas fa-shopping-cart"></i> <b>Order
						Oversight</b></li>
				<!-- Order Management Items -->
				<li class="nav-item"><a href="order_management.jsp"
					class="nav-link <%=isActive("order_management.jsp", currentPath)%>">
						<i class="nav-icon fas fa-receipt"></i>
						<p>Order Management</p>
				</a></li>
				<li class="nav-item"><a href="reviews_feedback.jsp"
					class="nav-link <%=isActive("reviews_feedback.jsp", currentPath)%>">
						<i class="nav-icon fas fa-star-half-stroke"></i>
						<p>Reviews & Feedback</p>
				</a></li>
				<!-- Reports & Analytics Header -->
				<li class="nav-header"><i class="fas fa-chart-line"></i> <b>Reports
						& Analytics</b></li>
				<!-- Reports & Analytics Items -->
				<li class="nav-item"><a href="reports.jsp"
					class="nav-link <%=isActive("reports.jsp", currentPath)%>"> <i
						class="nav-icon fas fa-file-alt"></i>
						<p>Reports</p>
				</a></li>
				<!-- Notifications & Settings Header -->
				<li class="nav-header"><i class="fas fa-bell"></i> <b>Notifications
						& Settings</b></li>
				<!-- Notifications & Settings Items -->
				<li class="nav-item"><a href="push_center.jsp"
					class="nav-link <%=isActive("push_center.jsp", currentPath)%>">
						<i class="nav-icon fas fa-lightbulb"></i>
						<p>Push Center</p>
				</a></li>
				<li class="nav-item"><a href="settings.jsp"
					class="nav-link <%=isActive("settings.jsp", currentPath)%>"> <i
						class="nav-icon fas fa-cogs"></i>
						<p>Site Settings</p>
				</a></li>
				<%
				} else {
				%>
				<!-- Product Discovery Section -->
				<li class="nav-header"><i class="fa-brands fa-searchengin"></i>
					<b>Product Discovery</b></li>
				<!-- Best Sellers -->
				<li class="nav-item"><a href="bestsellers.jsp"
					class="nav-link <%=isActive("bestsellers.jsp", currentPath)%>">
						<i class="nav-icon fas fa-thumbs-up"></i>
						<p>Best Sellers</p>
				</a></li>
				<!-- Your Recommendations -->
				<li class="nav-item"><a href="recommendations.jsp"
					class="nav-link <%=isActive("recommendations.jsp", currentPath)%>">
						<i class="nav-icon fas fa-star"></i>
						<p>Your Recommendations</p>
				</a></li>
				<!-- Shop by Category -->
				<li class="nav-item"><a class="nav-link <%=isActive("categories.jsp", currentPath)%>"> <i
						class="nav-icon fas fa-table-list"></i>
						<p>
							Shop by Category <i class="fas fa-circle-chevron-left right"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<!-- Always visible categories -->




						<%
			Statement stmt = Helper.getConnection().createStatement();
			ResultSet rs = stmt.executeQuery("SELECT CategoryID,CategoryName FROM Categories order by CategoryName fetch first 3 rows only");
			while (rs.next()) {			 
			 %>
						<li class="nav-item"><a href="categories.jsp?category=<%= rs.getInt("CategoryID") %>"
   class="nav-link nav-indent <%= isActive(("categories.jsp?category=" + rs.getInt("CategoryID")), (currentPath + "?"+ request.getQueryString())) %>">
								<p><%=rs.getString("CategoryName")%></p>
						</a></li>

						<%} %>

						<%
			Statement stmt1 = Helper.getConnection().createStatement();
			ResultSet rs1 = stmt1.executeQuery("SELECT CategoryID, CategoryName FROM Categories WHERE CategoryID NOT IN " +
					"(SELECT CategoryID FROM (SELECT CategoryID FROM Categories ORDER BY CategoryName) WHERE ROWNUM <= 3) " +
					" ORDER BY CategoryName");
			while (rs1.next()) {			 
			 %>
						<li class="nav-item extra-category" style="display: none;"><a href="categories.jsp?category=<%= rs1.getInt("CategoryID") %>"
   class="nav-link nav-indent <%= isActive(("categories.jsp?category=" + rs1.getInt("CategoryID")), (currentPath + "?"+ request.getQueryString())) %>">
								<p><%=rs1.getString("CategoryName")%></p>
						</a></li>

						<%} %>



						<!-- Show More / Show Less button -->
						<em>
							<li class="nav-item"><a href="javascript:void(0);"
								class="nav-link nav-indent" onclick="toggleCategories()">
									<p id="toggleText">Show All</p>
							</a></li>
						</em>
					</ul></li>
				<!-- Coupons, and Notifications Section-->
				<li class="nav-header"><i class="fas fa-bullhorn"></i> <b>Deals
						& Announcements</b></li>
				<!-- Coupons -->
				<li class="nav-item"><a href="coupons.jsp"
					class="nav-link <%=isActive("coupons.jsp", currentPath)%>"> <i
						class="nav-icon fas fa-ticket"></i>
						<p>Coupons</p>
				</a></li>
				<!-- Notifications -->
				<li class="nav-item"><a href="notifications.jsp"
					class="nav-link <%=isActive("notifications.jsp", currentPath)%>">
						<i class="nav-icon fas fa-bell"></i>
						<p>Notifications</p>
				</a></li>
				<!-- Assistance Center Header -->
				<li class="nav-header"><i class="fas fa-life-ring"></i> <b>Assistance
						Center</b></li>
				<!-- Customer Support -->
				<li class="nav-item"><a href="customer_support.jsp"
					class="nav-link <%=isActive("customer_support.jsp", currentPath)%>">
						<i class="nav-icon fas fa-headset"></i>
						<p>Customer Support</p>
				</a></li>
				<%
				}
				%>
			</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>
<!-- /.main-sidebar -->