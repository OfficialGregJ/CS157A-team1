<%@ page import="java.util.List" %>
<%@ page import="com.GamesDao" %>

<%
    GamesDao gamesDao = new GamesDao();
    List<String> games = gamesDao.getAllGames(); // Fetch all games
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Manage Games</title>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto p-4">
        <!-- Page Header -->
        <div class="flex justify-between items-center mb-6">
            <h1 class="text-3xl font-bold text-gray-800">Manage Games</h1>
            <a href="index.jsp" class="bg-gray-800 text-white px-4 py-2 rounded hover:bg-gray-700">Back to Home</a>
        </div>

        <!-- Add Game Form -->
        <div class="bg-white p-6 rounded-lg shadow-md mb-6">
            <h2 class="text-xl font-semibold text-gray-800 mb-4">Add a New Game</h2>
            <form action="AddGameServlet" method="post" class="space-y-4">
                <div>
                    <label for="date" class="block text-gray-700">Date</label>
                    <input type="date" name="date" id="date" required class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="team1" class="block text-gray-700">Team 1</label>
                    <input type="text" name="team1" id="team1" required class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="team2" class="block text-gray-700">Team 2</label>
                    <input type="text" name="team2" id="team2" required class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="winner" class="block text-gray-700">Winner</label>
                    <input type="text" name="winner" id="winner" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="loser" class="block text-gray-700">Loser</label>
                    <input type="text" name="loser" id="loser" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="location" class="block text-gray-700">Location</label>
                    <input type="text" name="location" id="location" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="videoUrl" class="block text-gray-700">Video URL</label>
                    <input type="text" name="videoUrl" id="videoUrl" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
                        Add Game
                    </button>
                </div>
            </form>
        </div>

        <!-- List of Games -->
        <div class="bg-white p-6 rounded-lg shadow-md">
            <h2 class="text-xl font-semibold text-gray-800 mb-4">Existing Games</h2>
            <ul class="divide-y divide-gray-200">
                <% for (String game : games) {
                	// Extract individual components from the "gameDetails" string
			        String[] parts = game.split(" - ");
			        String gameDate = parts[0]; // Date
			        String[] teams = parts[1].split(" vs ");
			        String team1 = teams[0];    // Team1
			        String team2 = teams[1];    // Team2
			    %>
                    <li class="py-4 flex justify-between items-center">
                        <span class="text-gray-700 font-medium"><%= game %></span>
                        <div class="space-x-2">
                            <!-- Edit Button -->
                            <a href="editGame.jsp?gameDetails=<%= game %>" 
                                class="text-blue-500 hover:text-blue-700 font-semibold">Edit</a>
                            <!-- Delete Button -->
                            <form action="DeleteGameServlet" method="post" class="inline">
                                <input type="hidden" name="date" value="<%= gameDate %>">
			                    <input type="hidden" name="team1" value="<%= team1 %>">
			                    <input type="hidden" name="team2" value="<%= team2 %>">
                                <button type="submit" class="text-red-500 hover:text-red-700 font-semibold">
                                    Delete
                                </button>
                            </form>
                        </div>
                    </li>
                <% } %>
            </ul>
        </div>
    </div>
</body>
</html>
