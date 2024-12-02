<style>
    /* Ensure no spacing around the header or body */
    html, body {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    /* Styling for the header to span full width and maintain consistency */
    header {
        position: sticky; /* Ensures the header doesn't interfere with other content */
        top: 0;
        z-index: 1000;      /* Keeps the header above other elements */
        transition: height 0.3s ease, padding 0.3s ease; 
    }
    
    /* Default header size */
    header.default-size {
        height: auto;
        padding: 1rem 0; /* Normal padding */
    }

    /* Minimized header size when the menu is open */
    header.small-size {
        height: 60px; /* Adjust to your preference */
        padding: 0.5rem 0; /* Reduced padding */
    }
   
</style>

<header class="bg-blue-700 text-white py-4 w-full default-size">
    <div class="container mx-auto flex justify-between items-center px-4">
        <!-- Left Section: Logo -->
        <div class="flex items-center space-x-4">
            <i data-lucide="activity" class="w-8 h-8"></i>
            <a href="/DeepDrive/" class="text-3xl font-bold hover:underline whitespace-nowrap">Deep Drive</a>
        </div>
        
        <div class="lg:hidden">
            <button id="menu-toggle" class="focus:outline-none">
                <i data-lucide="menu" class="w-8 h-8"></i>
            </button>
        </div>
        
        <!-- Center Section: Buttons -->
        <div id="menu" class="hidden flex-col lg:flex lg:flex-row lg:space-x-6 px-4 py-2 lg:py-0 lg:bg-transparent">
            <a href="displayTeams.jsp" class="text-lg hover:underline py-2 lg:py-0">Team Info</a>
	        <a href="players.jsp" class="text-lg hover:underline py-2 lg:py-0">Player Info</a>
	        <a href="games.jsp" class="text-lg hover:underline py-2 lg:py-0">Game Info</a>
	        <a href="tournaments.jsp" class="text-lg hover:underline py-2 lg:py-0">Postseason Info</a>
	        <a href="searchPlayer.jsp" class="text-lg hover:underline py-2 lg:py-0">Search Players</a>
	        <a href="searchTeam.jsp" class="text-lg hover:underline py-2 lg:py-0">Search Teams</a>


        <!-- Right Section: Navigation -->
        
            <ul class="flex flex-col lg:flex-row lg:space-x-6 lg:items-center mt-4 lg:mt-0">
                <% 
                   String loggedInUser = (String) session.getAttribute("userUsername");
                   if (loggedInUser != null) { 
                %>
                    <li><a href="userPage.jsp" class="text-lg hover:underline py-2 lg:py-0">Dashboard</a></li>
                	<li><a href="userLogout.jsp" class="text-lg hover:underline py-2 lg:py-0">Logout</a></li>
	            <% 
	               } else { 
	            %>
	                <li><a href="userLogin.jsp" class="text-lg hover:underline py-2 lg:py-0">User Login</a></li>
	                <li><a href="adminLogin.jsp" class="text-lg hover:underline py-2 lg:py-0">Admin Login</a></li>
	                <li><a href="userSelection.jsp" class="text-lg hover:underline py-2 lg:py-0">User Register</a></li>
	            <%  
                   } 
                %>
            </ul>
        </div>
    </div>
</header>


<script src="https://unpkg.com/lucide@latest"></script>
<script>
        lucide.createIcons();
        
        // Mobile menu toggle
        const menuToggle = document.getElementById("menu-toggle")
        const menu = document.getElementById("menu")
        
        menuToggle.addEventListener("click", () => {
        	menu.classList.toggle("hidden")
        	menu.classList.toggle("flex");
        	
        	
        });
</script>
