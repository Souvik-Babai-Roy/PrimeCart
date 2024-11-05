<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// Use false to prevent creating a new session
if (request.getSession(false) == null) {
    response.sendRedirect("login.html");
    return;
}
%>
    
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <link rel="icon" href="img/title_logo.ico" type="image/ico" />
	  <%@include file="/components/css-imports.jsp"%>
   </head>
<body>
	<div>
		<div class="hold-transition sidebar-mini layout-navbar-fixed">
			<div class="wrapper">
			
			<!-- Navbar Menu Items -->
			<%@include file="/components/navbar.jsp"%>
			<jsp:include page="DBServlet" /> 
			<!-- /Navbar Menu Items -->

			<!-- Sidebar Menu Items -->
			<%@include file="/components/sidebar.jsp"%>
			<!-- /Sidebar Menu Items -->

				<!-- Content Wrapper. Contains page content -->
				<div class="content-wrapper">
					<br>

					<!-- MAIN BODY STARTS HERE -->
					<div class="content">
						<div class="container-fluid">
							<div class="card">
								<div class="card-header">
									<h4 class="mb-2 ">Hotel Information</h4>
								</div>
								<div class="card-body">
									<div class="row">
										<!-- Expected Arrivals -->
										<div class="col-md-3 col-sm-6 col-12">
											<div class="info-box bg-info">
												<span class="info-box-icon"><i
													class="fas fa-user-clock"></i></span>
												<div class="info-box-content">
													<span class="info-box-text">Expected Arrivals</span>
													<div class="progress">
														<div class="progress-bar" style="width: 100%"></div>
													</div>
													<span class="info-box-number"> <!-- Dynamic value from servlet -->
														${hotelArrivals}
													</span> <span style="font-style: italic">Today's
														Reservation Arrivals</span>
												</div>
											</div>
										</div>
										<!-- Expected Departures -->
										<div class="col-md-3 col-sm-6 col-12">
											<div class="info-box bg-success">
												<span class="info-box-icon"><i
													class="fas fa-person-walking-luggage"></i></span>
												<div class="info-box-content">
													<span class="info-box-text">Expected Departures</span>
													<div class="progress">
														<div class="progress-bar" style="width: 100%"></div>
													</div>
													<span class="info-box-number"> <!-- Dynamic value from servlet -->
														${hotelCheckIn}
													</span> <span style="font-style: italic">Today's Scheduled
														Check Out</span>
												</div>
											</div>
										</div>
										<!-- Today's Check In -->
										<div class="col-md-3 col-sm-6 col-12">
											<div class="info-box bg-warning">
												<span class="info-box-icon"><i
													class="fas fa-person-circle-check"></i></span>
												<div class="info-box-content">
													<span class="info-box-text">Today's Check In</span>
													<div class="progress">
														<div class="progress-bar" style="width: 100%"></div>
													</div>
													<span class="info-box-number"> ${checkInCount} </span> <span
														style="font-style: italic">Today's Total Number of
														Check-in</span>
												</div>
											</div>
										</div>
										<!-- Today's Checked Out -->
										<div class="col-md-3 col-sm-6 col-12">
											<div class="info-box bg-danger">
												<span class="info-box-icon"><i
													class="fas fa-person-circle-xmark"></i></span>
												<div class="info-box-content">
													<span class="info-box-text">Today's Checked Out</span>
													<div class="progress">
														<div class="progress-bar" style="width: 100%"></div>
													</div>
													<span class="info-box-number"> ${checkOutCount} </span> <span
														style="font-style: italic">Today's Total Number of
														Check-out</span>
												</div>
											</div>
										</div>
										<!-- Inhouse Rooms -->
										<div class="col-md-3 col-sm-6 col-12">
											<div class="info-box bg-indigo">
												<span class="info-box-icon"><i
													class="fas fa-people-roof"></i></span>
												<div class="info-box-content">
													<span class="info-box-text">Inhouse Rooms</span>
													<div class="progress">
														<div class="progress-bar" style="width: 100%"></div>
													</div>
													<span class="info-box-number"> ${activeRooms} </span> <span
														style="font-style: italic">Number of Active Rooms</span>
												</div>
											</div>
										</div>
										<!-- Rooms to Sell -->
										<div class="col-md-3 col-sm-6 col-12">
											<div class="info-box bg-blue">
												<span class="info-box-icon"><i
													class="fas fa-house-flag"></i></span>
												<div class="info-box-content">
													<span class="info-box-text">Rooms to Sell</span>
													<div class="progress">
														<div class="progress-bar" style="width: 100%"></div>
													</div>
													<span class="info-box-number"> ${availableRooms} </span> <span
														style="font-style: italic">Number of Available
														Rooms</span>
												</div>
											</div>
										</div>
										<!-- Reserved Rooms -->
										<div class="col-md-3 col-sm-6 col-12">
											<div class="info-box bg-lightblue">
												<span class="info-box-icon"><i
													class="fas fa-house-circle-exclamation"></i></span>
												<div class="info-box-content">
													<span class="info-box-text">Reserved Rooms</span>
													<div class="progress">
														<div class="progress-bar" style="width: 100%"></div>
													</div>
													<span class="info-box-number"> ${reservedRooms} </span> <span
														style="font-style: italic">Number of Reserved Rooms</span>
												</div>
											</div>
										</div>
										<!-- Blocked Rooms -->
										<div class="col-md-3 col-sm-6 col-12">
											<div class="info-box bg-fuchsia">
												<span class="info-box-icon"><i
													class="fas fa-house-lock"></i></span>
												<div class="info-box-content">
													<span class="info-box-text">Blocked Rooms</span>
													<div class="progress">
														<div class="progress-bar" style="width: 100%"></div>
													</div>
													<span class="info-box-number"> ${blockedRooms} </span> <span
														style="font-style: italic">Number of Blocked Rooms</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- MAIN BODY ENDS HERE -->

				</div>
				<!-- /.content-wrapper -->
				<br /> <br />
			</div>
		</div>
	</div>


	<%@include file="/components/js-imports.jsp"%>
</body>

</html>