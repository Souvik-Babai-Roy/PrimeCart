<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- Footer -->
<%
 if ("Admin".equals((String) session.getAttribute("userType"))){
%>

<footer
	class="main-footer d-block d-md-none fixed-bottom bg-light text-center py-2">
	<div class="d-flex justify-content-around">
		<a href="<%= (String) session.getAttribute("homePath") %>"
			class="nav-link text-primary"> <i class="fas fa-home"></i> <span>Home</span>
		</a> <a href="reports.jsp" class="nav-link text-info"> <i
			class="nav-icon fas fa-file-alt"></i> <span>Reports</span>
		</a> <a href="account.jsp" class="nav-link text-danger"> <i
			class="fas fa-user"></i> <span>Account</span>
		</a>
	</div>
</footer>

<%} else{ %>
<footer
	class="main-footer d-block d-md-none fixed-bottom bg-light text-center py-2">
	<div class="d-flex justify-content-around">
		<a href="<%= (String) session.getAttribute("homePath") %>"
			class="nav-link text-primary"> <i class="fas fa-home"></i> <span>Home</span>
		</a> <a href="notifications.jsp" class="nav-link text-info"> <i
			class="fas fa-bell"></i> <span>Notifications</span>
		</a> <a href="account.jsp" class="nav-link text-danger"> <i
			class="fas fa-user"></i> <span>Account</span>
		</a>
	</div>
</footer>
<% } %>