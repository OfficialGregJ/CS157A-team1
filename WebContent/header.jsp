<style>
    /* Ensure no spacing around the header or body */
    html, body {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    /* Styling for the header to span full width and maintain consistency */
    header {
        position: relative; /* Ensures the header doesn't interfere with other content */
        z-index: 1000;      /* Keeps the header above other elements */
    }
</style>

<header class="bg-blue-700 text-white py-4 w-full">
    <div class="container mx-auto flex justify-between items-center px-8">
        <!-- Left Section: Logo -->
        <div class="flex items-center space-x-4">
            <i data-lucide="activity" class="w-8 h-8"></i>
            <a href="/DeepDrive/" class="text-3xl font-bold hover:underline whitespace-nowrap">Deep Drive</a>
        </div>
        
        <!-- Center Section: Buttons -->
        <div class="flex-1 flex justify-center space-x-6">
            <a href="displayTeams.jsp" class="text-lg hover:underline">Team Info</a>
            <a href="players.jsp" class="text-lg hover:underline">Player Info</a>
            <a href="games.jsp" class="text-lg hover:underline">Game Info</a>
            <a href="searchPlayer.jsp" class="text-lg hover:underline">Search Players</a>
            <a href="searchTeam.jsp" class="text-lg hover:underline">Search Teams</a>
        </div>

        <!-- Right Section: Navigation -->
        <nav>
            <ul class="flex space-x-6">
                <% 
                   String loggedInUser = (String) session.getAttribute("userUsername");
                   if (loggedInUser != null) { 
                %>
                    <li><a href="userPage.jsp" class="text-lg hover:underline">Dashboard</a></li>
                    <li><a href="userLogout.jsp" class="text-lg hover:underline">Logout</a></li>
                <% 
                   } else { 
                %>
                    <li><a href="userLogin.jsp" class="text-lg hover:underline">User Login</a></li>
                    <li><a href="adminLogin.jsp" class="text-lg hover:underline">Admin Login</a></li>
                    <li><a href="userSelection.jsp" class="text-lg hover:underline">Register</a></li>
                <% 
                   } 
                %>
            </ul>
        </nav>
    </div>
</header>


<script src="https://unpkg.com/lucide@latest"></script>
<script>
        lucide.createIcons();
</script>
