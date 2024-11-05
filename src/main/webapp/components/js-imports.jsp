<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<script src="Scripts/myscript/JScript.js" type="text/javascript"></script>
<script src="Scripts/myscript/JScript9.js" type="text/javascript"></script>
<script src="Scripts/myscript/JScript1.js" type="text/javascript"></script>
<script src="Scripts/myscript/JScript10.js" type="text/javascript"></script>
<script src="Scripts/myscript/JScript11.js" type="text/javascript"></script>
<script src="Scripts/myscript/JScript12.js" type="text/javascript"></script>
<script src="Scripts/myscript/JScript13.js" type="text/javascript"></script>
<script src="Scripts/myscript/JScript14.js" type="text/javascript"></script>
<script src="Scripts/myscript/JScript15.js" type="text/javascript"></script>
<script src="Scripts/myscript/JScript2.js" type="text/javascript"></script>
<script src="Scripts/myscript/JScript3.js" type="text/javascript"></script>
<script src="Scripts/myscript/JScript4.js" type="text/javascript"></script>
<script src="Scripts/myscript/JScript5.js" type="text/javascript"></script>
<script src="Scripts/myscript/JScript6.js" type="text/javascript"></script>
<script src="Scripts/myscript/JScript7.js" type="text/javascript"></script>
<script src="Scripts/myscript/JScript8.js" type="text/javascript"></script>


<script defer src="FontAwesome/fontawesome-free-6.0.0/js/all.min.js"></script>


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
       if (confirm("Are you sure you want to logout?")) {
           // Redirect to logout page or handle logout logic here
           window.location.href = "LogoutServlet";
       }
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