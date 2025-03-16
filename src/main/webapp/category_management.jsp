<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="beans.CategoriesBean"%>
<%@ page import="dao.CategoriesDao"%>
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
                  <h1 class="m-0">Manage Categories</h1>
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
                           <i class="fas fa-layer-group"></i> Add Categories
                        </h3>
                     </div>
                     <form action="DBServlet" method="post">
                        <div class="card-body">
                           <!-- Hidden field for Edit/Delete -->
                           <input type="hidden" name="CategoryID" id="CategoryID">
                           <!-- Category Name -->
                           <div class="form-group">
                              <label for="CategoryName"><strong>Category
                              Name</strong></label> <input type="text" class="form-control"
                                 id="CategoryName" name="CategoryName"
                                 placeholder="Enter category name" required>
                           </div>
                           <!-- Category Description -->
                           <div class="form-group">
                              <label for="CategoryDescription"><strong>Category
                              Description</strong></label>
                              <textarea class="form-control" id="CategoryDescription"
                                 name="CategoryDescription" rows="3"
                                 placeholder="Enter a brief description"></textarea>
                           </div>
                        </div>
                        <div class="card-footer text-right">
                           <button type="submit" name="action" value="addCategory"
                              class="btn btn-success">
                           <i class="fas fa-plus-circle"></i> Add Category
                           </button>
                        </div>
                     </form>
                  </div>
                  <!-- Category List Section -->
                  <div class="card card-secondary">
                     <div class="card-header">
                        <h3 class="card-title"> <i class="fa-solid fa-table-list"></i> All Categories</h3>
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
                                 <th>Name</th>
                                 <th>Description</th>
                                 <th>Date Added</th>
                                 <th>Status</th>
                                 <th>Edit</th>
                                 <th>Delete</th>
                              </tr>
                           </thead>
                           <tbody>
                              <%
                                 CategoriesDao categoryDAO = new CategoriesDao();
                                 List<CategoriesBean> categories = categoryDAO.getAllCategories();
                                 for (CategoriesBean bean : categories) {
                                 %>
                              <tr>
                                 <td><%= bean.getCategoryName() %></td>
                                 <td><%= bean.getCategoryDescription() %></td>
                                 <td><%= new java.text.SimpleDateFormat("dd-MMM-yyyy HH:mm").format(bean.getDateAdded()) %></td>
                                 <td><%= bean.getStatus() %></td>
                                 <td class="text-center no-print"><a href="#" data-bs-toggle="modal" role="button" class="btn btn-secondary btn-sm"
                                    data-bs-target="#editModal"
                                    data-id="<%= bean.getCategoryID() %>"
                                    data-name="<%= bean.getCategoryName() %>"
                                    data-description="<%= bean.getCategoryDescription() %>"
                                    data-status="<%= bean.getStatus() %>"> <i class="fa-regular fa-pen-to-square"></i> Edit </a></td>
                                 <td class="text-center no-print"><a role="button" class="btn btn-warning btn-sm" 
                                    onclick="customConfirm('Are you sure you want to delete this item?',
                                    'This action cannot be undone.',
                                    'Yes, Delete',
                                    'No, Keep it',
                                    'DBServlet?action=deleteCategories&id=<%= bean.getCategoryID()%>')"> <i class="fa-regular fa-trash-can"></i> Delete</a>
                                 </td>
                              </tr>
                              <%
                                 }
                                 %>
                           </tbody>
                        </table>
                        <!-- Modal -->
                        <div class="modal fade" id="editModal" tabindex="-1"
                           aria-labelledby="editModalLabel" aria-hidden="true">
                           <div class="modal-dialog">
                              <div class="modal-content">
                                 <!-- Modal Header -->
                                 <div class="modal-header">
                                    <h5 class="modal-title" id="editModalLabel">Edit
                                       Category
                                    </h5>
                                    <button type="button" class="btn btn-sm btn-toggle"
                                       data-bs-dismiss="modal" aria-label="Close">
                                    <i class="fa-solid fa-rectangle-xmark"></i>
                                    </button>
                                 </div>
                                 <!-- Modal Body -->
                                 <div class="modal-body">
                                    <form id="editForm" action="DBServlet?action=editCategories"
                                       method="post">
                                       <input type="hidden" name="editCategoryID"
                                          id="editCategoryID">
                                       <!-- Category Name -->
                                       <div class="form-group">
                                          <label for="editCategoryName"><strong>Category
                                          Name</strong></label> <input type="text" class="form-control"
                                             id="editCategoryName" name="editCategoryName"
                                             placeholder="Enter category name" required>
                                       </div>
                                       <!-- Category Description -->
                                       <div class="form-group">
                                          <label for="editCategoryDescription"><strong>Category
                                          Description</strong></label>
                                          <textarea class="form-control" id="editCategoryDescription"
                                             name="editCategoryDescription" rows="3"
                                             placeholder="Enter a brief description"></textarea>
                                       </div>
                                       <!-- Category Status -->
                                       <div class="form-group row">
                                          <label for="editCategoryStatus"
                                             class="col-2 col-form-label col-form-label">Status</label>
                                          <div class="col-10">
                                             <select class="form-control" id="editCategoryStatus"
                                                name="editCategoryStatus">
                                                <option value="Active">Active</option>
                                                <option value="Inactive">Inactive</option>
                                             </select>
                                          </div>
                                       </div>
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
                                   const id = this.getAttribute('data-id');
                                   const name = this.getAttribute('data-name');
                                   const description = this.getAttribute('data-description');
                                   const status = this.getAttribute('data-status');
                           
                                   // Populate the modal fields
                                   document.getElementById('editCategoryID').value = id;
                                   document.getElementById('editCategoryName').value = name;
                                   document.getElementById('editCategoryDescription').value = description;
                                   
                                   // Set the status dropdown
                                   const statusDropdown = document.getElementById('editCategoryStatus');
                                   statusDropdown.value = status; // Pre-select the current status
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