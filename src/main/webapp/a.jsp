<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Product Management</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/custom-styles.css">
    <style>
        .form-section {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container-fluid mt-4">
    <h3 class="text-center mb-4">Product Management</h3>

    <!-- Add Product Button -->
    <div class="text-right mb-3">
        <button class="btn btn-primary" data-toggle="modal" data-target="#productModal">
            <i class="fas fa-plus"></i> Add Product
        </button>
    </div>

    <!-- Product Table -->
    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>#</th>
                    <th>Product Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Stock</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // Replace this with your actual database logic
                    List<Product> products = ProductDAO.getAllProducts();
                    for (int i = 0; i < products.size(); i++) {
                        Product product = products.get(i);
                %>
                <tr>
                    <td><%= i + 1 %></td>
                    <td><%= product.getName() %></td>
                    <td><%= product.getCategory() %></td>
                    <td>₹<%= product.getPrice() %></td>
                    <td><%= product.getStock() %></td>
                    <td>
                        <button class="btn btn-sm btn-info edit-btn" data-id="<%= product.getId() %>">
                            <i class="fas fa-edit"></i> Edit
                        </button>
                        <button class="btn btn-sm btn-danger delete-btn" data-id="<%= product.getId() %>">
                            <i class="fas fa-trash"></i> Delete
                        </button>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

<!-- Add/Edit Product Modal -->
<div class="modal fade" id="productModal" tabindex="-1" role="dialog" aria-labelledby="productModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <form action="ProductController" method="post" id="productForm" enctype="multipart/form-data">
                <div class="modal-header">
                    <h5 class="modal-title" id="productModalLabel">Add Product</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="productId" id="productId">

                    <!-- Product Details Section -->
                    <div class="form-section">
                        <h6 class="text-primary">Product Details</h6>
                        <div class="form-group">
                            <label for="productName">Product Name <span class="text-danger">*</span></label>
                            <input type="text" name="productName" id="productName" class="form-control" required placeholder="Enter product name">
                        </div>
                        <div class="form-group">
                            <label for="productDescription">Description</label>
                            <textarea name="productDescription" id="productDescription" class="form-control" rows="3" placeholder="Enter product description"></textarea>
                        </div>
                    </div>

                    <!-- Category and Attributes Section -->
                    <div class="form-section">
                        <h6 class="text-primary">Category & Attributes</h6>
                        <div class="form-group">
                            <label for="category">Category <span class="text-danger">*</span></label>
                            <select name="category" id="category" class="form-control" required>
                                <option value="">Select Category</option>
                                <option value="Electronics">Electronics</option>
                                <option value="Clothing">Clothing</option>
                                <option value="Home Appliances">Home Appliances</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="brand">Brand</label>
                            <input type="text" name="brand" id="brand" class="form-control" placeholder="Enter brand">
                        </div>
                    </div>

                    <!-- Pricing Section -->
                    <div class="form-section">
                        <h6 class="text-primary">Pricing & Stock</h6>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="price">Price (₹) <span class="text-danger">*</span></label>
                                <input type="number" name="price" id="price" class="form-control" required placeholder="Enter price">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="stock">Stock <span class="text-danger">*</span></label>
                                <input type="number" name="stock" id="stock" class="form-control" required placeholder="Enter stock quantity">
                            </div>
                        </div>
                    </div>

                    <!-- Image Upload Section -->
                    <div class="form-section">
                        <h6 class="text-primary">Product Images</h6>
                        <div class="form-group">
                            <label for="productImage">Upload Image</label>
                            <input type="file" name="productImage" id="productImage" class="form-control-file">
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Save Product</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script>
    // Prefill modal for editing a product
    $(document).on('click', '.edit-btn', function() {
        const productId = $(this).data('id');
        // Fetch product details via AJAX or prefill from the table
        $.ajax({
            url: 'ProductController',
            method: 'GET',
            data: { action: 'get', id: productId },
            success: function(product) {
                $('#productModalLabel').text('Edit Product');
                $('#productId').val(product.id);
                $('#productName').val(product.name);
                $('#productDescription').val(product.description);
                $('#category').val(product.category);
                $('#brand').val(product.brand);
                $('#price').val(product.price);
                $('#stock').val(product.stock);
                $('#productModal').modal('show');
            }
        });
    });

    // Reset modal on close
    $('#productModal').on('hidden.bs.modal', function() {
        $('#productForm')[0].reset();
        $('#productId').val('');
        $('#productModalLabel').text('Add Product');
    });
</script>
</body>
</html>
