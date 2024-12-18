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
            <% 
                // Check if a user or admin is logged in
                String loggedInUser = (String) session.getAttribute("userUsername");
                String loggedInAdmin = (String) session.getAttribute("adminUsername");

                if (loggedInAdmin != null) {
                    // Admin-specific navigation
            %>
                <a href="adminPage.jsp" class="text-lg hover:underline py-2 lg:py-0">Admin Dashboard</a>
                <a href="manageUsers.jsp" class="text-lg hover:underline py-2 lg:py-0">Manage Users</a>
                <a href="manageTeams.jsp" class="text-lg hover:underline py-2 lg:py-0">Manage Teams</a>
                <a href="manageTournaments.jsp" class="text-lg hover:underline py-2 lg:py-0">Manage Tournaments</a>
                <a href="managePlayer.jsp" class="text-lg hover:underline py-2 lg:py-0">Manage Players</a>
                <a href="manageGames.jsp" class="text-lg hover:underline py-2 lg:py-0">Manage Games</a>
                <a href="userLogout.jsp" class="text-lg hover:underline py-2 lg:py-0">Logout</a>
            <% 
                } else if (loggedInUser != null) { 
                    // User-specific navigation
            %>
                <a href="displayTeams.jsp" class="text-lg hover:underline py-2 lg:py-0">Team Info</a>
                <a href="players.jsp" class="text-lg hover:underline py-2 lg:py-0">Player Info</a>
                <a href="games.jsp" class="text-lg hover:underline py-2 lg:py-0">Game Info</a>
                <a href="tournaments.jsp" class="text-lg hover:underline py-2 lg:py-0">Postseason Info</a>
                <a href="userPage.jsp" class="text-lg hover:underline py-2 lg:py-0">Dashboard</a>
                <a href="userLogout.jsp" class="text-lg hover:underline py-2 lg:py-0">Logout</a>
            <% 
                } else { 
                    // Default navigation for unauthenticated users
            %>
                <a href="userLogin.jsp" class="text-lg hover:underline py-2 lg:py-0">User Login</a>
                <a href="adminLogin.jsp" class="text-lg hover:underline py-2 lg:py-0">Admin Login</a>
                <a href="userSelection.jsp" class="text-lg hover:underline py-2 lg:py-0">Register</a>
            <% 
                } 
            %>
        </div>
    </div>
</header>

<script src="https://unpkg.com/lucide@latest"></script>
<script>
    lucide.createIcons();

    // Mobile menu toggle
    const menuToggle = document.getElementById("menu-toggle");
    const menu = document.getElementById("menu");

    menuToggle.addEventListener("click", () => {
        menu.classList.toggle("hidden");
        menu.classList.toggle("flex");
    });
</script>



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
