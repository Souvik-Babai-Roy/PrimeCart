<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="beans.CategoriesBean"%>
<%@ page import="dao.CategoriesDao"%>
<%@ page import="beans.ProductsBean"%>
<%@ page import="dao.ProductDao"%>
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
<meta name="title" content="PrimeCart | Product Management">
<meta name="author" content="PrimeCart">
<meta name="description"
	content="PrimeCart is an advanced, fully responsive e-commerce admin dashboard with comprehensive features for managing sales, inventory, orders, marketing, and customer support. Built with Bootstrap and JSP for a seamless and dynamic experience.">
<meta name="keywords"
	content="e-commerce admin dashboard, PrimeCart, Bootstrap admin dashboard, sales analytics, inventory management, order processing, customer management, marketing tools, responsive dashboard, e-commerce analytics, JSP, admin panel, data visualization, customer support, inventory dashboard, order management">
<title>PrimeCart | Product Management</title>
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
					<h1 class="m-0">Manage Products</h1>
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
								<i class="fas fa-layer-group"></i> Add Product
							</h3>
						</div>
						<form id="productForm" action="DBServlet" method="POST">
							<!-- Basic Product Details -->
							<div class="invoice card-outline card-info">
								<div class="card-header fst-italic">Basic Details</div>
								<div class="card-body">
									<div class="form-row">
										<div class="form-group col-12">
											<label for="productName">Product Name *</label> <input
												type="text" class="form-control" id="productName"
												name="productName" placeholder="Enter the product name"
												required>
										</div>
										<div class="form-group col-md-6">
											<label for="modelName">Model Name *</label> <input
												type="text" class="form-control" id="modelName"
												name="modelName" placeholder="Enter the model name" required>
										</div>
										<div class="form-group col-md-6">
											<label for="productCode">Product Code *</label> <input
												type="text" class="form-control" id="productCode"
												name="productCode" placeholder="Enter the product code"
												required>
										</div>
										<div class="form-group col-md-6">
											<label for="manufacturerName">Manufacturer *</label> <input
												type="text" class="form-control" id="manufacturerName"
												name="manufacturerName"
												placeholder="Enter manufacturer name" required>
										</div>
										<div class="form-group col-md-6">
											<label for="categoryID">Category *</label> <select
												class="form-control" id="categoryID" name="categoryID"
												required>
												<option value="" selected>Select a category</option>
												<%
												CategoriesDao categoryDAO = new CategoriesDao();
												List<CategoriesBean> categories = categoryDAO.getActiveCategories();
												for (CategoriesBean bean : categories) {
												%>
												<option value="<%=bean.getCategoryID()%>"><%=bean.getCategoryName()%></option>
												<%
												}
												%>

												<!-- Categories to be populated dynamically -->
											</select>
										</div>
										<div class="form-group col-md-6">
											<label for="brand">Brand *</label> <input type="text"
												class="form-control" id="brand" name="brand"
												placeholder="Enter brand name" required>
										</div>
										<div class="form-group col-md-6">
											<label for="brandOrigin">Brand Origin *</label> <input
												type="text" class="form-control" id="brandOrigin"
												name="brandOrigin" placeholder="Enter brand origin" required>
										</div>
									</div>
								</div>
							</div>

							<!-- Pricing and Stock Details -->
							<div class="invoice card-outline card-info">
								<div class="card-header fst-italic">Pricing</div>
								<div class="card-body">
									<div class="form-row">
										<div class="form-group col-md-4">
											<label for="price">Price *</label> <input type="number"
												class="form-control" id="price" name="price"
												placeholder="Enter price" min="0" required step="0.01">
										</div>
										<div class="form-group col-md-4">
											<label for="mrp">MRP *</label> <input type="number"
												class="form-control" id="mrp" name="mrp"
												placeholder="Enter MRP" min="0" required step="0.01">
										</div>
										<div class="form-group col-md-4">
											<label for="discountPercentage">Discount (%)</label> <input
												type="number" class="form-control" id="discountPercentage"
												name="discountPercentage"
												placeholder="Enter discount percentage" min="0" step="0.01">
										</div>
									</div>
								</div>
							</div>

							<!-- Description and Specifications -->
							<div class="invoice card-outline card-info">
								<div class="card-header fst-italic">Description and
									Specifications</div>
								<div class="card-body">
									<div class="form-group">
										<label for="description">Description</label>
										<textarea class="form-control" id="description"
											name="description" rows="4"
											placeholder="Enter product description"></textarea>
									</div>
									<div class="form-group">
										<label for="specKey">Specifications (JSON format)</label>
										<div class="">
											<div id="specificationForm">
												<div class="row form-row align-items-center mb-2">
													<div class="col-md-5">
														<input type="text" class="form-control capitalize-text"
															id="specKey" placeholder="Enter Key (e.g., RAM)" />
													</div>
													<div class="col-md-6 pt-1">
														<input type="text" class="form-control" id="specValue"
															placeholder="Enter Value (e.g., 16GB)" />
													</div>
													<div class="col-md-1 pt-1 text-right">
														<button type="button" class="btn btn-primary btn-sm"
															onclick="addSpecification()">
															<i class="fa-solid fa-circle-plus"></i> Add
														</button>
													</div>
												</div>
											</div>
											<div id="specificationsContainer">
												<ul class="list-group" id="specList">
													<!-- Dynamically Added Specifications -->
												</ul>
											</div>
											<textarea class="form-control mt-3 d-none"
												id="specificationsJson" name="specificationsJson" rows="4"
												readonly placeholder="JSON Preview"></textarea>
										</div>


									</div>
								</div>
							</div>

							<!-- Shipping Details -->
							<div class="invoice card-outline card-info">
								<div class="card-header fst-italic">Shipping Details</div>
								<div class="card-body">
									<div class="form-row">
										<div class="form-group col-md-4">
											<label for="shippingWeight">Shipping Weight (kg) *</label> <input
												type="number" class="form-control" id="shippingWeight"
												required name="shippingWeight"
												placeholder="Enter weight (Example 0.5 or 2)" step="0.01">
										</div>
										<div class="form-group col-md-4">
											<label for="shippingDimensions">Shipping Dimensions</label> <input
												type="text" class="form-control" id="shippingDimensions"
												name="shippingDimensions" placeholder="e.g., 10x20x15 cm">
										</div>
										<div class="form-group col-md-4">
											<label for="payOnDelivery">Pay on Delivery</label> <select
												class="form-control" id="payOnDelivery" name="payOnDelivery">
												<option value="1">Yes</option>
												<option value="0">No</option>
											</select>
										</div>
									</div>
								</div>
							</div>

							<!-- Variants -->
							<!-- 							<div class="invoice card-outline card-info"> -->
							<!-- 								<div class="card-header fst-italic">Variants</div> -->
							<!-- 								<div class="card-body"> -->


							<!-- 									Variant Input Section -->
							<!-- 									<div id="variantContainer"> -->
							<!-- 										<div class="form-row mb-3"> -->
							<!-- 											Color Input -->
							<!-- 											<div class="form-group col-md-4"> -->
							<!-- 												<label for="colourInput">Color</label> -->
							<!-- 												<div class="input-group"> -->
							<!-- 													<input type="text" class="form-control" id="colourInput" -->
							<!-- 														placeholder="Enter color"> -->
							<!-- 													<div class="input-group-append"> -->
							<!-- 														<button type="button" class="btn btn-outline-success" -->
							<!-- 															onclick="addItem('colour')"> -->
							<!-- 															<i class="fa fa-plus-circle"></i> -->
							<!-- 														</button> -->
							<!-- 													</div> -->
							<!-- 												</div> -->
							<!-- 											</div> -->

							<!-- 											Size Input -->
							<!-- 											<div class="form-group col-md-4"> -->
							<!-- 												<label for="sizeInput">Size</label> -->
							<!-- 												<div class="input-group"> -->
							<!-- 													<input type="text" class="form-control" id="sizeInput" -->
							<!-- 														placeholder="Enter size"> -->
							<!-- 													<div class="input-group-append"> -->
							<!-- 														<button type="button" class="btn btn-outline-success" -->
							<!-- 															onclick="addItem('size')"> -->
							<!-- 															<i class="fa fa-plus-circle"></i> -->
							<!-- 														</button> -->
							<!-- 													</div> -->
							<!-- 												</div> -->
							<!-- 											</div> -->

							<!-- 											Pattern Input -->
							<!-- 											<div class="form-group col-md-4"> -->
							<!-- 												<label for="patternInput">Pattern</label> -->
							<!-- 												<div class="input-group"> -->
							<!-- 													<input type="text" class="form-control" id="patternInput" -->
							<!-- 														placeholder="Enter pattern"> -->
							<!-- 													<div class="input-group-append"> -->
							<!-- 														<button type="button" class="btn btn-outline-success" -->
							<!-- 															onclick="addItem('pattern')"> -->
							<!-- 															<i class="fa fa-plus-circle"></i> -->
							<!-- 														</button> -->
							<!-- 													</div> -->
							<!-- 												</div> -->
							<!-- 											</div> -->
							<!-- 										</div> -->

							<!-- 										Separate Containers for Display -->
							<!-- 										<div class="row"> -->
							<!-- 											Colors Container -->
							<!-- 											<div class="col-md-4"> -->
							<!-- 												<h5>Colors</h5> -->
							<!-- 												<ul id="colorList" class="list-group"></ul> -->
							<!-- 											</div> -->

							<!-- 											Sizes Container -->
							<!-- 											<div class="col-md-4"> -->
							<!-- 												<h5>Sizes</h5> -->
							<!-- 												<ul id="sizeList" class="list-group"></ul> -->
							<!-- 											</div> -->

							<!-- 											Patterns Container -->
							<!-- 											<div class="col-md-4"> -->
							<!-- 												<h5>Patterns</h5> -->
							<!-- 												<ul id="patternList" class="list-group"></ul> -->
							<!-- 											</div> -->
							<!-- 										</div> -->
							<!-- 									</div> -->

							<script>
//     // Arrays to store color, size, and pattern values
//     let colorArray = [];
//     let sizeArray = [];
//     let patternArray = [];

//     /**
//      * Adds an item to the respective array and displays it in the container
//      * @param {string} type - The type of item (colour, size, pattern)
//      */
//     function addItem(type) {
//         let inputField, array, listContainer;

//         // Identify the relevant input field, array, and container based on the type
//         if (type === 'colour') {
//             inputField = document.getElementById('colourInput');
//             array = colorArray;
//             listContainer = document.getElementById('colorList');
//         } else if (type === 'size') {
//             inputField = document.getElementById('sizeInput');
//             array = sizeArray;
//             listContainer = document.getElementById('sizeList');
//         } else if (type === 'pattern') {
//             inputField = document.getElementById('patternInput');
//             array = patternArray;
//             listContainer = document.getElementById('patternList');
//         }

//         const value = inputField.value.trim(); // Get input value

//         // Validate input and add to array
//         if (value !== '') {
//             array.push(value); // Add value to the array
//             inputField.value = ''; // Clear input field

//             // Display the item in the container
//             const listItem = document.createElement('li');
//             listItem.className = 'list-group-item d-flex justify-content-between align-items-center';
//             listItem.textContent = value;

//             // Add a remove button to the list item
//             const removeBtn = document.createElement('button');
//             removeBtn.className = 'btn btn-sm btn-danger';
//             removeBtn.innerHTML = '<i class="fa fa-trash"></i>';
//             removeBtn.onclick = function () {
//                 removeItem(type, value, listItem);
//             };

//             listItem.appendChild(removeBtn);
//             listContainer.appendChild(listItem);
//         } else {
//             alert(`Please enter a valid ${type}!`);
//         }
//     }

//     /**
//      * Removes an item from the array and updates the container
//      * @param {string} type - The type of item (colour, size, pattern)
//      * @param {string} value - The value to be removed
//      * @param {HTMLElement} listItem - The list item to be removed
//      */
//     function removeItem(type, value, listItem) {
//         let array;
//         if (type === 'colour') {
//             array = colorArray;
//         } else if (type === 'size') {
//             array = sizeArray;
//         } else if (type === 'pattern') {
//             array = patternArray;
//         }

//         // Remove the value from the array
//         const index = array.indexOf(value);
//         if (index !== -1) {
//             array.splice(index, 1); // Remove the item from the array
//         }

//         // Remove the item from the list
//         listItem.remove();
//     }
</script>




							<!-- 								</div> -->
							<!-- 							</div> -->

							<!-- Additional Details -->
							<div class="invoice card-outline card-info">
								<div class="card-header fst-italic">Additional Details</div>
								<div class="card-body">
									<div class="form-row">
										<div class="form-group col-md-4">
											<label for="replacementDays">Replacement Days *</label> <input
												type="text" class="form-control" id="replacementDays"
												name="replacementDays"
												placeholder="Enter replacement days (Eg. 7)" required>
										</div>
										<div class="form-group col-md-4">
											<label for="warrantyPeriod">Warranty Period</label> <input
												type="text" class="form-control" id="warrantyPeriod"
												name="warrantyPeriod" placeholder="Enter warranty period">
										</div>
										<div class="form-group col-md-4">
											<label for="hsn">HSN</label> <input type="text"
												class="form-control" id="hsn" name="hsn"
												placeholder="Enter HSN code">
										</div>
									</div>
								</div>
							</div>



							<div class="card-footer text-right">
								<button type="submit" name="action" value="addProduct"
									class="btn btn-success">
									<i class="fas fa-plus-circle"></i> Save Product
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
								<button type="button" class="btn btn-tool"
									data-card-widget="remove">
									<i class="fas fa-times"></i>
								</button>
							</div>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<table id="categoriesTable"
								class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>Product Code</th>
										<th>Name</th>
										<th>Brand</th>
										<th>Price</th>
										<th>MRP</th>
										<th>Date Added</th>
										<th>Status</th>
										<th>Edit</th>
										<th>Delete</th>
									</tr>
								</thead>
								<tbody>
									<%
									ProductDao productDao = new ProductDao();
									List<ProductsBean> products = productDao.getAllProducts();
									for (ProductsBean bean : products) {
									%>
									<tr>
										<td><%=bean.getProductCode()%></td>
										<td><%=bean.getProductName()%></td>
										<td><%=bean.getBrand()%></td>
										<td><%=bean.getPrice()%></td>
										<td><%=bean.getMrp()%></td>
										<td><%=new java.text.SimpleDateFormat("dd-MMM-yyyy HH:mm").format(bean.getDateAdded())%></td>
										<td><%=bean.getStatus()%></td>
										<td class="text-center no-print"><a href="#"
											data-bs-toggle="modal" role="button"
											class="btn btn-secondary btn-sm"
											data-bs-target="#editProductModal"
											data-id="<%= bean.getProductID() %>"
											data-name="<%= bean.getProductName() %>"
											data-description="<%= bean.getDescription() %>"
											data-model-name="<%= bean.getModelName() %>"
											data-code="<%= bean.getProductCode() %>"
											data-manufacturer="<%= bean.getManufacturer() %>"
											data-category-id="<%= bean.getCategoryID() %>"
											data-brand="<%= bean.getBrand() %>"
											data-brand-origin="<%= bean.getBrandOrigin() %>"
											data-price="<%= bean.getPrice() %>"
											data-mrp="<%= bean.getMrp() %>"
											data-discount="<%= bean.getDiscountPercentage() %>"
											data-specifications-json="<%= java.net.URLEncoder.encode(bean.getSpecifications(), "UTF-8") %>"
											data-weight="<%= bean.getShippingWeight() %>"
											data-dimensions="<%= bean.getShippingDimensions() %>"
											data-pay-on-delivery="<%= bean.isPayOnDelivery() %>"
											data-replacement-days="<%= bean.getReplacementDay() %>"
											data-warranty-period="<%= bean.getWarrantyPeriod() %>"
											data-hsn="<%= bean.getHsn() %>"
											data-status="<%= bean.getStatus() %>"> <i
												class="fa-regular fa-pen-to-square"></i> Edit
										</a></td>
										<td class="text-center no-print"><a role="button"
											class="btn btn-warning btn-sm"
											onclick="customConfirm('Are you sure you want to delete this item?',
                                    'This action cannot be undone.',
                                    'Yes, Delete',
                                    'No, Keep it',
                                    'DBServlet?action=deleteProduct&id=<%=bean.getProductID()%>')">
												<i class="fa-regular fa-trash-can"></i> Delete
										</a></td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
							<!-- Modal -->












							<div class="modal " id="editProductModal" tabindex="-1"
								aria-labelledby="editProductModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-xl">
									<div class="modal-content">
										<!-- Modal Header -->
										<div class="modal-header">
											<h5 class="modal-title" id="editProductModalLabel">Edit
												Product</h5>
											<button type="button" class="btn btn-sm btn-toggle"
												data-bs-dismiss="modal" aria-label="Close">
												<i class="fa-solid fa-rectangle-xmark"></i>
											</button>
										</div>
										<!-- Modal Body -->
										<div class="modal-body">
											<form id="editProductForm"
												action="DBServlet?action=editProduct" method="POST">
												<!-- Hidden Input for Product ID -->
												<input type="hidden" name="editProductID" id="editProductID">

												<!-- Basic Product Details -->
												<div class="invoice card-outline card-info">
													<div class="card-header fst-italic">Basic Details</div>
													<div class="card-body">
														<div class="form-row">
															<div class="form-group col-12">
																<label for="editProductName">Product Name *</label> <input
																	type="text" class="form-control" id="editProductName"
																	name="editProductName"
																	placeholder="Enter the product name" required>
															</div>
															<div class="form-group col-md-6">
																<label for="editModelName">Model Name *</label> <input
																	type="text" class="form-control" id="editModelName"
																	name="editModelName" placeholder="Enter the model name"
																	required>
															</div>
															<div class="form-group col-md-6">
																<label for="editProductCode">Product Code *</label> <input
																	type="text" class="form-control" id="editProductCode"
																	name="editProductCode"
																	placeholder="Enter the product code" required>
															</div>
															<div class="form-group col-md-6">
																<label for="editManufacturerName">Manufacturer *</label>
																<input type="text" class="form-control"
																	id="editManufacturerName" name="editManufacturerName"
																	placeholder="Enter manufacturer name" required>
															</div>
															<div class="form-group col-md-6">
																<label for="editCategoryID">Category *</label> <select
																	class="form-control" id="editCategoryID"
																	name="editCategoryID" required>
																	<option value="" selected>Select a category</option>
																	<% 
                                        // Populate dynamically
                                        for (CategoriesBean bean : categories) { 
                                        %>
																	<option value="<%=bean.getCategoryID()%>"><%=bean.getCategoryName()%></option>
																	<% } %>
																</select>
															</div>
															<div class="form-group col-md-6">
																<label for="editBrand">Brand *</label> <input
																	type="text" class="form-control" id="editBrand"
																	name="editBrand" placeholder="Enter brand name"
																	required>
															</div>
															<div class="form-group col-md-6">
																<label for="editBrandOrigin">Brand Origin *</label> <input
																	type="text" class="form-control" id="editBrandOrigin"
																	name="editBrandOrigin" placeholder="Enter brand origin"
																	required>
															</div>
														</div>
													</div>
												</div>

												<!-- Pricing and Stock Details -->
												<div class="invoice card-outline card-info">
													<div class="card-header fst-italic">Pricing</div>
													<div class="card-body">
														<div class="form-row">
															<div class="form-group col-md-4">
																<label for="editPrice">Price *</label> <input
																	type="number" class="form-control" id="editPrice"
																	name="editPrice" placeholder="Enter price" min="0"
																	required step="0.01">
															</div>
															<div class="form-group col-md-4">
																<label for="editMRP">MRP *</label> <input type="number"
																	class="form-control" id="editMRP" name="editMRP"
																	placeholder="Enter MRP" min="0" required step="0.01">
															</div>
															<div class="form-group col-md-4">
																<label for="editDiscountPercentage">Discount (%)</label>
																<input type="number" class="form-control"
																	id="editDiscountPercentage"
																	name="editDiscountPercentage"
																	placeholder="Enter discount percentage" min="0"
																	step="0.01">
															</div>
														</div>
													</div>
												</div>

												<!-- Description and Specifications -->
												<div class="invoice card-outline card-info">
													<div class="card-header fst-italic">Description and
														Specifications</div>
													<div class="card-body">
														<!-- Description Field -->
														<div class="form-group">
															<label for="editDescription">Description</label>
															<textarea class="form-control" id="editDescription"
																name="editDescription" rows="4"
																placeholder="Enter product description"></textarea>
														</div>
														<!-- Interactive JSON Specifications -->
														<div class="form-group">
															<label for="editSpecificationsJson">Specifications</label>
															<textarea class="form-control"
																id="editSpecificationsJson"
																name="editSpecificationsJson" rows="4"
																placeholder="Enter product specification in json format like {&quot;specification1 &quot; : &quot; Deatils &quot;, &quot;specification2 &quot; : &quot; Deatils &quot;}"></textarea>

															<ul id="specList" class="list-group mt-3"></ul>
														</div>
													</div>
												</div>

												<!-- Shipping Details -->
												<div class="invoice card-outline card-info">
													<div class="card-header fst-italic">Shipping Details</div>
													<div class="card-body">
														<div class="form-row">
															<div class="form-group col-md-4">
																<label for="editShippingWeight">Shipping Weight
																	(kg) *</label> <input type="number" class="form-control"
																	id="editShippingWeight" name="editShippingWeight"
																	placeholder="Enter weight (e.g., 0.5)" step="0.01"
																	required>
															</div>
															<div class="form-group col-md-4">
																<label for="editShippingDimensions">Shipping
																	Dimensions</label> <input type="text" class="form-control"
																	id="editShippingDimensions"
																	name="editShippingDimensions"
																	placeholder="e.g., 10x20x15 cm">
															</div>
															<div class="form-group col-md-4">
																<label for="editPayOnDelivery">Pay on Delivery</label> <select
																	class="form-control" id="editPayOnDelivery"
																	name="editPayOnDelivery">
																	<option value="1">Yes</option>
																	<option value="0">No</option>
																</select>
															</div>
														</div>
													</div>
												</div>

												<!-- Additional Details -->
												<div class="invoice card-outline card-info">
													<div class="card-header fst-italic">Additional
														Details</div>
													<div class="card-body">
														<div class="form-row">
															<div class="form-group col-md-4">
																<label for="editReplacementDays">Replacement
																	Days *</label> <input type="text" class="form-control"
																	id="editReplacementDays" name="editReplacementDays"
																	placeholder="Enter replacement days (e.g., 7)" required>
															</div>
															<div class="form-group col-md-4">
																<label for="editWarrantyPeriod">Warranty Period</label>
																<input type="text" class="form-control"
																	id="editWarrantyPeriod" name="editWarrantyPeriod"
																	placeholder="Enter warranty period">
															</div>
															<div class="form-group col-md-4">
																<label for="editHSN">HSN</label> <input type="text"
																	class="form-control" id="editHSN" name="editHSN"
																	placeholder="Enter HSN code">
															</div>
														</div>
														<div class="form-group row">
															<label for="editCategoryStatus"
																class="col-2 col-form-label col-form-label">Status</label>
															<div class="col-10">
																<select class="form-control" id="editStatus"
																	name="editStatus">
																	<option value="Active">Active</option>
																	<option value="Inactive">Inactive</option>
																	<option value="Out of Stock">Out of Stock</option>
																	<option value="Discontinued">Discontinued</option>
																	<option value="Restricted">Restricted</option>
																</select>
															</div>
														</div>
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
//Populate modal fields when Edit link is clicked
document.querySelectorAll('a[data-bs-target="#editProductModal"]').forEach(link => {
    link.addEventListener('click', function () {
        const productData = this.dataset; // Access data-* attributes
     // Decode the URL-encoded specifications JSON string
        const decodedSpecificationsJson = decodeURIComponent(productData.specificationsJson);

        
        // Populate the modal fields
        document.getElementById('editProductID').value = productData.id;
        document.getElementById('editProductName').value = productData.name;
        document.getElementById('editModelName').value = productData.modelName;
        document.getElementById('editProductCode').value = productData.code;
        document.getElementById('editManufacturerName').value = productData.manufacturer;
        document.getElementById('editCategoryID').value = productData.categoryId;
        document.getElementById('editBrand').value = productData.brand;
        document.getElementById('editBrandOrigin').value = productData.brandOrigin;
        document.getElementById('editPrice').value = productData.price;
        document.getElementById('editMRP').value = productData.mrp;
        document.getElementById('editDiscountPercentage').value = productData.discount;
        document.getElementById('editDescription').value = productData.description;
        
        // Handle specificationsJson
        const specificationsJson = decodeURIComponent(productData.specificationsJson);
        document.getElementById('editSpecificationsJson').value = specificationsJson.replace(/\+/g, ' ');;
        
        document.getElementById('editShippingWeight').value = productData.weight;
        document.getElementById('editShippingDimensions').value = productData.dimensions;
        document.getElementById('editPayOnDelivery').value = productData.payOnDelivery;
        document.getElementById('editReplacementDays').value = productData.replacementDays;
        document.getElementById('editWarrantyPeriod').value = productData.warrantyPeriod;
        document.getElementById('editHSN').value = productData.hsn;
        document.getElementById('editStatus').value = productData.status;
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

	<!-- Embed server-side data in JavaScript -->
	<script>
    // Initialize the specifications object from JSP
    let specifications = {};

    <%// Retrieve the specifications map from the request attribute
Map<String, String> specificationsMap = (Map<String, String>) request.getAttribute("specifications");
if (specificationsMap != null) {
	for (Map.Entry<String, String> entry : specificationsMap.entrySet()) {
		String key = entry.getKey().replaceAll("\"", "\\\""); // Escape quotes
		String value = entry.getValue().replaceAll("\"", "\\\""); // Escape quotes%>
    // Pass the key and value to the JavaScript object
    specifications["<%=key%>"] = "<%=value%>";
    <%}
}%>

    // Function to capitalize the first letter of each word
    function capitalizeWords(input) {
        return input.split(" ")
            .map(word => word.charAt(0).toUpperCase() + word.slice(1).toLowerCase())
            .join(" ");
    }

    // Function to add a specification
    function addSpecification() {
        let key = document.getElementById("specKey").value.trim();
        const value = document.getElementById("specValue").value.trim();

        // Capitalize the key
        key = capitalizeWords(key);

        if (!key || !value) {
            alert("Both Key and Value fields must be filled.");
            return;
        }

        if (specifications.hasOwnProperty(key)) {
            alert(`The key already exists. Please enter a unique key.`);
            return;
        }

        specifications[key] = value;

        updateSpecificationList();
        updateSpecificationsJson();

        document.getElementById("specKey").value = "";
        document.getElementById("specValue").value = "";
    }

    // Function to update the specification list in the UI
    function updateSpecificationList() {
        const specList = document.getElementById("specList");
        specList.innerHTML = "";

        for (const key in specifications) {
            if (specifications.hasOwnProperty(key)) {
                const listItem = document.createElement("li");
                listItem.className = "list-group-item d-flex justify-content-between align-items-center text-wrap";
                listItem.innerHTML =
                    '<div>' + key + ': ' + specifications[key] + '</div>' +
                    '<button class="btn btn-danger btn-sm" onclick="removeSpecification(\'' + key + '\')"><i class="fa-solid fa-trash"></i></button>';
                specList.appendChild(listItem);
            }
        }
    }

    // Function to remove a specification
    function removeSpecification(key) {
        if (!specifications.hasOwnProperty(key)) {
            alert(`Key "${key}" does not exist.`);
            return;
        }

        delete specifications[key];

        updateSpecificationList();
        updateSpecificationsJson();
    }

    // Function to update the JSON preview
    function updateSpecificationsJson() {
        const jsonPreview = document.getElementById("specificationsJson");
        jsonPreview.value = JSON.stringify(specifications, null, 4);
    }

    // Populate the specification list on page load
    window.onload = function () {
        updateSpecificationList();
        updateSpecificationsJson();
    };
    
    
    
</script>









</body>
</html>