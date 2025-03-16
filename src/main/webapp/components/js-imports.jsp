<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>

<!-- jQuery UI -->
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>

<!-- Bootstrap Bundle (Local) -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- ChartJS -->
<script src="plugins/chart.js/Chart.min.js"></script>

<!-- Sparkline -->
<script src="plugins/sparklines/sparkline.js"></script>

<!-- JQVMap -->
<script src="plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>

<!-- jQuery Knob Chart -->
<script src="plugins/jquery-knob/jquery.knob.min.js"></script>

<!-- Daterangepicker -->
<script src="plugins/moment/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>

<!-- Tempusdominus Bootstrap 4 -->
<script
	src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>

<!-- Summernote -->
<script src="plugins/summernote/summernote-bs4.min.js"></script>

<!-- overlayScrollbars -->
<script
	src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>

<!-- SweetAlert2 -->
<script src="plugins/sweetalert2/sweetalert2.min.js"></script>

<!-- Toastr -->
<script src="plugins/toastr/toastr.min.js"></script>

<!-- Font Awesome -->
<script defer src="FontAwesome/fontawesome-free-6.0.0/js/all.min.js"></script>

<!-- AdminLTE App (Local) -->
<script src="dist/js/adminlte.js"></script>

<!-- AdminLTE Dashboard Demo -->
<script src="dist/js/pages/dashboard2.js"></script>

<!-- dropzonejs -->
<script src="plugins/dropzone/min/dropzone.min.js"></script>













<script type="text/javascript">
   function cancelclick() {
      alert("You clicked Cancel!");
   }
</script>
<script>
   $.widget.bridge('uibutton', $.ui.button)
</script>
<script>
   function myFunction(x) {
      x.classList.toggle("fa-minimize");
   }
</script>
<script>
   function confirmLogout() {
	   
	   Swal.fire({
		    title: "Are you sure you want to logout?",
		    icon: "warning",
		    showDenyButton: true,
		    confirmButtonText: "Yes, Logout",
		    denyButtonText: "No, Stay Logged In",
		    confirmButtonColor: "#d33", // Custom color for confirm button
		    denyButtonColor: "#3085d6" // Custom color for deny button
		}).then((result) => {
		    if (result.isConfirmed) {
		        window.location.href = "LogoutServlet";
		    } else if (result.isDenied) {
		    	Swal.fire({
		    	    icon: 'info',
		    	    toast: true,
		    	    position: 'top-end',
		    	    title: "Session Active: Logout Action Canceled",
		    	    showConfirmButton: false,
		    	    timer: 3000,
		    	    timerProgressBar: true, // Adds a progress bar for visual feedback
		    	});

		    }
		});
}

</script>

<script>
   // Generalized confirm function
   function customConfirm(title, text, confirmText, denyText, confirmAction) {
        Swal.fire({
            title: title || "Are you sure?",
            text: text || "Are you sure you want to proceed?",
            icon: "warning",
            showDenyButton: true,
            confirmButtonText: confirmText || "Yes",
            denyButtonText: denyText || "No",
            confirmButtonColor: "#d33",  // Custom color for confirm button
            denyButtonColor: "#3085d6",  // Custom color for deny button
        }).then((result) => {
            if (result.isConfirmed) {
                if (typeof confirmAction === "function") {
                    confirmAction(); // Execute the passed confirmAction function
                } else {
                    window.location.href = confirmAction || "#"; // Default action if no function is passed
                }
            } else if (result.isDenied) {
                Swal.fire({
                    icon: 'info',
                    toast: true,
                    position: 'top-end',
                    title: "Action Canceled",
                    showConfirmButton: false,
                    timer: 3000,
                    timerProgressBar: true, // Adds a progress bar for visual feedback
                });
            }
        });
    }
</script>



<!-- JavaScript for Show More/Show Less functionality -->
<script>
    function toggleCategories() {
        const hiddenItems = document.querySelectorAll(".extra-category");
        const toggleText = document.getElementById("toggleText");

        hiddenItems.forEach(item => {
            // Toggle display style directly
            item.style.display = item.style.display === "none" ? "block" : "none";
        });

        // Update the button text
        toggleText.textContent = toggleText.textContent === "Show All" ? "Show Less" : "Show All";
    }
</script>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
// Theme toggle script
document.addEventListener('DOMContentLoaded', () => {
    applySavedTheme(); // Apply theme based on cookie upon loading
});

const themeToggle = document.getElementById('themeToggle');
const bodyElement = document.body;
const toggleIcon = document.getElementById('toggleIcon');
const navbar = document.getElementById('navbar');
const sidebar = document.getElementById('sidebar');

// Event listener for the theme toggle button
themeToggle.addEventListener('click', function (event) {
    event.preventDefault();
    const isLightMode = bodyElement.classList.contains('light-mode');

    // Toggle theme and set cookie
    if (isLightMode) {
        switchToDarkMode();
        document.cookie = "theme=dark-mode;expires=" + getExpiryDate() + ";path=/";
    } else {
        switchToLightMode();
        document.cookie = "theme=light-mode;expires=" + getExpiryDate() + ";path=/";
    }

    updateTheme(); // Update visual elements
    reloadNavbar(); // Reload navbar after theme toggle
});

// Functions for theme toggling
function applySavedTheme() {
    const themeCookie = document.cookie.split('; ').find(row => row.startsWith('theme='));
    const themeValue = themeCookie ? themeCookie.split('=')[1] : 'light-mode';

    // Set theme based on cookie or default
    if (themeValue === 'dark-mode') {
        switchToDarkMode();
    } else {
        switchToLightMode();
    }

    updateTheme(); // Apply theme styles to UI components
   
}

// Helper to switch to dark mode
function switchToDarkMode() {
    bodyElement.classList.remove('light-mode');
    bodyElement.classList.add('dark-mode');
}

// Helper to switch to light mode
function switchToLightMode() {
    bodyElement.classList.remove('dark-mode');
    bodyElement.classList.add('light-mode');
}

// Get expiry date for cookie (7 days from now)
function getExpiryDate() {
    return new Date(new Date().getTime() + 7 * 24 * 60 * 60 * 1000).toUTCString();
}

// Update the theme icon and styles for navbar, sidebar, etc.
function updateTheme() {
    const isDarkMode = bodyElement.classList.contains('dark-mode');

    toggleIcon.classList.replace(isDarkMode ? 'fa-cloud-moon' : 'fa-cloud-sun', isDarkMode ? 'fa-cloud-sun' : 'fa-cloud-moon');
    themeToggle.style.backgroundColor = isDarkMode ? '#ffffff' : '#000000';
    themeToggle.style.color = isDarkMode ? '#000000' : '#ffffff';

    navbar.classList.toggle('navbar-dark', isDarkMode);
    navbar.classList.toggle('navbar-light', !isDarkMode);

    sidebar.classList.toggle('sidebar-dark-primary', isDarkMode);
    sidebar.classList.toggle('sidebar-light-blue', !isDarkMode);
}

// Reload navbar using jQuery
function reloadNavbar() {
    // Reload the navbar.jsp inside the container using jQuery's load method
//     $('#navbar-reload').load('components/navbar.jsp');
    window.location.reload()
}
</script>


<script>
// Function to toggle button styles based on the theme
function toggleButtonTheme() {
  const buttons = document.querySelectorAll('.btn-toggle'); // Select all buttons with class 'btn-toggle'

  // Get the 'theme' value from the cookie
  const themeCookie = document.cookie.split('; ').find(row => row.startsWith('theme='));
  const themeValue = themeCookie ? themeCookie.split('=')[1] : 'light-mode'; // Default to 'light-mode' if cookie is not set

  // Check if the 'theme' is dark mode
  const isDarkMode = themeValue === 'dark-mode';

  // Loop through all buttons with the 'btn-toggle' class
  buttons.forEach(button => {
    if (isDarkMode) {
        // If light mode, apply btn-outline-light
        button.classList.remove('btn-outline-dark');
        button.classList.add('btn-outline-light');
      
    } else {
    	// If dark mode, apply btn-outline-dark
        button.classList.remove('btn-outline-light');
        button.classList.add('btn-outline-dark');
    }
  });
}

// Initial theme check on page load
document.addEventListener('DOMContentLoaded', toggleButtonTheme);
</script>


<script>
  document.querySelectorAll(".color-option").forEach(color => {
  color.addEventListener("click", () => {
    document.querySelectorAll(".color-option").forEach(c => c.classList.remove("selected"));
    color.classList.add("selected");

    // Get the selected color value from the radio button
    const selectedColor = color.querySelector('input[type="radio"]:checked').value;

    // Update the color name display
    document.getElementById("colourName").textContent = selectedColor;
  });
});

//Toggle selected state for size options
  document.querySelectorAll(".size-option").forEach(size => {
    size.addEventListener("click", () => {
      document.querySelectorAll(".size-option").forEach(s => s.classList.remove("selected"));
      size.classList.add("selected");

      const sizeName = size.innerText;  // Corrected this line to directly access innerText of the size
      document.getElementById("sizeName").innerText = sizeName;
    });
  });

</script>


<script>
// Scroll function for the pattern container
function scrollPatterns(direction) {
  const container = document.querySelector('.patterns');
  const scrollAmount = 200; // Change this value to adjust scroll speed

  if (direction === 'left') {
    container.scrollBy({ left: -scrollAmount, behavior: 'smooth' });
  } else {
    container.scrollBy({ left: scrollAmount, behavior: 'smooth' });
  }
}

// Select a pattern and highlight it
function selectPattern(item) {
  // Deselect all items
  const items = document.querySelectorAll('.pattern-item');
  items.forEach((el) => el.classList.remove('selected'));
  
  // Select the clicked item
  item.classList.add('selected');
  
  // Update the label
  const patternName = item.querySelector('.pattern-name').innerText;
  document.getElementById('selectedPatternName').innerText = patternName;
}

// Set default selection on page load
window.onload = function() {
  const defaultPattern = document.querySelector('.pattern-item');
  selectPattern(defaultPattern);
}
</script>

<script>
// Scroll function for the pattern container
function scrollHorizontal(scrollbarId, direction) {
	const container = document
			.getElementById(scrollbarId);
	const scrollAmount = 200; // Adjust as needed for scroll speed

	if (direction === 'left') {
		container.scrollBy({
			left : -scrollAmount,
			behavior : 'smooth'
		});
	} else {
		container.scrollBy({
			left : scrollAmount,
			behavior : 'smooth'
		});
	}
}
</script>

<script>




</script>