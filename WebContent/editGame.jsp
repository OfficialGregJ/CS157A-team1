<%@ page import="com.GamesDao" %>
<%@ page import="com.GameStatisticsDao" %>
<%@ page import="java.util.Map" %>
<%
    String gameDetails = request.getParameter("gameDetails");
	String[] parts = gameDetails.split(" - ");
	String gameDate = parts[0]; 
	String[] teams = parts[1].split(" vs ");
	String team1 = teams[0];
	String team2 = teams[1];
	
    GamesDao gamesDao = new GamesDao();
    GameStatisticsDao statsDao = new GameStatisticsDao();
    // Fetch game details and stats for pre-filling the form (if needed)
    Map<String, String> gameDetailsMap = gamesDao.getGameDetails(gameDate, team1, team2);
    Map<String, Object> gameStats = statsDao.getGameStatistics(gameDate, team1, team2);
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
                <input type="date" name="newDate" id="newDate" value="<%= gameDetailsMap.get("Date") %>" required class="w-full border rounded px-3 py-2">
            </div>
            <div class="mb-4">
                <label for="team1" class="block text-gray-700 font-medium">Team 1</label>
                <input type="text" name="team1" id="team1" value="<%= gameDetailsMap.get("Team1") %>" required class="w-full border rounded px-3 py-2">
            </div>
            <div class="mb-4">
                <label for="team2" class="block text-gray-700 font-medium">Team 2</label>
                <input type="text" name="team2" id="team2" value="<%= gameDetailsMap.get("Team2") %>" required class="w-full border rounded px-3 py-2">
            </div>
            <div class="mb-4">
                <label for="winner" class="block text-gray-700 font-medium">Winner</label>
                <input type="text" name="winner" id="winner" value="<%= gameDetailsMap.get("Winner") %>" class="w-full border rounded px-3 py-2">
            </div>
            <div class="mb-4">
                <label for="loser" class="block text-gray-700 font-medium">Loser</label>
                <input type="text" name="loser" id="loser" value="<%= gameDetailsMap.get("Loser") %>" class="w-full border rounded px-3 py-2">
            </div>
            <div class="mb-4">
                <label for="location" class="block text-gray-700 font-medium">Location</label>
                <input type="text" name="location" id="location" value="<%= gameDetailsMap.get("Location") %>" class="w-full border rounded px-3 py-2">
            </div>
            <div class="mb-4">
                <label for="videoUrl" class="block text-gray-700 font-medium">Video URL</label>
                <input type="text" name="videoUrl" id="videoUrl" value="<%= gameDetailsMap.get("video_url") %>" class="w-full border rounded px-3 py-2">
            </div>
            <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
                Save Details
            </button>
        </form>

        <!-- Edit Game Stats -->
        <h2 class="text-xl font-bold mt-8 mb-4">Edit Game Stats</h2>
        <form action="EditGameStatsServlet" method="post" class="bg-white p-4 rounded shadow">
            <input type="hidden" name="date" value="<%= gameDate %>">
            <input type="hidden" name="team1" value="<%= team1 %>">
            <input type="hidden" name="team2" value="<%= team2 %>">
            <div class="grid grid-cols-2 gap-4">
                <!-- Points -->
                <div>
                    <label for="team1Pts" class="block text-gray-700 font-medium">Team 1 Points</label>
                    <input type="number" name="team1Pts" id="team1Pts" value="<%= gameStats.get("Team1Pts") %>" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="team2Pts" class="block text-gray-700 font-medium">Team 2 Points</label>
                    <input type="number" name="team2Pts" id="team2Pts" value="<%= gameStats.get("Team2Pts") %>" class="w-full border rounded px-3 py-2">
                </div>

                <!-- Rebounds -->
                <div>
                    <label for="team1Rebounds" class="block text-gray-700 font-medium">Team 1 Rebounds</label>
                    <input type="number" name="team1Rebounds" id="team1Rebounds" value="<%= gameStats.get("Team1Rebounds") %>" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="team2Rebounds" class="block text-gray-700 font-medium">Team 2 Rebounds</label>
                    <input type="number" name="team2Rebounds" id="team2Rebounds" value="<%= gameStats.get("Team2Rebounds") %>" class="w-full border rounded px-3 py-2">
                </div>

                <!-- Assists -->
                <div>
                    <label for="team1Assists" class="block text-gray-700 font-medium">Team 1 Assists</label>
                    <input type="number" name="team1Assists" id="team1Assists" value="<%= gameStats.get("Team1Assists") %>" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="team2Assists" class="block text-gray-700 font-medium">Team 2 Assists</label>
                    <input type="number" name="team2Assists" id="team2Assists" value="<%= gameStats.get("Team2Assists") %>" class="w-full border rounded px-3 py-2">
                </div>

                <!-- Blocks -->
                <div>
                    <label for="team1Blocks" class="block text-gray-700 font-medium">Team 1 Blocks</label>
                    <input type="number" name="team1Blocks" id="team1Blocks" value="<%= gameStats.get("Team1Blocks") %>" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="team2Blocks" class="block text-gray-700 font-medium">Team 2 Blocks</label>
                    <input type="number" name="team2Blocks" id="team2Blocks" value="<%= gameStats.get("Team2Blocks") %>" class="w-full border rounded px-3 py-2">
                </div>

                <!-- Free Throw Percentages -->
                <div>
                    <label for="team1FTPercent" class="block text-gray-700 font-medium">Team 1 FT%</label>
                    <input type="number" step="0.1" name="team1FTPercent" id="team1FTPercent" value="<%= gameStats.get("Team1FTPercent") %>" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="team2FTPercent" class="block text-gray-700 font-medium">Team 2 FT%</label>
                    <input type="number" step="0.1" name="team2FTPercent" id="team2FTPercent" value="<%= gameStats.get("Team2FTPercent") %>" class="w-full border rounded px-3 py-2">
                </div>

                <!-- Three-Point Percentages -->
                <div>
                    <label for="team13PTPercent" class="block text-gray-700 font-medium">Team 1 3PT%</label>
                    <input type="number" step="0.1" name="team13PTPercent" id="team13PTPercent" value="<%= gameStats.get("Team13PTPercent") %>" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="team23PTPercent" class="block text-gray-700 font-medium">Team 2 3PT%</label>
                    <input type="number" step="0.1" name="team23PTPercent" id="team23PTPercent" value="<%= gameStats.get("Team23PTPercent") %>" class="w-full border rounded px-3 py-2">
                </div>

                <!-- Turnovers -->
                <div>
                    <label for="team1TO" class="block text-gray-700 font-medium">Team 1 Turnovers</label>
                    <input type="number" name="team1TO" id="team1TO" value="<%= gameStats.get("Team1TO") %>" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="team2TO" class="block text-gray-700 font-medium">Team 2 Turnovers</label>
                    <input type="number" name="team2TO" id="team2TO" value="<%= gameStats.get("Team2TO") %>" class="w-full border rounded px-3 py-2">
                </div>
            </div>
            <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 mt-4">
                Save Stats
            </button>
        </form>
    </div>
</body>
</html>
