<%@ page import="com.PlayerDao" %>
<%
    String playerName = request.getParameter("name");
    PlayerDao dao = new PlayerDao();
    // Fetch player details and stats for pre-filling the form
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
        <form action="EditPlayerServlet" method="post" class="bg-white p-4 rounded shadow">
            <input type="hidden" name="originalName" value="<%= playerName %>">
            <div class="mb-4">
                <label for="name" class="block text-gray-700 font-medium">Player Name</label>
                <input type="text" name="name" id="name" value="<%= playerName %>" required 
                    class="w-full border rounded px-3 py-2">
            </div>
            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label for="team" class="block text-gray-700 font-medium">Team</label>
                    <input type="text" name="team" id="team" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="position" class="block text-gray-700 font-medium">Position</label>
                    <input type="text" name="position" id="position" class="w-full border rounded px-3 py-2">
                </div>
            </div>
            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label for="age" class="block text-gray-700 font-medium">Age</label>
                    <input type="number" name="age" id="age" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="yearInNBA" class="block text-gray-700 font-medium">Years in NBA</label>
                    <input type="number" name="yearInNBA" id="yearInNBA" class="w-full border rounded px-3 py-2">
                </div>
            </div>
            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label for="height" class="block text-gray-700 font-medium">Height</label>
                    <input type="text" name="height" id="height" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="weight" class="block text-gray-700 font-medium">Weight</label>
                    <input type="number" step="0.1" name="weight" id="weight" class="w-full border rounded px-3 py-2">
                </div>
            </div>
            <div>
                <label for="college" class="block text-gray-700 font-medium">College</label>
                <input type="text" name="college" id="college" class="w-full border rounded px-3 py-2">
            </div>
            <div>
                <label for="imageUrl" class="block text-gray-700 font-medium">Image URL</label>
                <input type="text" name="imageUrl" id="imageUrl" class="w-full border rounded px-3 py-2">
            </div>
            <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
                Save Details
            </button>
        </form>

        <!-- Edit Player Stats -->
        <h2 class="text-xl font-bold mt-8 mb-4">Edit Player Stats</h2>
        <form action="EditPlayerStatsServlet" method="post" class="bg-white p-4 rounded shadow">
            <input type="hidden" name="playerName" value="<%= playerName %>">
            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label for="ppg" class="block text-gray-700 font-medium">PPG</label>
                    <input type="number" step="0.1" name="ppg" id="ppg" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="apg" class="block text-gray-700 font-medium">APG</label>
                    <input type="number" step="0.1" name="apg" id="apg" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="bpg" class="block text-gray-700 font-medium">BPG</label>
                    <input type="number" step="0.1" name="bpg" id="bpg" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="spg" class="block text-gray-700 font-medium">SPG</label>
                    <input type="number" step="0.1" name="spg" id="spg" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="rpg" class="block text-gray-700 font-medium">RPG</label>
                    <input type="number" step="0.1" name="rpg" id="rpg" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="ftPercentage" class="block text-gray-700 font-medium">FT%</label>
                    <input type="number" step="0.1" name="ftPercentage" id="ftPercentage" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="threePtPercentage" class="block text-gray-700 font-medium">3PT%</label>
                    <input type="number" step="0.1" name="threePtPercentage" id="threePtPercentage" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="topg" class="block text-gray-700 font-medium">TO</label>
                    <input type="number" step="0.1" name="topg" id="topg" class="w-full border rounded px-3 py-2">
                </div>
            </div>
            <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 mt-4">
                Save Stats
            </button>
        </form>
    </div>
</body>
</html>
