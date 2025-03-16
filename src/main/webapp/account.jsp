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
<meta name="title" content="PrimeCart | Account">
<meta name="author" content="PrimeCart">
<meta name="description"
	content="PrimeCart is an advanced, fully responsive e-commerce admin dashboard with comprehensive features for managing sales, inventory, orders, marketing, and customer support. Built with Bootstrap and JSP for a seamless and dynamic experience.">
<meta name="keywords"
	content="e-commerce admin dashboard, PrimeCart, Bootstrap admin dashboard, sales analytics, inventory management, order processing, customer management, marketing tools, responsive dashboard, e-commerce analytics, JSP, admin panel, data visualization, customer support, inventory dashboard, order management">
<title>PrimeCart | Account</title>
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
<style>
/* Hide the link icon by default */
.link-icon {
	opacity: 0;
	transition: opacity 0.3s ease-in-out;
}
/* Show the link icon on hover */
a:hover .link-icon {
	opacity: 1;
}
</style>
<style>
.save-cancel-buttons {
	display: none;
}

.form-section.edit-mode .save-cancel-buttons {
	display: block;
}

.form-section.edit-mode .form-control, .form-section.edit-mode .form-check-input
	{
	pointer-events: auto;
	background-color: #fff;
	border: 1px solid #ced4da;
}

.form-section.edit-mode .edit-button {
	display: none;
}

.form-control[readonly] {
	background-color: transparent;
	border: none;
	pointer-events: none;
	color: #495057;
	font-weight: 500;
	padding-left: 0;
}

.form-control[readonly]:focus {
	outline: none;
	box-shadow: none;
}
</style>
<style>
/* Address List Styling */
.address-item {
	border: 1px solid #ddd;
	border-radius: 8px;
	padding: 20px;
	margin-bottom: 15px;
	transition: box-shadow 0.3s ease-in-out;
}

.address-item:hover {
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
}

/* Add Address Button */
.add-address-btn {
	font-size: 1rem;
	font-weight: bold;
	color: #007bff;
	text-decoration: none;
}

.add-address-btn:hover {
	text-decoration: underline;
}
/* Form labels */
label {
	font-weight: 600;
}
</style>
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
					<div class="row">
						<div class="col-md-3">
							<!-- Profile Image -->
							<div class="card card-primary card-outline">
								<div class="card-body box-profile">
									<div class="text-center">
										<img class="profile-user-img img-fluid img-circle"
											src="img/user-profile-icon.png" alt="User profile picture" />
									</div>
									<h3 class="profile-username text-center">Souvik Roy</h3>
								</div>
							</div>
							<!-- About Me Box -->
							<div class="card card-primary collapsed-card">
								<div class="card-header">
									<h3 class="card-title">About Me</h3>
									<div class="card-tools">
										<button type="button" class="btn btn-tool"
											data-card-widget="collapse">
											<i class="fas fa-plus"></i>
										</button>
									</div>
								</div>
								<div class="card-body">
									<a href="orders.jsp" class="text-reset "> <strong><i
											class="fa-solid fa-box-open"></i> Total Orders</strong> <small
										class="link-icon"><i class="fas fa-link"></i></small> <span
										class="badge badge-success float-right">5</span></a>
									<hr />
									<a href="wishlist.jsp" class="text-reset"> <strong><i
											class="fa-brands fa-gratipay"></i> Wishlist Items</strong> <small
										class="link-icon"><i class="fas fa-link"></i></small> <span
										class="badge badge-danger float-right">10</span></a>
									<hr />
									<strong><i class="fa-solid fa-user-clock"></i> Member
										since</strong> <span class="badge badge-info float-right">15-Sep
										2021</span>

									<hr />


									<!-- Manage Password -->
									<a class="text-reset text-danger" id="password-btn"
										data-bs-toggle="modal" data-bs-target="#password"
										type="button" aria-controls="password" aria-selected="false">
										<strong><i class="fas fa-user-lock"></i> Edit
											Password</strong>
									</a>

									<!-- Edit Password Modal -->
									<div class="modal fade" id="password" tabindex="-1"
										aria-labelledby="passwordLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<!-- Modal Header -->
												<div class="modal-header">
													<h5 class="modal-title" id="passwordLabel">Edit
														Password</h5>
													<button type="button" class="btn btn-sm btn-toggle"
														data-bs-dismiss="modal" aria-label="Close">
														<i class="fa-solid fa-rectangle-xmark"></i>
													</button>
												</div>
												<!-- Modal Body -->
												<div class="modal-body">
													<!-- Current Password Verification -->
													<div id="verifyPasswordSection">
														<div class="mb-3">
															<label for="currentPassword" class="form-label">Enter
																Current Password</label>
															<div class="input-group">
																<input type="password" class="form-control"
																	id="currentPassword" placeholder="Current Password">
																<button
																	class="btn btn-outline-secondary toggle-password"
																	type="button" data-target="#currentPassword">
																	<i class="fa-solid fa-eye"></i>
																</button>

															</div>
															<small id="passwordError" class="text-danger"
																style="display: none;">Incorrect password.
																Please try again.</small>
														</div>
														<button type="button" class="btn btn-primary"
															id="verifyPasswordBtn">Verify</button>
													</div>

													<!-- Edit Password Section -->
													<form id="editPasswordForm"
														action="DBServlet?action=editPassword" method="POST">
														<div id="editPasswordSection" style="display: none;">
															<div class="mb-3">
																<label for="newPassword" class="form-label">New
																	Password</label>
																<div class="input-group">
																	<input type="password" class="form-control"
																		id="newPassword" name="newPassword"
																		placeholder="New Password">
																	<button
																		class="btn btn-outline-secondary toggle-password"
																		type="button" data-target="#newPassword">
																		<i class="fa-solid fa-eye"></i>
																	</button>
																</div>
															</div>
															<div class="mb-3">
																<label for="confirmPassword" class="form-label">Confirm
																	New Password</label>
																<div class="input-group">
																	<input type="password" class="form-control"
																		id="confirmPassword" placeholder="Confirm Password">
																	<button
																		class="btn btn-outline-secondary toggle-password"
																		type="button" data-target="#confirmPassword">
																		<i class="fa-solid fa-eye"></i>
																	</button>
																</div>
															</div>
															<button type="button" class="btn btn-success"
																id="savePasswordBtn">Save Changes</button>
														</div>
													</form>
												</div>
												<!-- Modal Footer -->
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>


									<script>
    document.addEventListener('DOMContentLoaded', function () {
        const verifyPasswordBtn = document.getElementById('verifyPasswordBtn');
        const currentPassword = document.getElementById('currentPassword');
        const passwordError = document.getElementById('passwordError');
        const verifyPasswordSection = document.getElementById('verifyPasswordSection');
        const editPasswordSection = document.getElementById('editPasswordSection');
        const savePasswordBtn = document.getElementById('savePasswordBtn');
        const newPassword = document.getElementById('newPassword');
        const confirmPassword = document.getElementById('confirmPassword');
        const editPasswordForm = document.getElementById('editPasswordForm');
        const modal = new bootstrap.Modal(document.getElementById('password')); // Bootstrap modal instance

        // Mock verification of current password
        verifyPasswordBtn.addEventListener('click', function () {
            const correctPassword = "pass123"; // Replace this with your actual server-side verification
            if (currentPassword.value === correctPassword) {
                verifyPasswordSection.style.display = "none"; // Hide current password section
                editPasswordSection.style.display = "block"; // Show edit password section
                passwordError.style.display = "none"; // Hide error message
            } else {
                passwordError.style.display = "block"; // Show error message
            }
        });

        // Toggle password visibility
        document.querySelectorAll('.toggle-password').forEach(function (btn) {
            btn.addEventListener('click', function () {
                const target = document.querySelector(btn.getAttribute('data-target'));
                if (target.type === "password") {
                    target.type = "text";
                    btn.innerHTML = '<i class="fa-solid fa-eye-slash"></i>';
                } else {
                    target.type = "password";
                    btn.innerHTML = '<i class="fa-solid fa-eye"></i>';
                }
            });
        });

        // Save Password Functionality
        savePasswordBtn.addEventListener('click', function () {
            if (newPassword.value !== confirmPassword.value) {
                // Show SweetAlert if passwords don't match
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'Passwords do not match. Please try again!',
                    toast: true,
                    position: 'top-end',
                    timer: 3000,
                    timerProgressBar: true,
                    showConfirmButton: false
                });
            } else {
                // Show SweetAlert success toaster
                Swal.fire({
                    icon: 'success',
                    title: 'Success!',
                    text: 'Your password has been updated.',
                    toast: true,
                    position: 'top-end',
                    timer: 2000,
                    timerProgressBar: true,
                    showConfirmButton: false
                }).then(() => {                    
                    // Close the modal
                    modal.hide();
                 // Submit the form
                    editPasswordForm.submit();
                });
            }
        });
    });
</script>







								</div>
							</div>
						</div>
						<div class="col-md-9">
							<div class="card">
								<div class="card-header p-2">
									<ul class="nav nav-tabs elevation-2 " id="productTab"
										role="tablist">
										<li class="nav-item" role="presentation">
											<button class="nav-link active" id="description-tab"
												data-bs-toggle="tab" data-bs-target="#info" type="button"
												role="tab" aria-controls="information" aria-selected="true">Personal
												Information</button>
										</li>
										<li class="nav-item" role="presentation">
											<button class="nav-link" id="specification-tab"
												data-bs-toggle="tab" data-bs-target="#address" type="button"
												role="tab" aria-controls="specification"
												aria-selected="false">Manage Addresses</button>
										</li>
										<li class="nav-item" role="presentation">
											<button class="nav-link" id="permission-tab"
												data-bs-toggle="tab" data-bs-target="#role" type="button"
												role="tab" aria-controls="role" aria-selected="false">Manage
												Roles</button>
										</li>
									</ul>
								</div>
								<div class="card-body">
									<div class="tab-content p-3" id="">
										<div class="tab-pane fade show active" id="info"
											role="tabpanel" aria-labelledby="description-tab">
											<!-- Personal Information -->
											<div class="form-section" id="personal-info">
												<div class="font-weight-bold font-italic row"
													style="margin-left: -10px;">
													<div class="col-6">Personal Info</div>
													<div class="text-right col-6">
														<button class="btn btn-toggle btn-xs edit-button"
															onclick="toggleEdit('personal-info')">
															<i class="fa-solid fa-pen-to-square"></i> Edit
														</button>
													</div>
												</div>
												<div class="post clearfix" style="margin-left: -10px;"></div>
												<div class="row">
													<div class="form-group row col-6">
														<label for="firstName" class="col-sm-4 col-form-label">First
															Name</label>
														<div class="col-sm-8">
															<input type="text" class="form-control" id="firstName"
																value="Souvik" readonly>
														</div>
													</div>
													<div class="form-group row col-6">
														<label for="lastName" class="col-sm-4 col-form-label">Last
															Name</label>
														<div class="col-sm-8">
															<input type="text" class="form-control" id="lastName"
																value="Roy" readonly>
														</div>
													</div>
												</div>
												<div class="text-right">
													<div class="save-cancel-buttons mt-2">
														<button class="btn btn-primary btn-sm me-2"
															onclick="saveChanges('personal-info')">
															<i class="fa-solid fa-floppy-disk"></i> Save
														</button>
														<button class="btn btn-secondary btn-sm"
															onclick="cancelChanges('personal-info')">
															<i class="fa-solid fa-text-slash"></i> Cancel
														</button>
													</div>
												</div>
											</div>
											<br>
											<!-- Gender Section -->
											<div class="font-weight-bold font-italic row"
												style="margin-left: -10px;">
												<div class="col-6">Gender Section</div>
												<div class="text-right col-6">
													<button class="btn btn-toggle btn-xs edit-button"
														onclick="toggleEdit('gender-section')">
														<i class="fa-solid fa-pen-to-square"></i> Edit
													</button>
												</div>
											</div>
											<div class="post clearfix" style="margin-left: -10px;"></div>
											<div class="form-section" id="gender-section">
												<div class="form-group row">
													<label class="col-3 col-md-2 col-form-label">Gender</label>
													<div class="col-9 col-md-10">
														<div class="form-check form-check-inline pt-2">
															<input class="form-check-input" type="radio"
																name="gender" id="male" value="male" checked disabled>
															<label class="form-check-label" for="male">Male</label>
														</div>
														<div class="form-check form-check-inline pt-2">
															<input class="form-check-input" type="radio"
																name="gender" id="female" value="female" disabled>
															<label class="form-check-label" for="female">Female</label>
														</div>
														<div class="form-check form-check-inline pt-2">
															<input class="form-check-input" type="radio"
																name="gender" id="other" value="other" disabled>
															<label class="form-check-label" for="other">Other</label>
														</div>
													</div>
												</div>
												<div class="text-right">
													<div class="save-cancel-buttons mt-2">
														<button class="btn btn-primary btn-sm me-2"
															onclick="saveChanges('gender-section')">
															<i class="fa-solid fa-floppy-disk"></i> Save
														</button>
														<button class="btn btn-secondary btn-sm"
															onclick="cancelChanges('gender-section')">
															<i class="fa-solid fa-text-slash"></i> Cancel
														</button>
													</div>
												</div>
											</div>
											<br>
											<!-- Email Address -->
											<div class="font-weight-bold font-italic row"
												style="margin-left: -10px;">
												<div class="col-6">Email Section</div>
												<div class="text-right col-6">
													<button class="btn btn-toggle btn-xs edit-button"
														onclick="toggleEdit('email-section')">
														<i class="fa-solid fa-pen-to-square"></i> Edit
													</button>
												</div>
											</div>
											<div class="post clearfix" style="margin-left: -10px;"></div>
											<div class="form-section" id="email-section">
												<div class="form-group row">
													<label for="email"
														class="col-3 col-md-2 col-form-label col-form-label">Email</label>
													<div class="col-9 col-md-10">
														<input type="email" class="form-control" id="email"
															value="souvikroy733@gmail.com" readonly>
													</div>
												</div>
												<div class="text-right">
													<div class="save-cancel-buttons mt-2">
														<button class="btn btn-primary btn-sm me-2"
															onclick="saveChanges('email-section')">
															<i class="fa-solid fa-floppy-disk"></i> Save
														</button>
														<button class="btn btn-secondary btn-sm"
															onclick="cancelChanges('email-section')">
															<i class="fa-solid fa-text-slash"></i> Cancel
														</button>
													</div>
												</div>
											</div>
											<br>
											<!-- Mobile Number -->
											<div class="font-weight-bold font-italic row"
												style="margin-left: -10px;">
												<div class="col-6">Mobile Section</div>
												<div class="text-right col-6">
													<button class="btn btn-toggle btn-xs edit-button"
														onclick="toggleEdit('mobile-section')">
														<i class="fa-solid fa-pen-to-square"></i> Edit
													</button>
												</div>
											</div>
											<div class="post clearfix" style="margin-left: -10px;"></div>
											<div class="form-section" id="mobile-section">
												<div class="form-group row">
													<label for="mobile"
														class="col-3 col-md-2 col-form-label col-form-label">Mobile</label>
													<div class="col-9 col-md-10">
														<input type="text" class="form-control" id="mobile"
															value="+91905136959" readonly>
													</div>
												</div>
												<div class="text-right">
													<div class="save-cancel-buttons mt-2">
														<button class="btn btn-primary btn-sm me-2"
															onclick="saveChanges('mobile-section')">
															<i class="fa-solid fa-floppy-disk"></i> Save
														</button>
														<button class="btn btn-secondary btn-sm"
															onclick="cancelChanges('mobile-section')">
															<i class="fa-solid fa-text-slash"></i> Cancel
														</button>
													</div>
												</div>
											</div>
										</div>
										<div class="tab-pane fade" id="address" role="tabpanel"
											aria-labelledby="specification-tab">
											<!-- Section Title -->
											<!-- Add New Address Button -->
											<a role="button" class="add-address-btn form-control"
												data-bs-toggle="modal" data-bs-target="#AddressModal"
												style="text-decoration: none;"> <i
												class="fa-solid fa-plus"></i> Add a New Address
											</a>
											<!-- Address List -->
											<div class="mt-4">
												<!-- Address Item 1 -->
												<div class="address-item small-box">

													<div class="card card-info card-outline">
														<div class="card-header  font-effect-neon"
															style="font-family: Sofia; font-size: 1.2em;">
															Default</div>
													</div>

													<input type="hidden" name="addressId" value="1">

													<div
														class="d-flex justify-content-between align-items-start">
														<div>
															<span class="badge badge-primary">HOME</span> <strong
																class="ms-2">Souvik Roy</strong>
															<p class="mt-2 mb-1 ">
																Shakuntala, Garia station road, near garia baroda prasad
																high school, Behind bhabatarini kali mandir, Kolkata,
																West Bengal - <strong>700084</strong>
															</p>
															<p class="mb-0">
																Mobile: <strong>905136959</strong>
															</p>
														</div>
														<!-- Three-Dot Dropdown -->
														<div class="dropdown">
															<button class="btn btn-group-vertical btn-sm text-reset"
																type="button" id="addressDropdown1"
																data-bs-toggle="dropdown" aria-expanded="false">
																<i class="fa-solid fa-ellipsis-vertical"></i>
															</button>
															<ul class="dropdown-menu dropdown-menu-end"
																aria-labelledby="addressDropdown1">
																<li><a class="dropdown-item text-reset" href="#"
																	data-bs-toggle="modal" data-bs-target="#AddressModal"><i
																		class="fa-solid fa-pen"></i> Edit</a></li>
																<li><a class="dropdown-item text-reset" href="#"
																	data-bs-toggle="modal"
																	data-bs-target="#deleteAddressModal"><i
																		class="fa-solid fa-trash"></i> Delete</a></li>
																<li><a class="dropdown-item text-reset"
																	type="button" onclick="makeDefaultAddress(this)"> <i
																		class="fa-solid fa-thumbtack"></i> Set as Default
																</a></li>
															</ul>
														</div>
													</div>
												</div>
												<!-- Address Item 2 -->
												<div class="address-item small-box">
													<input type="hidden" name="addressId" value="2">
													<div
														class="d-flex justify-content-between align-items-start">
														<div>
															<span class="badge badge-info">WORK</span> <strong
																class="ms-2">Debapriya Roy</strong>
															<p class="mt-2 mb-1">
																Sakuntala, Garia station road, near garia baroda prasad
																high school, Kolkata, West Bengal - <strong>700084</strong>
															</p>
															<p class="mb-0">
																Mobile: <strong>9830006387</strong>
															</p>
														</div>
														<!-- Three-Dot Dropdown -->
														<div class="dropdown">
															<button class="btn btn-group-vertical btn-sm text-reset"
																type="button" id="addressDropdown2"
																data-bs-toggle="dropdown" aria-expanded="false">
																<i class="fa-solid fa-ellipsis-vertical"></i>
															</button>
															<ul class="dropdown-menu dropdown-menu-end"
																aria-labelledby="addressDropdown2">
																<li><a class="dropdown-item" href="#"
																	data-bs-toggle="modal" data-bs-target="#AddressModal"><i
																		class="fa-solid fa-pen"></i> Edit</a></li>
																<li><a class="dropdown-item text-danger" href="#"
																	data-bs-toggle="modal"
																	data-bs-target="#deleteAddressModal"><i
																		class="fa-solid fa-trash"></i> Delete</a></li>
																<li><a class="dropdown-item text-reset"
																	type="button" onclick="makeDefaultAddress(this)"> <i
																		class="fa-solid fa-thumbtack"></i> Set as Default
																</a></li>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<!-- Edit Address Modal -->
											<div class="modal fade" id="AddressModal" tabindex="-1"
												aria-labelledby="AddressModalLabel" aria-hidden="true">
												<div class="modal-dialog modal-lg">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="editAddressModalLabel">Edit
																Address</h5>
															<button type="button" class="btn btn-sm btn-toggle"
																data-bs-dismiss="modal" aria-label="Close">
																<i class="fa-solid fa-rectangle-xmark"></i>
															</button>
														</div>
														<!-- Address Form -->
														<form id="editAddressForm" method="POST"
															action="AddressServlet">
															<div class="modal-body">
																<div class="row">
																	<!-- Form Fields -->
																	<div class="col-md-6">
																		<div class="form-group">
																			<label for="name" class="form-label">Name</label> <input
																				type="text" class="form-control" id="name"
																				name="name" placeholder="Enter full name" required>
																		</div>
																	</div>
																	<div class="col-md-6">
																		<div class="form-group">
																			<label for="mobile" class="form-label">Mobile</label>
																			<input type="text" class="form-control" id="mobile"
																				name="mobile" placeholder="10-digit mobile number"
																				required>
																		</div>
																	</div>
																	<div class="col-md-6">
																		<div class="form-group">
																			<label for="pincode" class="form-label">Pincode</label>
																			<input type="text" class="form-control" id="pincode"
																				name="pincode" placeholder="Enter pincode" required>
																		</div>
																	</div>
																	<div class="col-md-6">
																		<div class="form-group">
																			<label for="locality" class="form-label">Locality</label>
																			<input type="text" class="form-control" id="locality"
																				name="locality" placeholder="Enter locality"
																				required>
																		</div>
																	</div>
																	<div class="col-md-12">
																		<div class="form-group">
																			<label for="address" class="form-label">Address
																				(Area and Street)</label>
																			<textarea class="form-control" id="address"
																				name="address" rows="2" placeholder="Enter address"
																				required></textarea>
																		</div>
																	</div>
																	<div class="col-md-6">
																		<div class="form-group">
																			<label for="city" class="form-label">City/District/Town</label>
																			<input type="text" class="form-control" id="city"
																				name="city" placeholder="Enter city" required>
																		</div>
																	</div>
																	<div class="col-md-6">
																		<div class="form-group">
																			<label for="state" class="form-label">State</label> <select
																				id="state" name="state"
																				class="form-control form-select" required>
																				<option selected disabled>--Select State--</option>
																			</select>
																		</div>
																	</div>
																	<div class="col-md-6">
																		<div class="form-group">
																			<label for="landmark" class="form-label">Landmark
																				(Optional)</label> <input type="text" class="form-control"
																				id="landmark" name="landmark"
																				placeholder="Optional landmark">
																		</div>
																	</div>
																	<div class="col-md-6">
																		<div class="form-group">
																			<label for="alternatePhone" class="form-label">Alternate
																				Phone (Optional)</label> <input type="text"
																				class="form-control" id="alternatePhone"
																				name="alternatePhone"
																				placeholder="Optional phone number">
																		</div>
																	</div>


																	<div class="col-12">
																		<div class="form-group row">
																			<label class="col-4 col-md-2 col-form-label">Address
																				Type</label>
																			<div class="col-8 col-md-10">
																				<div class="form-check form-check-inline pt-2">
																					<input class="form-check-input" type="radio"
																						name="addressType" id="home" value="home" required>
																					<label class="form-check-label" for="home"><i
																						class="fa-solid fa-house"></i> Home </label>
																				</div>
																				<div class="form-check form-check-inline pt-2">
																					<input class="form-check-input" type="radio"
																						name="addressType" id="work" value="work">
																					<label class="form-check-label" for="work"><i
																						class="fa-solid fa-briefcase"></i> Work</label>
																				</div>
																			</div>
																		</div>
																	</div>

																</div>
															</div>
															<div class="modal-footer">
																<button type="submit" class="btn btn-primary">Save
																	Changes</button>
																<button type="button" class="btn btn-secondary"
																	data-bs-dismiss="modal">Cancel</button>
															</div>
														</form>
													</div>
												</div>
											</div>

											<!-- Delete Address Modal -->
											<div class="modal fade" id="deleteAddressModal" tabindex="-1"
												aria-labelledby="deleteAddressModalLabel" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="deleteAddressModalLabel">Confirm
																Delete</h5>
															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">Are you sure you want to
															delete this address?</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-danger">Delete</button>
															<button type="button" class="btn btn-secondary"
																data-bs-dismiss="modal">Cancel</button>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="tab-pane fade" id="role" role="tabpanel"
											aria-labelledby="permission-tab">










											<div class="row">
												<!-- Role Overview -->
												<div class="col-12">
													<div class="card">
														<div class="card-header">
															<h3 class="card-title">
																<i class="fas fa-users-cog"></i> Existing Roles
															</h3>
															<div class="card-tools">
																<button type="button" class="btn btn-tool"
																	data-card-widget="collapse">
																	<i class="fas fa-minus"></i>
																</button>
															</div>
														</div>
														<div class="card-body px-2">








															<div class="invoice p-3 mb-2">
																<!-- title row -->
																<div class="row">
																	<div class="col-12">
																		<div>
																			<span class="font-weight-bold"><i
																				class="fa-solid fa-user-secret"></i> Super Admin</span>
																		</div>
																	</div>
																	<!-- /.col -->
																</div>

																<p class="text-muted well well-sm shadow-none"
																	style="margin-top: 10px;">Unrestricted access to
																	all system features and settings</p>

																<span class="badge bg-gradient-indigo">Manage
																	Users</span> <span class="badge bg-gradient-lightblue">View
																	Reports</span> <span class="badge bg-gradient-navy">Edit
																	Products</span> <span class="badge bg-gradient-purple">Manage
																	Orders</span> <span class="badge bg-gradient-fuchsia">Manage
																	Users</span> <span class="badge bg-gradient-pink">View
																	Reports</span> <span class="badge bg-gradient-maroon">Edit
																	Products</span> <span class="badge bg-gradient-teal">Manage
																	Orders</span> <span class="badge bg-gradient-olive">Manage
																	Orders</span>

															</div>



															<div class="invoice p-3 mb-2">
																<!-- title row -->
																<div class="row">
																	<div class="col-12">
																		<div>
																			<span class="font-weight-bold"><i
																				class="fas fa-user-tie"></i> Admin</span>
																			<div class="dropdown float-right">
																				<button
																					class="btn btn-group-vertical btn-sm text-reset"
																					type="button" id="addressDropdown2"
																					data-bs-toggle="dropdown" aria-expanded="false">
																					<i class="fa-solid fa-ellipsis-vertical"></i>
																				</button>
																				<ul class="dropdown-menu dropdown-menu-end"
																					aria-labelledby="addressDropdown2">
																					<li><a class="dropdown-item text-warning"
																						href="#" data-bs-toggle="modal"
																						data-bs-target="#AddressModal"><i
																							class="fa-solid fa-pen"></i> Edit</a></li>
																					<li><a class="dropdown-item text-danger"
																						href="#" data-bs-toggle="modal"
																						data-bs-target="#deleteAddressModal"><i
																							class="fa-solid fa-trash"></i> Delete</a></li>
																				</ul>
																			</div>
																		</div>
																	</div>
																	<!-- /.col -->
																</div>

																<p class="text-muted well well-sm shadow-none"
																	style="margin-top: 10px;">Full access to manage
																	system features, but limited to operational tasks</p>

																<span class="badge badge-primary">Manage Users</span> <span
																	class="badge badge-secondary">View Reports</span> <span
																	class="badge badge-info">Edit Products</span> <span
																	class="badge badge-success">Manage Orders</span> <span
																	class="badge badge-warning">Manage Users</span> <span
																	class="badge badge-danger">View Reports</span> <span
																	class="badge bg-gradient-primary">Edit Products</span>
																<span class="badge bg-gradient-indigo">Manage
																	Orders</span>

															</div>


															<div class="invoice p-3 mb-2">
																<!-- title row -->
																<div class="row">
																	<div class="col-12">
																		<div>
																			<span class="font-weight-bold"><i
																				class="fas fa-users"></i> User</span>
																			<div class="dropdown float-right">
																				<button
																					class="btn btn-group-vertical btn-sm text-reset"
																					type="button" id="addressDropdown2"
																					data-bs-toggle="dropdown" aria-expanded="false">
																					<i class="fa-solid fa-ellipsis-vertical"></i>
																				</button>
																				<ul class="dropdown-menu dropdown-menu-end"
																					aria-labelledby="addressDropdown2">
																					<li><a class="dropdown-item text-warning"
																						href="#" data-bs-toggle="modal"
																						data-bs-target="#AddressModal"><i
																							class="fa-solid fa-pen"></i> Edit</a></li>
																					<li><a class="dropdown-item text-danger"
																						href="#" data-bs-toggle="modal"
																						data-bs-target="#deleteAddressModal"><i
																							class="fa-solid fa-trash"></i> Delete</a></li>
																				</ul>
																			</div>
																		</div>
																	</div>
																	<!-- /.col -->
																</div>

																<p class="text-muted well well-sm shadow-none"
																	style="margin-top: 10px;">Access to shop and view
																	order</p>

																<span class="badge badge-info">Place Orders</span> <span
																	class="badge badge-secondary">View Orders</span>

															</div>

															<div class="invoice p-3 mb-2">
																<!-- title row -->
																<div class="row">
																	<div class="col-12">
																		<div>
																			<span class="font-weight-bold"><i
																				class="fas fa-user-tag"></i> Other Role</span>
																			<div class="dropdown float-right">
																				<button
																					class="btn btn-group-vertical btn-sm text-reset"
																					type="button" id="addressDropdown2"
																					data-bs-toggle="dropdown" aria-expanded="false">
																					<i class="fa-solid fa-ellipsis-vertical"></i>
																				</button>
																				<ul class="dropdown-menu dropdown-menu-end"
																					aria-labelledby="addressDropdown2">
																					<li><a class="dropdown-item text-warning"
																						href="#" data-bs-toggle="modal"
																						data-bs-target="#AddressModal"><i
																							class="fa-solid fa-pen"></i> Edit</a></li>
																					<li><a class="dropdown-item text-danger"
																						href="#" data-bs-toggle="modal"
																						data-bs-target="#deleteAddressModal"><i
																							class="fa-solid fa-trash"></i> Delete</a></li>
																				</ul>
																			</div>
																		</div>
																	</div>
																	<!-- /.col -->
																</div>

																<p class="text-muted well well-sm shadow-none"
																	style="margin-top: 10px;">Manage team and inventory</p>

																<span class="badge badge-info">Place Orders</span> <span
																	class="badge badge-secondary">View Orders</span>

															</div>





														</div>
													</div>
												</div>

												<!-- Add New Role -->
												<div class="col-12">
													<div class="card collapsed-card">
														<div class="card-header">
															<h3 class="card-title">
																<i class="fas fa-plus-square"></i> Add New Role
															</h3>
															<div class="card-tools">
																<button type="button" class="btn btn-tool"
																	data-card-widget="collapse">
																	<i class="fas fa-plus"></i>
																</button>
															</div>
														</div>
														<div class="card-body">
															<form>
																<div class="form-group">
																	<label for="role-name">Role Name</label> <input
																		type="text" id="role-name" class="form-control"
																		placeholder="Enter Role Name" required>
																</div>
																<div class="form-group">
																	<label for="role-description">Description</label>
																	<textarea id="role-description" class="form-control"
																		rows="2" placeholder="Enter Description"></textarea>
																</div>
																<div class="form-group">
																	<label>Permissions</label>
																	<div class="form-check">
																		<input class="form-check-input" type="checkbox"
																			id="perm1" value="Manage Users"> <label
																			class="form-check-label" for="perm1">Manage
																			Users</label>
																	</div>
																	<div class="form-check">
																		<input class="form-check-input" type="checkbox"
																			id="perm2" value="View Reports"> <label
																			class="form-check-label" for="perm2">View
																			Reports</label>
																	</div>
																	<div class="form-check">
																		<input class="form-check-input" type="checkbox"
																			id="perm3" value="Edit Products"> <label
																			class="form-check-label" for="perm3">Edit
																			Products</label>
																	</div>
																</div>
																<button type="submit" class="btn btn-primary btn-block">
																	<i class="fas fa-save"></i> Save Role
																</button>
															</form>
														</div>
													</div>
												</div>

												<!-- Role Activity Log -->
												<div class="col-12">
													<div class="card">
														<div class="card-header">
															<h3 class="card-title">
																<i class="fas fa-history"></i> Role Management Logs
															</h3>
														</div>
														<div class="card-body">
															<ul>
																<li>Role "Admin" updated by <strong>User A</strong>
																	on 2024-11-30
																</li>
																<li>New Role "Content Manager" added by <strong>User
																		B</strong> on 2024-11-28
																</li>
															</ul>
														</div>
													</div>
												</div>
											</div>











































										</div>
									</div>
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
	<script>
         // Object to store the original values of inputs
         let originalValues = {};
         
         // Function to initialize original values on page load
         function initializeOriginalValues(sectionId) {
           const section = document.getElementById(sectionId);
           const inputs = section.querySelectorAll('.form-control, .form-check-input');
           inputs.forEach(input => {
             const inputId = input.id || input.name; // Use 'id' or 'name' as a unique identifier
             if (input.type === 'checkbox' || input.type === 'radio') {
               originalValues[inputId] = input.checked; // Store the checked state
             } else {
               originalValues[inputId] = input.value; // Store the input value
             }
           });
         }
         
         function toggleEdit(sectionId) {
           const section = document.getElementById(sectionId);
           section.classList.add('edit-mode');
         
           // Enable all inputs for editing
           const inputs = section.querySelectorAll('.form-control, .form-check-input');
           inputs.forEach(input => {
             input.removeAttribute('readonly');
             input.removeAttribute('disabled');
           });
         }
         
         function saveChanges(sectionId) {
           const section = document.getElementById(sectionId);
           section.classList.remove('edit-mode');
         
           // Save the current values as the new baseline
           const inputs = section.querySelectorAll('.form-control, .form-check-input');
           inputs.forEach(input => {
             const inputId = input.id || input.name; // Use 'id' or 'name' as a unique identifier
             if (input.type === 'checkbox' || input.type === 'radio') {
               originalValues[inputId] = input.checked; // Update stored checked state
             } else {
               originalValues[inputId] = input.value; // Update stored input value
             }
             // Disable inputs after saving
             input.setAttribute('readonly', 'readonly');
             input.setAttribute('disabled', 'disabled');
           });
         
           alert('Changes saved for '+ sectionId);
         }
         
         function cancelChanges(sectionId) {
           const section = document.getElementById(sectionId);
           section.classList.remove('edit-mode');
         
           // Revert inputs to the last saved state
           const inputs = section.querySelectorAll('.form-control, .form-check-input');
           inputs.forEach(input => {
             const inputId = input.id || input.name; // Use 'id' or 'name' as a unique identifier
             if (input.type === 'checkbox' || input.type === 'radio') {
               input.checked = originalValues[inputId]; // Restore checked state
             } else {
               input.value = originalValues[inputId]; // Restore text value
             }
             // Disable inputs after canceling
             input.setAttribute('readonly', 'readonly');
             input.setAttribute('disabled', 'disabled');
           });
         
           alert('Changes canceled for '+ sectionId);
         }
         
         // Call `initializeOriginalValues` for each section on page load
         document.addEventListener('DOMContentLoaded', () => {
           initializeOriginalValues('personal-info');
           initializeOriginalValues('gender-section');
           initializeOriginalValues('email-section');
           initializeOriginalValues('mobile-section');
         });
      </script>
	<script>
         // Function to load states from the XML file
         async function loadStatesFromXML(dropdownId) {
             try {
                 // Fetch the XML file using the Fetch API
                 const response = await fetch("components/state.xml"); // Adjust path if needed
                 if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
                 
                 const text = await response.text(); // Get the response text (XML)
                 
                 const parser = new DOMParser();
                 const xmlDoc = parser.parseFromString(text, "application/xml");
                 const stateItems = xmlDoc.getElementsByTagName("item");
                 const dropdown = document.getElementById(dropdownId); // Get the state dropdown
         
                 // Clear existing options
                 dropdown.innerHTML = '<option selected>--Select State--</option>';
         
                 // Populate the dropdown with states
                 Array.from(stateItems).forEach(item => {
                     const stateName = item.textContent.trim(); // Get the state name
                     const option = document.createElement("option");
                     option.value = stateName;
                     option.textContent = stateName;
                     dropdown.appendChild(option);
                 });
             } catch (error) {
                 console.error("Error loading states:", error);
                 alert("Unable to load states. Please try again later.");
             }
         }
         
         // Bind the event to load states when the modal opens
         document.getElementById('AddressModal').addEventListener('show.bs.modal', function () {
             loadStatesFromXML("state"); // The ID of the state dropdown in the modal
         });
      </script>
	<script>
        // Function to update the modal header dynamically
        document.addEventListener('DOMContentLoaded', function () {
            // Select the modal and modal title
            const modalTitle = document.getElementById('editAddressModalLabel');
            const addressModal = document.getElementById('AddressModal');
        
            // Event listeners for Add and Edit buttons
            document.querySelector('.add-address-btn').addEventListener('click', function () {
                modalTitle.textContent = 'Add a New Address'; // Update header text
            });
        
            document.querySelector('.dropdown-item[href="#"]').addEventListener('click', function () {
                modalTitle.textContent = 'Edit Address'; // Update header text
            });
        });
     </script>

	<script>
     function makeDefaultAddress(anchor) {
    	    // Get the parent div of the clicked anchor
    	    const addressContainer = anchor.closest('.address-item'); // Corrected class selector

    	    // Check if the address container exists
    	    if (!addressContainer) {
    	        console.error("Address container not found");
    	        return;
    	    }

    	    // Get the hidden input value (Address ID)
    	    const addressId = addressContainer.querySelector('input[name="addressId"]').value;

    	    // Create a form dynamically to send a POST request
    	    const form = document.createElement('form');
    	    form.method = 'POST';
    	    form.action = 'DBServlet?action=makeDefaultAddress';

    	    // Add the hidden input with Address ID to the form
    	    const input = document.createElement('input');
    	    input.type = 'hidden';
    	    input.name = 'addressId';
    	    input.value = addressId;
    	    form.appendChild(input);

    	    // Append the form to the body and submit it
    	    document.body.appendChild(form);
    	    form.submit();
    	}

</script>

<script>
	window.history.replaceState(null, '', window.location.pathname);

    // Use JSP to pass query parameters to JavaScript
    const message = "<%= message %>";
    const messageType = "<%= messageType %>";

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