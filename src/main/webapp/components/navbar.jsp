<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!-- Preloader Section -->
<!-- Display a preloader animation while the page is loading -->
<div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="img/loading.gif" alt="Loading Animation" height="120" width="200" />
</div>

<!-- Navbar Section -->
<!-- Main navigation bar with left and right aligned items -->

<nav class="main-header navbar navbar-expand navbar-white navbar-light">

    <!-- Left Navbar Links -->
    <ul class="navbar-nav">
        <!-- Button to toggle the sidebar -->
        <li class="nav-item">
            <a class="nav-link text-lg" data-widget="pushmenu" href="#" role="button">
                <i class="fas fa-bars"></i>
            </a>
        </li>
        
		<%
		    // Use false to prevent creating a new session
		    if (request.getSession(false) == null) {
		        response.sendRedirect("login.html");
		        return;
		    }

		    // Get the userType from the session
		    String userType = (String) session.getAttribute("userType");

		    // If userType is null, redirect to login page
		    if (userType == null) {
		        response.sendRedirect("login.html");
		        return;
		    }

		    // Get the current page name
		    String currentPath = request.getRequestURI();
		    currentPath = currentPath.substring(currentPath.lastIndexOf("/") + 1);

		    // Determine home path based on user type
		    String homePath1 = userType.equals("Admin") ? "dashboard.jsp" : "home.jsp";
		    session.setAttribute("homePath", homePath1);
		%>



        <!-- Placeholder text (can be replaced with actual content) -->
        <li class="nav-item d-none d-sm-inline-block"><a href="<%= homePath1 %>" class="nav-link">Home</a></li>
    </ul>

    <!-- Right Navbar Links -->
    <ul class="navbar-nav ml-auto">
        
        <!-- Search Icon and Search Bar Toggle -->
        <li class="nav-item">
            <a class="nav-link" data-widget="navbar-search" href="#" role="button">
                <i class="fas fa-search"></i>
            </a>
            <!-- Search Bar Dropdown -->
            <div class="navbar-search-block">
                <div class="form-inline">
                    <div class="input-group input-group-sm">
                        <!-- Search input field -->
                        <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
                        <div class="input-group-append">
                            <!-- Submit search button -->
                            <button class="btn btn-navbar" type="submit">
                                <i class="fas fa-search"></i>
                            </button>
                            <!-- Close search button -->
                            <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </li>

        <!-- Cart Icon with Badge -->
        <li class="nav-item">
            <a class="nav-link btn-outline-info" href="test.html">
                <i class="fa-solid fa-cart-shopping"></i> Cart&nbsp;
                <!-- Badge showing the number of items in the cart -->
                <span class="badge badge-warning navbar-badge"><%= request.getAttribute("cartItemNo") %></span>
            </a>
        </li>

        <!-- Spacer for layout purposes -->
        <li class="nav-item">&nbsp;</li>
    </ul>
</nav>
