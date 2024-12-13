<%@ page import="com.GamesDao" %>
<%
    String gameDetails = request.getParameter("gameDetails");
    GamesDao dao = new GamesDao();
    // Fetch game details and stats for pre-filling the form (if needed)
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Edit Game</title>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto p-4">
        <h1 class="text-2xl font-bold mb-4">Edit Game</h1>
        <!-- Edit Game Details -->
        <form action="EditGameServlet" method="post" class="bg-white p-4 rounded shadow">
            <input type="hidden" name="originalGameDetails" value="<%= gameDetails %>">
            <div class="mb-4">
                <label for="newDate" class="block text-gray-700 font-medium">Date</label>
                <input type="date" name="newDate" id="newDate" required class="w-full border rounded px-3 py-2">
            </div>
            <div class="mb-4">
                <label for="team1" class="block text-gray-700 font-medium">Team 1</label>
                <input type="text" name="team1" id="team1" required class="w-full border rounded px-3 py-2">
            </div>
            <div class="mb-4">
                <label for="team2" class="block text-gray-700 font-medium">Team 2</label>
                <input type="text" name="team2" id="team2" required class="w-full border rounded px-3 py-2">
            </div>
            <div class="mb-4">
                <label for="winner" class="block text-gray-700 font-medium">Winner</label>
                <input type="text" name="winner" id="winner" class="w-full border rounded px-3 py-2">
            </div>
            <div class="mb-4">
                <label for="loser" class="block text-gray-700 font-medium">Loser</label>
                <input type="text" name="loser" id="loser" class="w-full border rounded px-3 py-2">
            </div>
            <div class="mb-4">
                <label for="location" class="block text-gray-700 font-medium">Location</label>
                <input type="text" name="location" id="location" class="w-full border rounded px-3 py-2">
            </div>
            <div class="mb-4">
                <label for="videoUrl" class="block text-gray-700 font-medium">Video URL</label>
                <input type="text" name="videoUrl" id="videoUrl" class="w-full border rounded px-3 py-2">
            </div>
            <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
                Save Details
            </button>
        </form>

        <!-- Edit Game Stats -->
        <h2 class="text-xl font-bold mt-8 mb-4">Edit Game Stats</h2>
        <form action="EditGameStatsServlet" method="post" class="bg-white p-4 rounded shadow">
            <input type="hidden" name="date" value="<%= gameDetails.split(" - ")[0] %>">
            <input type="hidden" name="team1" value="<%= gameDetails.split(" - ")[1].split(" vs ")[0] %>">
            <input type="hidden" name="team2" value="<%= gameDetails.split(" - ")[1].split(" vs ")[1] %>">
            <div class="grid grid-cols-2 gap-4">
                <!-- Points -->
                <div>
                    <label for="team1Pts" class="block text-gray-700 font-medium">Team 1 Points</label>
                    <input type="number" name="team1Pts" id="team1Pts" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="team2Pts" class="block text-gray-700 font-medium">Team 2 Points</label>
                    <input type="number" name="team2Pts" id="team2Pts" class="w-full border rounded px-3 py-2">
                </div>

                <!-- Rebounds -->
                <div>
                    <label for="team1Rebounds" class="block text-gray-700 font-medium">Team 1 Rebounds</label>
                    <input type="number" name="team1Rebounds" id="team1Rebounds" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="team2Rebounds" class="block text-gray-700 font-medium">Team 2 Rebounds</label>
                    <input type="number" name="team2Rebounds" id="team2Rebounds" class="w-full border rounded px-3 py-2">
                </div>

                <!-- Assists -->
                <div>
                    <label for="team1Assists" class="block text-gray-700 font-medium">Team 1 Assists</label>
                    <input type="number" name="team1Assists" id="team1Assists" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="team2Assists" class="block text-gray-700 font-medium">Team 2 Assists</label>
                    <input type="number" name="team2Assists" id="team2Assists" class="w-full border rounded px-3 py-2">
                </div>

                <!-- Blocks -->
                <div>
                    <label for="team1Blocks" class="block text-gray-700 font-medium">Team 1 Blocks</label>
                    <input type="number" name="team1Blocks" id="team1Blocks" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="team2Blocks" class="block text-gray-700 font-medium">Team 2 Blocks</label>
                    <input type="number" name="team2Blocks" id="team2Blocks" class="w-full border rounded px-3 py-2">
                </div>

                <!-- Free Throw Percentages -->
                <div>
                    <label for="team1FTPercent" class="block text-gray-700 font-medium">Team 1 FT%</label>
                    <input type="number" step="0.1" name="team1FTPercent" id="team1FTPercent" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="team2FTPercent" class="block text-gray-700 font-medium">Team 2 FT%</label>
                    <input type="number" step="0.1" name="team2FTPercent" id="team2FTPercent" class="w-full border rounded px-3 py-2">
                </div>

                <!-- Three-Point Percentages -->
                <div>
                    <label for="team13PTPercent" class="block text-gray-700 font-medium">Team 1 3PT%</label>
                    <input type="number" step="0.1" name="team13PTPercent" id="team13PTPercent" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="team23PTPercent" class="block text-gray-700 font-medium">Team 2 3PT%</label>
                    <input type="number" step="0.1" name="team23PTPercent" id="team23PTPercent" class="w-full border rounded px-3 py-2">
                </div>

                <!-- Turnovers -->
                <div>
                    <label for="team1TO" class="block text-gray-700 font-medium">Team 1 Turnovers</label>
                    <input type="number" name="team1TO" id="team1TO" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="team2TO" class="block text-gray-700 font-medium">Team 2 Turnovers</label>
                    <input type="number" name="team2TO" id="team2TO" class="w-full border rounded px-3 py-2">
                </div>
            </div>
            <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 mt-4">
                Save Stats
            </button>
        </form>
    </div>
</body>
</html>
