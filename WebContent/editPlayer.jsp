<%@ page import="com.PlayerDao" %>
<%@ page import="com.PlayerStatsDao" %>
<%@ page import="java.util.Map" %>

<%
    String playerName = request.getParameter("name");
    PlayerDao playerDao = new PlayerDao();
    PlayerStatsDao statsDao = new PlayerStatsDao();

    // Fetch player details
    Map<String, String> playerDetails = playerDao.getPlayerDetails(playerName);

    // Fetch player stats
    Map<String, Double> playerStats = statsDao.getPlayerStats(playerName);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Edit Player</title>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto p-4">
        <h1 class="text-2xl font-bold mb-4">Edit Player</h1>

        <!-- Edit Player Details -->
        <form action="EditPlayerServlet" method="post" class="bg-white p-6 rounded shadow">
            <input type="hidden" name="originalName" value="<%= playerName %>">
            <div class="mb-4">
                <label for="name" class="block text-gray-700 font-medium">Player Name</label>
                <input type="text" name="name" id="name" value="<%= playerDetails.getOrDefault("Name", "") %>" 
                       class="w-full border rounded px-3 py-2" required>
            </div>
            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label for="team" class="block text-gray-700 font-medium">Team</label>
                    <input type="text" name="team" id="team" value="<%= playerDetails.getOrDefault("Team", "") %>" 
                           class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="position" class="block text-gray-700 font-medium">Position</label>
                    <input type="text" name="position" id="position" value="<%= playerDetails.getOrDefault("Position", "") %>" 
                           class="w-full border rounded px-3 py-2">
                </div>
            </div>
            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label for="age" class="block text-gray-700 font-medium">Age</label>
                    <input type="number" name="age" id="age" value="<%= playerDetails.getOrDefault("Age", "0") %>" 
                           class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="yearInNBA" class="block text-gray-700 font-medium">Years in NBA</label>
                    <input type="number" name="yearInNBA" id="yearInNBA" value="<%= playerDetails.getOrDefault("YearInNBA", "0") %>" 
                           class="w-full border rounded px-3 py-2">
                </div>
            </div>
            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label for="height" class="block text-gray-700 font-medium">Height</label>
                    <input type="text" name="height" id="height" value="<%= playerDetails.getOrDefault("Height", "") %>" 
                           class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="weight" class="block text-gray-700 font-medium">Weight</label>
                    <input type="number" step="0.1" name="weight" id="weight" value="<%= playerDetails.getOrDefault("Weight", "0") %>" 
                           class="w-full border rounded px-3 py-2">
                </div>
            </div>
            <div>
                <label for="college" class="block text-gray-700 font-medium">College</label>
                <input type="text" name="college" id="college" value="<%= playerDetails.getOrDefault("College", "") %>" 
                       class="w-full border rounded px-3 py-2">
            </div>
            <div>
                <label for="imageUrl" class="block text-gray-700 font-medium">Image URL</label>
                <input type="text" name="imageUrl" id="imageUrl" value="<%= playerDetails.getOrDefault("image_url", "") %>" 
                       class="w-full border rounded px-3 py-2">
            </div>
            <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
                Save Details
            </button>
        </form>

        <!-- Edit Player Stats -->
        <h2 class="text-xl font-bold mt-8 mb-4">Edit Player Stats</h2>
        <form action="EditPlayerStatsServlet" method="post" class="bg-white p-6 rounded shadow">
            <input type="hidden" name="playerName" value="<%= playerName %>">
            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label for="ppg" class="block text-gray-700 font-medium">PPG</label>
                    <input type="number" step="0.1" name="ppg" id="ppg" value="<%= playerStats.getOrDefault("PPG", 0.0) %>" 
                           class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="apg" class="block text-gray-700 font-medium">APG</label>
                    <input type="number" step="0.1" name="apg" id="apg" value="<%= playerStats.getOrDefault("APG", 0.0) %>" 
                           class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="bpg" class="block text-gray-700 font-medium">BPG</label>
                    <input type="number" step="0.1" name="bpg" id="bpg" value="<%= playerStats.getOrDefault("BPG", 0.0) %>" 
                           class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="spg" class="block text-gray-700 font-medium">SPG</label>
                    <input type="number" step="0.1" name="spg" id="spg" value="<%= playerStats.getOrDefault("SPG", 0.0) %>" 
                           class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="rpg" class="block text-gray-700 font-medium">RPG</label>
                    <input type="number" step="0.1" name="rpg" id="rpg" value="<%= playerStats.getOrDefault("RPG", 0.0) %>" 
                           class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="ftPercentage" class="block text-gray-700 font-medium">FT%</label>
                    <input type="number" step="0.1" name="ftPercentage" id="ftPercentage" value="<%= playerStats.getOrDefault("FT%", 0.0) %>" 
                           class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="threePtPercentage" class="block text-gray-700 font-medium">3PT%</label>
                    <input type="number" step="0.1" name="threePtPercentage" id="threePtPercentage" value="<%= playerStats.getOrDefault("3PT%", 0.0) %>" 
                           class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="topg" class="block text-gray-700 font-medium">TO</label>
                    <input type="number" step="0.1" name="topg" id="topg" value="<%= playerStats.getOrDefault("TOPG", 0.0) %>" 
                           class="w-full border rounded px-3 py-2">
                </div>
            </div>
            <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 mt-4">
                Save Stats
            </button>
        </form>
    </div>
</body>
</html>
