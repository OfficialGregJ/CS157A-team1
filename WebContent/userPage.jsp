<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.FavoriteDao" %>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deep Drive - User Home</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
</head>
<body class="bg-gray-100 min-h-screen">
<jsp:include page="header.jsp" />

<main class="container mx-auto mt-8 px-4">
<!-- Displaying logged in user's username -->
    <h1 class="text-3xl font-bold mb-6">Welcome, <%= session.getAttribute("userUsername") %>!</h1>

    <!--Displaying favorites section (teams and players) -->
    <section class="bg-white rounded-lg shadow-md p-6 mb-8">
        <h2 class="text-2xl font-semibold mb-4 flex items-center">
            <i data-lucide="star" class="w-6 h-6 mr-2 text-yellow-500"></i>
            Favorites
        </h2>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div>
                <h3 class="text-xl font-semibold mb-2">Teams</h3>
                <ul class="space-y-2">
                    <%
//                     Fetches the favorite teams of the current user from FavoriteDao.java
                    String username = (String) session.getAttribute("userUsername");
                    FavoriteDao favDao = FavoriteDao.getInstance();
                    List<String> favoriteTeams = favDao.getFavoriteTeams(username); //Ensures list is not empty & contains at least 1 valid team
                    if (favoriteTeams != null && !favoriteTeams.isEmpty() && favoriteTeams.get(0) != null && !favoriteTeams.get(0).isEmpty()) { // Split the teams string into individual names
                 
                        String[] teams = favoriteTeams.get(0).split(", ");
                        for (String teamName : teams) { //Iterates through all the favorite teams & parses them
                            	String encodedTeamName = URLEncoder.encode(teamName.trim(), "UTF-8");
                    %>
<!--                     Displaying all the teams as well as an option to remove any favorites, which calls FavoritesServlet.java to update the list of favorite teams -->
		                    <li class="flex items-center">
		                        <i data-lucide="shield" class="w-5 h-5 mr-2 text-blue-500"></i>
		                        <a href="${pageContext.request.contextPath}/TeamServlet?team=<%= encodedTeamName %>" class="hover:text-blue-500"><%= teamName.trim() %></a>
		                        <form action="FavoritesServlet" method="POST" class="mx-3">
		                            <input type="hidden" name="action" value="removeTeam">
		                            <input type="hidden" name="teamName" value="<%= teamName.trim() %>">
		                            <button type="submit" class="text-red-500 hover:underline">Remove</button>
		                        </form>
		                    </li>
                    
                    <%
                       
                       }
                    } else { //Edge case: user does not have any teams favorited
                    %>
                    <li class="text-gray-500 italic">No favorite teams added yet.</li> 
                    <%
                    }
                    
                    %>
                </ul>
            </div>
            
            <div>
                <h3 class="text-xl font-semibold mb-2">Players</h3>
                <ul class="space-y-2">
                    <%
                    String password = (String) session.getAttribute("userPassword"); //Same logic as teams, fetches list of all user's favorite players using FavoriteDao.java
                    FavoriteDao favPlayerDao = FavoriteDao.getInstance();
                    List<String> favoritePlayers = favPlayerDao.getFavoritePlayers(username);
                    if (favoritePlayers != null && !favoritePlayers.isEmpty() && favoritePlayers.get(0) != null && !favoritePlayers.get(0).isEmpty()) { // Ensures list is not empty & contains at least 1 valid player
                        String[] players = favoritePlayers.get(0).split(", "); // Split the players string into individual names
                        for (String playerName : players) {
                            String encodedPlayerName = URLEncoder.encode(playerName.trim(), "UTF-8");
                    %>
                    <li class="flex items-center">
                        <i data-lucide="user" class="w-5 h-5 mr-2 text-purple-500"></i>
                        <a href="${pageContext.request.contextPath}/playerProfile?name=<%= encodedPlayerName %>" class="hover:text-blue-500"><%= playerName.trim() %></a>
                         <form action="FavoritesServlet" method="POST" class="mx-3">
                            <input type="hidden" name="action" value="removePlayer">
                            <input type="hidden" name="playerName" value="<%= playerName %>">
                            <button type="submit" class="text-red-500 hover:underline">Remove</button>
                        </form>
                    </li>
                    <%
		            	}
		        	} else { //Edge case: user has no players favorited
		        	%>
		        	<li class="text-gray-500 italic">No favorite players added yet.</li>
		        	<%
		        	}
		        	%>
                </ul>
            </div>
        </div>
    </section>

    <!-- Settings Section -->
    <section class="bg-white rounded-lg shadow-md p-6 mb-8">
    <h2 class="text-2xl font-semibold mb-4 flex items-center">
        <i data-lucide="settings" class="w-6 h-6 mr-2 text-blue-500"></i>
        Settings
    </h2>
<!--     Option for user to update their username and/or password, which calls UpdateSettingsServlet.java -->
    <form action="${pageContext.request.contextPath}/UpdateSettingsServlet" method="post" class="space-y-4">
<!--     Divs for adding and styling area for user to input updated username and/or password -->
        <div>
            <label for="username" class="block text-sm font-medium text-gray-700">Username</label>
            <input 
                type="text" 
                id="username" 
                name="username" 
                value="<%= session.getAttribute("userUsername") %>" 
                class="block w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
            <button 
                type="submit" 
                name="updateType" 
                value="username" 
                class="mt-2 px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600">
                Update
            </button>
        </div>
        <div>
            <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
            <input 
                type="password" 
                id="password" 
                name="password" 
                value="<%= session.getAttribute("userPassword") != null ? session.getAttribute("userPassword") : "" %>" 
                class="block w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-green-500">
            <button 
                type="submit" 
                name="updateType" 
                value="password" 
                class="mt-2 px-4 py-2 bg-green-500 text-white rounded hover:bg-green-600">
                Update
            </button>
        </div>
    </form>
</section>

</main>

<script>
    lucide.createIcons();
</script>
</body>
</html>
