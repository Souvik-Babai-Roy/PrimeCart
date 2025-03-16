<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="beans.CategoriesBean"%>
<%@ page import="dao.CategoriesDao"%>
<%@ page
	import="dao.InventoryDao, beans.InventoryBean, java.sql.SQLException"%>

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
<meta name="title" content="PrimeCart | Category Management">
<meta name="author" content="PrimeCart">
<meta name="description"
	content="PrimeCart is an advanced, fully responsive e-commerce admin dashboard with comprehensive features for managing sales, inventory, orders, marketing, and customer support. Built with Bootstrap and JSP for a seamless and dynamic experience.">
<meta name="keywords"
	content="e-commerce admin dashboard, PrimeCart, Bootstrap admin dashboard, sales analytics, inventory management, order processing, customer management, marketing tools, responsive dashboard, e-commerce analytics, JSP, admin panel, data visualization, customer support, inventory dashboard, order management">
<title>PrimeCart | Category Management</title>
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
<link rel="stylesheet" href="Styles/datatable-buttons-style.css">

<style>
/* Common Styles for Suggestions Dropdown */
#suggestions {
	position: absolute;
	z-index: 1000;
	max-height: 200px;
	overflow-y: auto;
	display: none; /* Initially hidden */
	width: 100%; /* Matches input width */
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Light shadow by default */
}

/* Light Mode */
body.light-mode #suggestions {
	background: #fff; /* White background */
	border: 1px solid #ccc; /* Light grey border */
	color: #000; /* Dark text */
}

body.light-mode .suggestion-item {
	padding: 5px 10px;
	cursor: pointer;
	color: #000; /* Text color */
}

body.light-mode .suggestion-item:hover {
	background-color: #f0f0f0; /* Light grey hover */
}

/* Dark Mode */
body.dark-mode #suggestions {
	background: #2c2c2c; /* Dark grey background */
	border: 1px solid #444; /* Darker border */
	color: #f1f1f1; /* Light text */
	box-shadow: 0 2px 5px rgba(255, 255, 255, 0.1); /* Light shadow */
}

body.dark-mode .suggestion-item {
	padding: 5px 10px;
	cursor: pointer;
	color: #f1f1f1; /* Light text for suggestions */
}

body.dark-mode .suggestion-item:hover {
	background-color: #3a3a3a; /* Slightly lighter hover background */
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


<script>

</script>
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
					<h1 class="m-0">Manage Inventory</h1>
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<br>
					<div class="card card-primary shadow">
						<div class="card-header">
							<h3 class="card-title">
								<i class="fas fa-layer-group"></i> Add Inventory
							</h3>
						</div>
						<form action="DBServlet" method="post">
							<div class="card-body">
								<!-- Hidden field for Edit/Delete -->


								<div class="form-group position-relative">
									<label for="productName">Product Name:</label> <input
										type="text" name="productName" id="productName"
										class="form-control" placeholder="Enter Product Name"
										autocomplete="off" required> <input type="hidden"
										name="productID" id="productID">
									<!-- Suggestions container -->
									<div id="suggestions"></div>
								</div>

								<div id="productDetails" class="mt-3">
									<!-- Fetched product details will display here -->
								</div>


								<script>
$(document).ready(function () {
    // Product name input event for suggestions
    $("#productName").on("input", function () {
        var query = $(this).val().trim(); // Trim to avoid spaces
        if (query.length >= 2) { // Trigger after 2+ characters
            $.ajax({
                url: "searchProduct.jsp", // Backend to fetch suggestions
                type: "GET",
                data: { query: query },
                success: function (data) {
                    if (data.trim() === "") {
                        $("#suggestions").hide(); // Hide if no suggestions
                    } else {
                        $("#suggestions").html(data).show(); // Populate suggestions
                    }
                },
                error: function () {
                    console.error("Error fetching suggestions.");
                }
            });
        } else {
            $("#suggestions").hide(); // Hide suggestions if query too short
        }
    });

    // Handle suggestion click
    $(document).on("click", ".suggestion-item", function () {
        var productID = $(this).data("id");
        var productName = $(this).text();

        $("#productName").val(productName); // Set selected product name
        $("#productID").val(productID);     // Set hidden product ID
        $("#suggestions").hide();           // Hide suggestions
        $("#productName").prop("readonly", true);

        fetchProductDetails(productID); // Fetch product details
    });

    // Hide suggestions on outside click
    $(document).click(function (event) {
        if (!$(event.target).closest('#productName, #suggestions').length) {
            $("#suggestions").hide();
        }
    });
});

// Fetch product details when a product ID is set
function fetchProductDetails(productID) {
    if (productID) {
        $.ajax({
            url: "fetchProductDetails.jsp", // Backend script
            type: "GET",
            data: { productID: productID },
            success: function (data) {
                $("#productDetails").html(data); // Update details container
            },
            error: function (xhr, status, error) {
                console.error("Error fetching product details:", error);
            }
        });
    } else {
        console.warn("No product selected.");
    }
}

</script>


								<div class="row">
									<div class="form-group col-md-6">
										<label for="stockLevel">Stock Level:</label> <input
											type="number" name="stockLevel" id="stockLevel"
											class="form-control" required min="0">
									</div>
									<div class="form-group col-md-6">
										<label for="minimumStockLevel">Minimum Stock Level:</label> <input
											type="number" name="minimumStockLevel" id="minimumStockLevel"
											class="form-control" required min="0">
									</div>
								</div>

								<div class="row">
									<div class="form-group col-md-6">
										<label for="warehouseLocation">Warehouse Location:</label> <input
											type="text" name="warehouseLocation" id="warehouseLocation"
											class="form-control">
									</div>
									<div class="form-group col-md-6">
										<label for="restockDate">Restock Date (if applicable):</label>
										<input type="date" name="restockDate" id="restockDate"
											class="form-control">
									</div>
								</div>


							</div>
							<div class="card-footer text-right">
								<button type="submit" name="action" value="addInventory"
									class="btn btn-success">
									<i class="fas fa-plus-circle"></i> Add Category
								</button>
							</div>
						</form>

					</div>
					<!-- Category List Section -->
					<div class="card card-secondary">
						<div class="card-header">
							<h3 class="card-title">
								<i class="fa-solid fa-table-list"></i> All Categories
							</h3>
							<div class="card-tools">
								<button type="button" class="btn btn-tool"
									data-card-widget="collapse">
									<i class="fas fa-minus"></i>
								</button>
							</div>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<table id="categoriesTable"
								class="table table-bordered table-striped table-hover">
								<thead>
									<tr>
										<th>ID</th>
										<th>Product Name</th>
										<th>Location</th>
										<th>Current Stock</th>
										<th>Min. Stock</th>
										<th>Restock Date</th>
										<th>Updated By</th>
										<th>Edit</th>
										<th>Delete</th>
									</tr>
								</thead>
								<tbody>
									<%
									InventoryDao inventoryDao = new InventoryDao();
									List<InventoryBean> inventory = inventoryDao.getAllInventory();
									for (InventoryBean bean : inventory) {
									%>
																			<%
    String restockDate = bean.getRestockDate();
    String formattedDate = ""; // Initialize an empty date

    if (restockDate != null && !restockDate.isEmpty()) {
        try {
            // Assuming input format is DD-MM-YYYY or similar
            java.text.SimpleDateFormat inputFormat = new java.text.SimpleDateFormat("yyyy-MM-dd"); // Change this as per input
            java.text.SimpleDateFormat outputFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");
            formattedDate = outputFormat.format(inputFormat.parse(restockDate));
        } catch (Exception e) {
            formattedDate = ""; // Leave blank if parsing fails
        }
    }
%>
									<tr>
										<td><%=bean.getProductID()%></td>
										<td><%=bean.getProductName()%></td>
										<td><%=bean.getWarehouseLocation()%></td>
										<td><%=bean.getStockLevel()%></td>
										<td><%=bean.getMinimumStockLevel()%></td>
										<td><%=formattedDate%></td>
										<td><%=bean.getUpdatedBy()%></td>
										

										
										<td class="text-center no-print">
    <a href="#" data-bs-toggle="modal" role="button" class="btn btn-info btn-sm" 
       data-bs-target="#editModal"
       data-inventoryid="<%=bean.getInventoryID()%>"
       data-productid="<%=bean.getProductID()%>"
       data-productname="<%=bean.getProductName()%>"
       data-stocklevel="<%=bean.getStockLevel()%>"
       data-minstocklevel="<%=bean.getMinimumStockLevel()%>"
       data-restockdate="<%=formattedDate%>"
       data-location="<%=bean.getWarehouseLocation()%>">
        <i class="fa-regular fa-pen-to-square"></i> Edit
    </a>
</td>
										<td class="text-center no-print"><a role="button"
											class="btn btn-warning btn-sm"
											onclick="customConfirm('Are you sure you want to delete this item?',
                                    'This action cannot be undone.',
                                    'Yes, Delete',
                                    'No, Keep it',
                                    'DBServlet?action=deleteInventory&id=<%=bean.getInventoryID()%>')">
												<i class="fa-regular fa-trash-can"></i> Delete
										</a></td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
							<!-- Modal -->
							<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Edit Inventory Item</h5>
                <button type="button" class="btn btn-sm btn-toggle"
                                       data-bs-dismiss="modal" aria-label="Close">
                                    <i class="fa-solid fa-rectangle-xmark"></i>
                                    </button>
            </div>
            <!-- Modal Body -->
            <div class="modal-body">
                <form id="editForm" action="DBServlet?action=editInventory" method="post">
                    <input type="hidden" name="editInventoryID" id="editInventoryID">
                    <input type="hidden" name="editProductID" id="editProductID">

                    <!-- Product Name -->
                    <div class="form-group">
                        <label for="editProductName"><strong>Product Name</strong></label>
                        <input type="text" class="form-control" id="editProductName" name="editProductName" readonly>
                    </div>

                    <!-- Stock Level and Minimum Stock Level -->
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="editStockLevel"><strong>Stock Level</strong></label>
                            <input type="number" class="form-control" id="editStockLevel" name="editStockLevel" required min="0">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="editMinimumStockLevel"><strong>Minimum Stock Level</strong></label>
                            <input type="number" class="form-control" id="editMinimumStockLevel" name="editMinimumStockLevel" required min="0">
                        </div>
                    </div>

                    <!-- Warehouse Location and Restock Date -->
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="editWarehouseLocation"><strong>Warehouse Location</strong></label>
                            <input type="text" class="form-control" id="editWarehouseLocation" name="editWarehouseLocation">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="editRestockDate"><strong>Restock Date (if applicable)</strong></label>
                            <input type="date" class="form-control" id="editRestockDate" name="editRestockDate">
                        </div>
                    </div>

                    <!-- Modal Footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success">
                            <i class="fa-regular fa-pen-to-square"></i> Save Changes
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
// Populate modal fields when Edit link is clicked
document.querySelectorAll('a[data-bs-target="#editModal"]').forEach(link => {
    link.addEventListener('click', function () {
        const inventoryID = this.getAttribute('data-inventoryid');
        const productID = this.getAttribute('data-productid');
        const stockLevel = this.getAttribute('data-stocklevel');
        const minStockLevel = this.getAttribute('data-minstocklevel');
        const restockDate = this.getAttribute('data-restockdate');
        const warehouseLocation = this.getAttribute('data-location');

        // Populate the modal fields
        document.getElementById('editInventoryID').value = inventoryID;
        document.getElementById('editProductID').value = productID;
        document.getElementById('editProductName').value = this.getAttribute('data-productname');
        document.getElementById('editStockLevel').value = stockLevel;
        document.getElementById('editMinimumStockLevel').value = minStockLevel;
        document.getElementById('editRestockDate').value = restockDate;
        document.getElementById('editWarehouseLocation').value = warehouseLocation;
    });
});
</script>
						</div>
						<!-- /.card-body -->
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
	<!-- DataTables  & Plugins -->
	<script src="plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
	<script src="plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
	<script src="plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
	<script src="plugins/jszip/jszip.min.js"></script>
	<script src="plugins/pdfmake/pdfmake.min.js"></script>
	<script src="plugins/pdfmake/vfs_fonts.js"></script>
	<script src="plugins/datatables-buttons/js/buttons.html5.min.js"></script>
	<script src="plugins/datatables-buttons/js/buttons.print.min.js"></script>
	<script src="plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
	<script>
         window.history.replaceState(null, '', window.location.pathname);
         
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
	<script>
         document.addEventListener("DOMContentLoaded", () => {
           $(function () {
             // Initialize DataTable with buttons
             const table = $("#categoriesTable").DataTable({
               responsive: true,
               lengthChange: false,
               autoWidth: false,
               buttons: [
                 {
                   extend: "copy",
                },
                 {
                   extend: "csv",
                 },
                 {
                   extend: "excel",
                 },
                 {
                   extend: "pdf",
                 },
                 {
                   extend: "print",
                 },
                 {
                     extend: "colvis",
                   }
                 
               ]
             });
         
             // Append buttons container to DataTable header
             table.buttons().container()
               .addClass('d-flex justify-content-start mt-2') // Align buttons correctly
               .appendTo('#categoriesTable_wrapper .col-md-6:eq(0)');
         
             // Ensure search label and input are in the same row
             const searchContainer = document.querySelector('#categoriesTables_wrapper .col-md-6:eq(1)');
             if (searchContainer) {
               searchContainer.classList.add('d-flex', 'align-items-center', 'justify-content-end'); // Align label and input
             }
         
             // Style search input for consistency
             const searchInput = document.querySelector('#categoriesTable_wrapper input[type="search"]');
             if (searchInput) {
               searchInput.classList.add('form-control', 'form-control-sm', 'ml-2');
               searchInput.style.width = 'auto'; // Adjust search input width
             }
           });
         });
      </script>
</body>
</html>