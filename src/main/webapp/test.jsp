<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Product Images</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* Styling the dropzone area */
        .dropzone {
            border: 2px dashed #007bff;
            border-radius: 5px;
            padding: 20px;
            text-align: center;
            cursor: pointer;
            background-color: #f8f9fa;
        }

        .dropzone.hover {
            background-color: #e2e6ea;
        }

        .image-preview {
            display: flex;
            flex-wrap: wrap;
        }

        .image-preview .card {
            margin: 10px;
            max-width: 200px;
        }

        .deleteBtn {
            width: 100%;
        }

        .custom-control-label {
            font-size: 12px;
        }
    </style>
</head>
<body>

<div class="card">
    <div class="card-header">
        <h3 class="card-title">Product Images</h3>
    </div>
    <div class="card-body">
        <!-- Dropzone Area -->
        <div id="dropzone" class="dropzone">
            <p>Drag and drop your images here or click to select</p>
        </div>
        
        <!-- Preview Images Section -->
        <div id="imagePreviewContainer" class="image-preview mt-3">
            <!-- Dynamic Image Previews will appear here -->
        </div>

        <!-- Upload and Delete Buttons -->
        <form id="imageUploadForm" enctype="multipart/form-data">
            <button type="submit" class="btn btn-primary" id="uploadAllBtn">Upload All</button>
            <button type="button" class="btn btn-danger" id="deleteAllBtn">Delete All</button>
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
$(document).ready(function () {
    let imageCount = 0;  // Track the number of images added
    const imagePreviewContainer = $('#imagePreviewContainer');
    const dropzone = $('#dropzone');

    // Handle drag over and drag leave events for visual feedback
    dropzone.on('dragover', function () {
        dropzone.addClass('hover');
    }).on('dragleave', function () {
        dropzone.removeClass('hover');
    });

    // Handle file drop event
    dropzone.on('drop', function (e) {
        e.preventDefault();
        dropzone.removeClass('hover');
        const files = e.originalEvent.dataTransfer.files;
        handleFileSelection(files);
    });

    // Handle file selection by clicking on the dropzone
    dropzone.on('click', function () {
        $('<input type="file" multiple>').click().on('change', function (e) {
            const files = e.target.files;
            handleFileSelection(files);
        });
    });

    // Function to handle selected files (from drag or click)
    function handleFileSelection(files) {
        if (files.length > 0) {
            for (let i = 0; i < files.length; i++) {
                const file = files[i];

                // Log file details
                console.log('Processing file:', file);

                // Validate file type
                if (!file.type.startsWith('image/')) {
                    alert('Please select a valid image file (JPEG, PNG, etc.)');
                    continue;
                }

                // Validate file size
                if (file.size === 0) {
                    alert('Invalid or empty file selected.');
                    continue;
                }

                const reader = new FileReader();

                reader.onload = function (e) {
                    const imgSrc = e.target.result;

                    // Log FileReader result
                    console.log('FileReader result:', imgSrc);

                    const existingImages = $('#imagePreviewContainer img');
                    let isDuplicate = false;

                    // Check for duplicates
                    existingImages.each(function () {
                        if ($(this).attr('src') === imgSrc) {
                            isDuplicate = true;
                            return false;
                        }
                    });

                    if (!isDuplicate) {
                        imageCount++;
                        const imagePreview = $(`
                            <div class="col-md-3 mb-3" id="image_${imageCount}">
                                <div class="card">
                                    <img src="${imgSrc}" class="card-img-top img-fluid img-thumbnail" alt="Product Image">
                                    <div class="card-body">
                                        <button class="btn btn-danger btn-sm deleteBtn" data-id="image_${imageCount}">Remove</button>
                                        <div class="custom-control custom-switch mt-2">
                                            <input type="checkbox" class="custom-control-input" id="coverImage_${imageCount}">
                                            <label class="custom-control-label" for="coverImage_${imageCount}">Set as Cover Image</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        `);
                        $('#imagePreviewContainer').append(imagePreview);

                        // Remove specific image
                        $(imagePreview).find('.deleteBtn').click(function () {
                            $(this).closest('.col-md-3').remove();
                        });

                        // Handle cover image toggle
                        $(`#coverImage_${imageCount}`).change(function () {
                            if ($(this).prop('checked')) {
                                $('.custom-control-input').not(this).prop('checked', false);
                            }
                        });
                    } else {
                        alert('This image is already added.');
                    }
                };

                // Read file as data URL
                reader.readAsDataURL(file);
            }
        }
    }

    // Handle Upload All Button (sending form data to the servlet)
    $('#uploadAllBtn').click(function (e) {
        e.preventDefault();

        const formData = new FormData($('#imageUploadForm')[0]);

        $.ajax({
            url: 'ImageUploadServlet',  // Change this to your servlet path
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            success: function(response) {
                alert('Images uploaded successfully!');
                console.log(response);
            },
            error: function(error) {
                alert('Error uploading images!');
                console.log(error);
            }
        });
    });

    // Handle Delete All Button
    $('#deleteAllBtn').click(function () {
        imagePreviewContainer.empty();  // Remove all image previews
    });
});
</script>

</body>
</html>
