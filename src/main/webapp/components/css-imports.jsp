<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.Cookie"%>

<%
// Check for "theme" cookie and set session variable
String theme_default = "light-mode"; // Default theme
jakarta.servlet.http.Cookie[] cookies_nav = request.getCookies();

if (cookies_nav != null) {
    for (jakarta.servlet.http.Cookie cookie : cookies_nav) {
        if ("theme".equals(cookie.getName())) {
        	theme_default = cookie.getValue();
            break;
        }
    }
}

// Set session attribute for theme
session.setAttribute("theme", theme_default);
%>



<link href="Styles/google-fonts.css" rel="stylesheet" type="text/css" />
<!-- <link href="Styles/adminlte.min.css" rel="stylesheet" type="text/css" /> -->
<!-- <link href="Styles/tempusdominus-bootstrap-4.min.css" rel="stylesheet" type="text/css" /> -->
<!-- <link href="Styles/daterangepicker.css" rel="stylesheet" type="text/css" /> -->
<!-- <link href="Styles/icheck-bootstrap.min.css" rel="stylesheet" type="text/css" /> -->
<!-- <link href="Styles/jqvmap.min.css" rel="stylesheet" type="text/css" /> -->
<!-- <link href="Styles/OverlayScrollbars.min.css" rel="stylesheet" type="text/css" /> -->
<!-- <link href="Styles/summernote-bs4.min.css" rel="stylesheet" type="text/css" /> -->
<!-- <link href="Styles/ionicons.min.css" rel="stylesheet" type="text/css" /> -->

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="FontAwesome/fontawesome-free-6.6.0/css/all.min.css">

<link rel="stylesheet" href="Styles/color-options.css">

  <!-- SweetAlert2 -->
  <link rel="stylesheet" href="plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
  <!-- Toastr -->
  <link rel="stylesheet" href="plugins/toastr/toastr.min.css">
  
    <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">


<style>
.capitalize-text {
  text-transform: capitalize;
}

/* Theme Toggle Container Positioning */
.theme-toggle-container {
    position: fixed;
    bottom: 60px;
    right: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Large Screen - Adjust Position */
@media (min-width: 992px) { /* Adjust this for the desired breakpoint */
    .theme-toggle-container {
        bottom: 30px;  /* Change to your preferred value */
    }
}


/* Theme Toggle Button Styling */
#themeToggle {
	width: 35px;
	height: 35px;
	display: flex;
	justify-content: center;
	align-items: center;
	color: #fff;
	border-radius: 50%;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
	transition: background-color 0.3s ease, transform 0.3s ease;
}

#themeToggle.light-mode {
	background-color: #4a4a4a;
	color: #000000;
}

#themeToggle.dark-mode {
	background-color: #0000000; /* Example color for dark mode */
	color: #fff;
}

/* Hover Effect with Rotation */
#themeToggle:hover {
	background-color: #6a6a6a;
	transform: rotate(30deg);
}

/* Icon Styling */
#toggleIcon {
	font-size: 16px;
	transition: transform 0.3s ease;
}

/* Sun and Moon Icon Styles */
.fa-cloud-sun {
	opacity: 1;
	transition: opacity 0.3s ease;
}

.fa-cloud-moon {
	opacity: 0;
	position: absolute;
	transition: opacity 0.3s ease;
}

/* Light Mode Icon Visibility */
.light-mode .fa-cloud-sun {
	opacity: 0;
}

.light-mode .fa-cloud-moon {
	opacity: 1;
}
</style>


<style>
/* Maintain Image Aspect Ratio for Carousel */
.carousel-img {
	aspect-ratio: 1/1; /* Square ratio for images */
	object-fit: contain; /* Ensures image is not distorted */
	width: 100%;
}

/* Thumbnails Styling for Larger Screens */
.thumbnail {
	display: flex;
	flex-direction: column;
	margin-top: 10px;
}

.thumbnail-item {
	flex: none;
	width: 100%;
	margin-bottom: 10px;
	cursor: pointer;
}

/* Custom Styling for Carousel Indicators */
.carousel-indicators {
	list-style-type: none; /* Remove default list styling */
	display: flex; /* Arrange indicators in a row */
	justify-content: center; /* Center the indicators horizontally */
	padding-left: 0; /* Remove any padding from the left */
	margin-bottom: 0; /* Remove margin below the indicators */
	margin-top: 400px;
}

.carousel-indicators li {
	width: 10px; /* Set a fixed size for each indicator */
	height: 10px; /* Set a fixed size for each indicator */
	margin: 0 5px; /* Space out the indicators */
	background-color: var(--indicator-color, #000);
	/* Default dot color for light mode */
	border-radius: 50%; /* Make the dots round */
	cursor: pointer; /* Indicate that the dots are clickable */
	transition: background-color 0.3s ease;
	/* Smooth transition for hover effect */
}

.carousel-indicators li.active {
	background-color: var(--active-indicator-color, #007bff);
	/* Active indicator color */
	transition: background-color 0.3s ease, width 0.3s ease, height 0.3s
		ease; /* Smooth transition for active state */
}

.carousel-indicators li:hover {
	background-color: var(--hover-indicator-color, #ff5722);
	/* Hover color */
}

/* Light Mode Colors */
:root {
	--indicator-color: #000; /* Black for light mode */
	--active-indicator-color: #007bff;
	/* Blue for active indicator in light mode */
	--hover-indicator-color: #ff5722;
	/* Orange for hover effect in light mode */
}

/* Dark Mode Colors */
[data-bs-theme="dark"] {
	--indicator-color: #fff; /* White for dark mode */
	--active-indicator-color: #ffc107;
	/* Yellow for active indicator in dark mode */
	--hover-indicator-color: #ff9800;
	/* Darker orange for hover in dark mode */
}

/* Product Description Scroll for Large Screens */
.scroll-vertical {
	max-height: 600px;
	overflow-y: auto;
	padding-right: 10px; /* Add padding for scrollbar */
}

/* Customize Scrollbar for Large Screens */
.scroll-vertical::-webkit-scrollbar {
	width: 5px;
}

.scroll-vertical::-webkit-scrollbar-thumb {
	background-color: #c4c4c4;
	border-radius: 10px;
}

.scroll-vertical::-webkit-scrollbar-track {
	background-color: transparent;
}

/* Responsive Adjustments for Small Screens */
@media ( max-width : 768px) {
	/* Hide Thumbnails on Small Screens */
	.thumbnail {
		display: none;
		/* display: flex; 
		flex-direction: row; 
		list-style: none; 
		margin: 0; 
		padding: 0;  */
	}

	/* Product Description Full-Length for Small Screens, no Scroll */
	.scroll-vertical {
		max-height: none;
		overflow-y: visible;
	}
	/
	* Prevent Product Description from Overlapping Tabbed Information 
     .right-side {
		margin-bottom: 10px;
		/* Ensure there's space below product description 
     }*/
		.
		tab-content
		{
		margin-top
		:
		20px;
		/* Ensure there's space between description and tabs */
	}
}
</style>

<style>
/* Custom CSS to hide scrollbar but allow scrolling */
.scrollbar-hidden {
	overflow: auto; /* Enable scrolling */
}

.scrollbar-hidden::-webkit-scrollbar {
	display: none; /* Hide scrollbar for WebKit browsers */
}

.scrollbar-hidden {
	-ms-overflow-style: none; /* Hide scrollbar in IE and Edge */
	scrollbar-width: none; /* Hide scrollbar in Firefox */
}

/* Custom scrollbar for .scrollbar-thin class */
.scrollbar-thin {
	overflow-y: auto; /* Enable vertical scrolling */
	height: 100%; /* Ensure the container takes up full height */
	scrollbar-width: thin; /* For Firefox: makes the scrollbar thin */
	scrollbar-color: #a9a9a9 transparent;
	/* For Firefox: color of thumb and track */
}

/* WebKit-based browsers (Chrome, Safari, Edge, Brave) */
.scrollbar-thin::-webkit-scrollbar {
	width: 3px; /* Thin scrollbar */
	height: 3px; /* Thin scrollbar for horizontal scrolling */
}

/* WebKit-based scrollbar button (arrows) */
.scrollbar-thin::-webkit-scrollbar-button {
	display: none; /* Hide the buttons (arrows) */
}

/* Custom styles for the scrollbar thumb (the draggable part) */
.scrollbar-thin::-webkit-scrollbar-thumb {
	background-color: #a9a9a9; /* Thumb color */
	border-radius: 3px; /* Rounded corners for the thumb */
	border: 1px solid transparent;
	/* Optional: Transparent border to enhance visual */
}

/* Thumb on hover */
.scrollbar-thin::-webkit-scrollbar-thumb:hover {
	background-color: #888; /* Thumb color on hover */
}

/* Custom scrollbar track (the background of the scrollbar) */
.scrollbar-thin::-webkit-scrollbar-track {
	background-color: transparent; /* Transparent track */
	border-radius: 3px; /* Rounded corners for the track */
	box-shadow: inset 0 0 3px grey;
	/* Subtle shadow effect for the track */
}

/* Track piece: The part of the track not covered by the thumb */
.scrollbar-thin::-webkit-scrollbar-track-piece {
	background-color: transparent; /* Transparent, no visual effect */
}

/* Corner where two scrollbars meet */
.scrollbar-thin::-webkit-scrollbar-corner {
	background-color: transparent; /* Transparent corner */
}

/* Resizer (bottom right draggable handle) */
.scrollbar-thin::-webkit-resizer {
	display: none; /* Hide the resizer handle */
}
</style>

<style>
/* Overall star rating container */
body {
	background-color: #000;
}

.star-rating {
	font-size: 1.5rem; /* Adjust star size */
	position: relative;
	display: inline-block;
}

/* Base stars (empty) */
.stars {
	color: #e0e0e0; /* Color for empty stars */
	display: flex;
	overflow: hidden;
	position: relative;
}

/* Filled stars overlay */
.stars-filled {
	color: #ccad00; /* Color for filled stars (gold) color: #FFD700;*/
	position: absolute;
	top: 0;
	left: 0;
	white-space: nowrap;
	overflow: hidden;
}

/* Each star icon (use Font Awesome or Unicode) */
.stars::before, .stars-filled::before {
	content: "✮✮✮✮✮"; /* 5 stars */
}
</style>



<style>
/* Ratings Summary */
.ratings-summary {
	text-align: center;
	margin-bottom: 20px;
}

.ratings-summary h4 {
	color: #ff9f00; /* Star color */
	margin: 0;
}

.ratings-summary p {
	font-size: 1rem;
}

/* Rating Distribution Container */
.rating-distribution {
	max-width: 400px;
	margin: 0 auto;
	padding: 15px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.rating-row {
	display: flex;
	align-items: center;
	margin-bottom: 12px;
}

.star-label {
	width: 30px;
	font-size: 1rem;
}

/* Bar Container and Rating Bars */
.bar-container {
	flex: 1; /* Ensures that the container fills available space */
	background-color: #e0e0e0;
	border-radius: 5px;
	height: 12px;
	margin: 0 10px;
	position: relative;
	overflow: hidden;
}

.bar {
	height: 100%;
	border-radius: 5px;
	transition: width 0.3s;
}

/* Colors for each rating level */
.bar[data-rating="5"] {
	background-color: #4caf50;
} /* Green */
.bar[data-rating="4"] {
	background-color: #8bc34a;
} /* Light Green */
.bar[data-rating="3"] {
	background-color: #ffeb3b;
} /* Yellow */
.bar[data-rating="2"] {
	background-color: #ff9800;
} /* Orange */
.bar[data-rating="1"] {
	background-color: #f44336;
} /* Red */

/* Count styling */
.count {
	width: 100px;
	text-align: right;
	font-size: 0.9rem;
}
</style>


<style>
/* Feature band styling */
.feature-band {
	display: flex;
	justify-content: space-around;
	flex-wrap: wrap;
	padding: 10px 0;
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
}

.feature-item {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: 5px 10px;
	font-size: 14px;
}

.feature-item i {
	font-size: 20px;
	margin-bottom: 5px;
}

.feature-item span {
	text-align: center;
	max-width: 80px;
}
</style>


<style>
/* Chrome, Safari, Edge, Opera */
.number-no-arrow::-webkit-outer-spin-button, .number-no-arrow::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

/* Firefox */
.number-no-arrow[type=number] {
	-moz-appearance: textfield;
}
</style>

<style>
/* Main Container Styling */
/*.container {
    margin: 20px;
  }*/

/* Option Labels */
/*.option-label {
    font-weight: bold;
    margin-bottom: 8px;
  }*/

/* Pattern Selection Styling */
/*.pattern-container {
    margin-bottom: 20px;
  }
  .pattern-title {
    font-weight: bold;
    margin-bottom: 10px;
  }
  .pattern-selection {
    display: flex;
    overflow-x: auto;
    gap: 10px;
    padding: 10px;
  }
  .pattern-card {
    flex: 0 0 auto;
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 10px;
    width: 150px;
    text-align: center;
    cursor: pointer;
    transition: background-color 0.3s, border-color 0.3s;
  }
  .pattern-card.selected {
    border: 2px solid teal;
    background-color: #e6f9fc;
  }
  .pattern-card .pattern-title {
    font-weight: bold;
  }
  .pattern-card .pattern-price {
    font-weight: bold;
    color: #333;
    margin-top: 5px;
  }
  .pattern-card .availability {
    font-size: 0.9em;
    color: red;
    margin-top: 8px;
  }*/

/* Color Options */
.color-options {
	display: flex;
	gap: 15px;
	align-items: center;
	margin: 10px;
}

.color-option {
	position: relative;
	width: 20px;
	height: 20px;
	border-radius: 50%;
	cursor: pointer;
	transition: border-color 0.3s;
}

.color-option input[type="radio"] {
	display: none;
}

.color-option.selected::after {
	content: '\f00c';
	font-family: 'Font Awesome 6 Free';
	font-weight: 900;
	position: absolute;
	top: 2px;
	right: 2px;
	color: white;
	font-size: 12px;
}
/* Specific Color Options */
.color-option.red {
	background-color: red;
}

.color-option.black {
	background-color: black;
}

.color-option.beige {
	background-color: #e1b899;
}

/* Main Container for Size Options */
.size-options {
	display: flex;
	gap: 12px; /* Slightly larger gap for better separation */
	align-items: center;
	margin: 10px;
}

/* Individual Size Option Styling */
.size-option {
	display: inline-flex;
	justify-content: center;
	align-items: center;
	width: 40px; /* Slightly larger for touch accessibility */
	height: 40px;
	border-radius: 50%;
	border: 2px solid grey; /* Default transparent border */
	font-weight: bold;
	cursor: pointer;
	background-color: transparent; /* Transparent by default */
	transition: color 0.3s ease, background-color 0.3s ease, border-color
		0.3s ease;
}

/* Styling When Size Option is Selected */
.size-option.selected {
	color: var(--active-indicator-color); /* Active color for selected */
	border-color: var(--active-indicator-color);
	/* Border color to indicate selection */
	background-color: rgba(0, 123, 255, 0.1);
	/* Light blue tint for selected in light mode */
}

/* Hover Effect for Both Modes */
.size-option:hover {
	color: var(--hover-indicator-color); /* Change text color on hover */
	border-color: var(--hover-indicator-color);
	/* Change border color on hover */
	background-color: rgba(255, 87, 34, 0.1);
	/* Light orange tint on hover in light mode */
	transform: scale(1.05);
}

/* Light Mode Colors */
:root {
	--indicator-color: #000; /* Black for light mode text */
	--active-indicator-color: #007bff;
	/* Blue for selected state in light mode */
	--hover-indicator-color: #ff5722;
	/* Orange for hover effect in light mode */
	--selected-background-color: rgba(0, 123, 255, 0.1);
	/* Background for selected in light mode */
}

/* Dark Mode Colors */
[data-bs-theme="dark"] {
	--indicator-color: #fff; /* White for dark mode text */
	--active-indicator-color: #ffc107;
	/* Yellow for selected state in dark mode */
	--hover-indicator-color: #ff9800;
	/* Darker orange for hover effect in dark mode */
	--selected-background-color: rgba(255, 193, 7, 0.1);
	/* Background for selected in dark mode */
}

/* Adjusted Styling for Size Option When Selected in Dark Mode */
[data-bs-theme="dark"] .size-option.selected {
	background-color: var(--selected-background-color);
	/* Yellowish tint for selected background in dark mode */
	color: var(--active-indicator-color); /* Text color on selection */
	border-color: var(--active-indicator-color);
	/* Border color for selected state */
}
</style>


<style>
/* Base Styles */
:root {
	--border-color: #ddd;
	--bg-color-hover: #f5f5f5;
	--selected-border-color: #007bff;
	--selected-bg-color: #e9f7fe;
	--scroll-button-bg: rgba(0, 0, 0, 0.3);
	--scroll-button-bg-hover: rgba(0, 0, 0, 0.6);
	--scroll-button-color: white;
}

/* Dark Theme Variables */
body.dark-mode {
	--border-color: #e9edf2;
	--bg-color-hover: #333;
	--selected-border-color: #66aaff;
	--selected-bg-color: #243447;
	--scroll-button-bg: rgba(255, 255, 255, 0.2);
	--scroll-button-bg-hover: rgba(255, 255, 255, 0.4);
	--scroll-button-color: black;
}

/* Container Styling */
.pattern-container {
	display: flex;
	align-items: center;
	overflow: hidden;
	position: relative;
	margin: 20px 0;
}

/* Patterns list */
.patterns {
	display: flex;
	gap: 20px;
	overflow-x: auto;
	white-space: nowrap;
	padding: 10px;
	scroll-behavior: smooth;
}

.patterns::-webkit-scrollbar {
	display: none;
}

.patterns {
	overflow-y: scroll; /* Enable vertical scrolling */
	-ms-overflow-style: none; /* IE and Edge */
	scrollbar-width: none; /* Firefox */
}

/* Pattern item styling */
.pattern-item {
	display: inline-block;
	text-align: center;
	padding: 15px;
	border: 1px solid var(--border-color);
	border-radius: 8px;
	transition: transform 0.3s, box-shadow 0.3s, background-color 0.3s;
	cursor: pointer;
}

.pattern-item:hover {
	transform: scale(1.05);
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	background-color: var(--bg-color-hover);
}

.pattern-name, .pattern-price {
	display: block;
}

.pattern-item.selected {
	border-color: var(--selected-border-color);
	background-color: var(--selected-bg-color);
}

/* Scroll Button Styling */
.scroll-button {
	background-color: var(--scroll-button-bg);
	color: var(--scroll-button-color);
	border: none;
	padding: 10px;
	cursor: pointer;
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	z-index: 1;
	border-radius: 50%;
	font-size: 20px;
}

.scroll-button.left {
	left: 0;
}

.scroll-button.right {
	right: 0;
}

.scroll-button:hover {
	background-color: var(--scroll-button-bg-hover);
}

.pattern-container:hover .scroll-button {
	visibility: visible;
}

.scroll-button {
	visibility: hidden;
}
</style>


<style>
/* Root Variables */
:root {
	--border-color: #ddd;
	--bg-color-hover: #f5f5f5;
	--scroll-button-bg: rgba(0, 0, 0, 0.3);
	--scroll-button-bg-hover: rgba(0, 0, 0, 0.6);
	--scroll-button-color: white;
}

/* Dark Theme Variables */
body.dark-mode {
	--border-color: #e9edf2;
	--bg-color-hover: #333;
	--scroll-button-bg: rgba(255, 255, 255, 0.2);
	--scroll-button-bg-hover: rgba(255, 255, 255, 0.4);
	--scroll-button-color: black;
}

/* Pattern Container */
.horizontal-scroll-container {
	position: relative;
	/*       margin: 20px 0; */
}

/* Horizontal Scroll Bar */
.horizontal-scroll-bar {
	display: flex;
	gap: 20px;
	overflow-x: auto;
	white-space: nowrap;
	padding: 10px 20px;
	scroll-behavior: smooth;
}

.horizontal-scroll-bar::-webkit-scrollbar {
	display: none;
}

.horizontal-scroll-bar {
	overflow-y: scroll; /* Enable vertical scrolling */
	-ms-overflow-style: none; /* IE and Edge */
	scrollbar-width: none; /* Firefox */
}

/* Pattern Item Styling */
.horizontal-scroll-item {
/* 	text-align: center; */
	padding: 15px 15px 0px 15px;
	border: 1px solid var(--border-color);
	border-radius: 8px;
	transition: transform 0.3s, box-shadow 0.3s, background-color 0.3s;
	/*       cursor: pointer; */
	flex: 0 0 auto;
	/* Ensures items are displayed in a single line on large screens */
/* 	width: 100%; /* Default full width */
white-space: normal;              /* Allows text to wrap naturally */
  overflow-wrap: break-word;        /* Breaks long words to fit */
  word-break: break-word;
}

.horizontal-scroll-item:hover {
	transform: scale(1.03);
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	background-color: var(--bg-color-hover);
}

/* Scroll Button Styling */
.horizontal-scroll-button {
	background-color: var(--scroll-button-bg);
	color: var(--scroll-button-color);
	border: none;
	padding: 10px;
	cursor: pointer;
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	z-index: 1;
	border-radius: 50%;
	font-size: 20px;
}

.horizontal-scroll-container:hover .horizontal-scroll-button {
	visibility: visible;
}

.horizontal-scroll-button {
	visibility: hidden;
}

.horizontal-scroll-button.left {
	left: 0;
}

.horizontal-scroll-button.right {
	right: 0;
}

.horizontal-scroll-button:hover {
	background-color: var(--scroll-button-bg-hover);
}

/* Responsive Adjustments */
@media ( max-width : 767px) { /* Small screens */
	.horizontal-scroll-bar {
		display: block;
		padding: 10px;
	}
	.horizontal-scroll-item {
		width: 98%;
		margin: 10px;
	}
	
	.horizontal-scroll-item p {
		font-size: 1em;
		text-align: left;
	}
	
	.horizontal-scroll-button {
		display: none; /* Hide scroll buttons on small screens */
	}
}

@media ( min-width : 768px) and (max-width: 1300px) {
	/* Medium screens */
	.horizontal-scroll-bar {
		display: grid;
		grid-template-columns: repeat(2, 1fr);
		gap: 20px;
		padding: 10px;
	}
	.horizontal-scroll-button {
		display: none; /* Hide scroll buttons on medium screens */
	}
	.horizontal-scroll-item {
		width: 100%; /* Full width for grid layout */
	}
}

@media ( min-width : 1301px) { /* Large screens */
	.horizontal-scroll-item {
		width: 24%; /* Show 4 items at a time */
	}
}
</style>

<style>
/* Text Decoration */
.text-decoration-none {
    text-decoration: none !important;
}

.text-decoration-underline {
    text-decoration: underline !important;
}

.text-decoration-overline {
    text-decoration: overline !important;
}

.text-decoration-line-through {
    text-decoration: line-through !important;
}

/* Text Decoration Thickness */
.text-decoration-thin {
    text-decoration-thickness: thin !important;
}

.text-decoration-medium {
    text-decoration-thickness: medium !important;
}

.text-decoration-thick {
    text-decoration-thickness: thick !important;
}

/* Italic and Normal Text Styles */
.fst-italic {
    font-style: italic !important;
}

.fst-normal {
    font-style: normal !important;
}

/* Underline Offset */
.text-underline-offset-small {
    text-underline-offset: 2px !important;
}

.text-underline-offset-medium {
    text-underline-offset: 4px !important;
}

.text-underline-offset-large {
    text-underline-offset: 6px !important;
}

</style>