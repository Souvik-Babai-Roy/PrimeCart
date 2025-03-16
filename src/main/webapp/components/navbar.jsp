<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%
    String theme_nav = (String) session.getAttribute("theme");
    boolean isDarkMode_nav = "dark-mode".equals(theme_nav);
    Integer cartItemNo = (Integer) request.getAttribute("cartItemNo"); // Get cart item count from the request attribute
%>

<%
// Read query parameters from the URL
String message = request.getParameter("message");
String messageType = request.getParameter("messageType");

// Set defaults if parameters are missing
if (message == null) {
    message = "";
}
if (messageType == null) {
    messageType = "info"; // Default type for SweetAlert
}
%>

<!-- Navbar Section -->
<nav
	class="main-header navbar navbar-expand <%= isDarkMode_nav ? "navbar-dark" : "navbar-light" %>"
	id="navbar">
	<!-- Left Navbar Links -->
	<ul class="navbar-nav">
		<!-- Button to toggle the sidebar -->
		<li class="nav-item"><a class="nav-link text-lg"
			data-widget="pushmenu" href="#" role="button"> <i
				class="fas fa-bars"></i>
		</a></li>
		<% 
            // Get the userType from the session
            String userType = (String) session.getAttribute("userRole");

            // Get the current page name
            String currentPath = request.getRequestURI();
            currentPath = currentPath.substring(currentPath.lastIndexOf("/") + 1);

            // Determine home path based on user type
            String homePath1 = userType.equals("Admin") ? "dashboard.jsp" : "home.jsp";
            session.setAttribute("homePath", homePath1);
        %>
		<li class="nav-item d-none d-sm-inline-block"><a
			href="<%= homePath1 %>" class="nav-link">Home</a></li>
	</ul>

	<!-- Right Navbar Links -->
	<ul class="navbar-nav ml-auto">
		<!-- Search Icon and Search Bar Toggle -->
		<li class="nav-item"><a class="nav-link"
			data-widget="navbar-search" href="#" role="button"> <i
				class="fas fa-search"></i>
		</a>
			<div class="navbar-search-block">
				<form class="form-inline">
					<div class="input-group input-group-sm">
						<input class="form-control form-control-navbar" type="search"
							placeholder="Search" aria-label="Search">
						<div class="input-group-append">
							<button class="btn btn-navbar" type="submit">
								<i class="fas fa-search"></i>
							</button>
							<button class="btn btn-navbar" type="button"
								data-widget="navbar-search">
								<i class="fas fa-times"></i>
							</button>
						</div>
					</div>
				</form>
			</div></li>

		<!-- Messages Dropdown Menu -->
		<li class="nav-item dropdown"><a class="nav-link"
			data-bs-toggle="dropdown" href="#"> <i class="far fa-comments"></i>
				<span class="badge badge-danger navbar-badge">3</span>
		</a>
			<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
				<a href="#" class="dropdown-item"> <!-- Message Start -->
					<div class="media">
						<img src="dist/img/user1-128x128.jpg" alt="User Avatar"
							class="img-size-50 mr-3 img-circle">
						<div class="media-body">
							<h3 class="dropdown-item-title">
								Brad Diesel <span class="float-right text-sm text-danger"><i
									class="fas fa-star"></i></span>
							</h3>
							<p class="text-sm">Call me whenever you can...</p>
							<p class="text-sm text-muted">
								<i class="far fa-clock mr-1"></i> 4 Hours Ago
							</p>
						</div>
					</div> <!-- Message End -->
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item"> <!-- Message Start -->
					<div class="media">
						<img src="dist/img/user8-128x128.jpg" alt="User Avatar"
							class="img-size-50 img-circle mr-3">
						<div class="media-body">
							<h3 class="dropdown-item-title">
								John Pierce <span class="float-right text-sm text-muted"><i
									class="fas fa-star"></i></span>
							</h3>
							<p class="text-sm">I got your message bro</p>
							<p class="text-sm text-muted">
								<i class="far fa-clock mr-1"></i> 4 Hours Ago
							</p>
						</div>
					</div> <!-- Message End -->
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item"> <!-- Message Start -->
					<div class="media">
						<img src="dist/img/user3-128x128.jpg" alt="User Avatar"
							class="img-size-50 img-circle mr-3">
						<div class="media-body">
							<h3 class="dropdown-item-title">
								Nora Silvester <span class="float-right text-sm text-warning"><i
									class="fas fa-star"></i></span>
							</h3>
							<p class="text-sm">The subject goes here</p>
							<p class="text-sm text-muted">
								<i class="far fa-clock mr-1"></i> 4 Hours Ago
							</p>
						</div>
					</div> <!-- Message End -->
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item dropdown-footer">See All
					Messages</a>
			</div></li>

		<!-- Notifications Dropdown Menu -->
		<li class="nav-item dropdown"><a class="nav-link"
			data-bs-toggle="dropdown" href="#"> <i class="far fa-bell"></i> <span
				class="badge badge-warning navbar-badge">15</span>
		</a>
			<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
				<span class="dropdown-item dropdown-header">15 Notifications</span>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item"> <i
					class="fas fa-envelope mr-2"></i> 4 new messages <span
					class="float-right text-muted text-sm">3 mins</span>
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item"> <i class="fas fa-users mr-2"></i>
					8 friend requests <span class="float-right text-muted text-sm">12
						hours</span>
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item"> <i class="fas fa-file mr-2"></i>
					3 new reports <span class="float-right text-muted text-sm">2
						days</span>
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item dropdown-footer">See All
					Notifications</a>
			</div></li>

		<!-- Cart Icon with Badge -->
		<li class="nav-item"><a class="nav-link" href="cart.jsp"> <i
				class="fa-solid fa-cart-shopping"></i> Cart&nbsp; <!-- Badge showing the number of items in the cart -->
				<span class="badge badge-warning navbar-badge" id="cartCount"><%= cartItemNo %></span>
		</a></li>

		<!-- Fullscreen Toggle Button -->
		<li class="nav-item"><a class="nav-link" data-widget="fullscreen"
			role="button"> <i class="fas fa-expand-arrows-alt"></i>
		</a></li>
	</ul>
</nav>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Fetch the cart item count
        fetch('/PrimeCart//DBServlet?action=fetchCartItemNo', { method: 'POST' })
            .then(response => response.json())  // Handle JSON response
            .then(data => {
                // Update the cart count with the data received
                const cartItemCount = data.cartItemCount;
                document.getElementById('cartCount').textContent = cartItemCount;
            })
            .catch(error => {
                console.error('Error fetching cart item count:', error);
                
                // Display an alert for the error
                alert("There was an error fetching the cart item count.");
            });
    });
</script>
