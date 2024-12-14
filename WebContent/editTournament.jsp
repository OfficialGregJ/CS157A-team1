<%@ page import="com.TournamentDao" %>
<%@ page import ="java.util.Map" %>
<%
    String tournamentName = request.getParameter("name");
    TournamentDao dao = new TournamentDao();
    // Fetch tournament details and stats for pre-filling the form
    Map<String, String> tournamentDetails = dao.getTournamentDetails(tournamentName);
    Map<String, Object> tournamentStats = dao.getTournamentStats(tournamentName);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Edit Tournament</title>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto p-4">
        <h1 class="text-2xl font-bold mb-4">Edit Tournament</h1>
        <!-- Edit Tournament Details -->
        <form action="EditTournamentServlet" method="post" class="bg-white p-4 rounded shadow">
            <input type="hidden" name="originalName" value="<%= tournamentName %>">
            <div class="mb-4">
                <label for="name" class="block text-gray-700 font-medium">Tournament Name</label>
                <input type="text" name="name" id="name" value="<%= tournamentDetails.get("TournamentName") %>" required 
                    class="w-full border border-gray-300 rounded px-3 py-2">
            </div>
            <div class="mb-4">
                <label for="date" class="block text-gray-700 font-medium">Date</label>
                <input type="date" name="date" id="date" value="<%= tournamentDetails.get("Date") %>" 
                    class="w-full border border-gray-300 rounded px-3 py-2">
            </div>
            <div class="mb-4">
                <label for="team1" class="block text-gray-700 font-medium">Team 1</label>
                <input type="text" name="team1" id="team1" value="<%= tournamentDetails.get("Team1") %>" 
                    class="w-full border border-gray-300 rounded px-3 py-2">
            </div>
            <div class="mb-4">
                <label for="team2" class="block text-gray-700 font-medium">Team 2</label>
                <input type="text" name="team2" id="team2" value="<%= tournamentDetails.get("Team2") %>" 
                    class="w-full border border-gray-300 rounded px-3 py-2">
            </div>
            <div class="mb-4">
                <label for="winner" class="block text-gray-700 font-medium">Winner</label>
                <input type="text" name="winner" id="winner" value="<%= tournamentDetails.get("Winner") %>" 
                    class="w-full border border-gray-300 rounded px-3 py-2">
            </div>
            <div class="mb-4">
                <label for="location" class="block text-gray-700 font-medium">Location</label>
                <input type="text" name="location" id="location" value="<%= tournamentDetails.get("Location") %>" 
                    class="w-full border border-gray-300 rounded px-3 py-2">
            </div>
            <div class="mb-4">
                <label for="video_url" class="block text-gray-700 font-medium">Video URL</label>
                <input type="url" name="video_url" id="video_url" value="<%= tournamentDetails.get("video_url") %>" 
                    class="w-full border border-gray-300 rounded px-3 py-2">
            </div>
            <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
                Save Details
            </button>
        </form>

        <!-- Edit Tournament Stats -->
        <h2 class="text-xl font-bold mt-8 mb-4">Edit Tournament Stats</h2>
        <form action="EditTournamentStatsServlet" method="post" class="bg-white p-4 rounded shadow">
            <input type="hidden" name="tournamentName" value="<%= tournamentName %>">
            <div class="grid grid-cols-2 gap-4">
                <div>
		            <label for="date" class="block text-gray-700 font-medium">Date</label>
		            <input type="text" name="date" id="date" 
		                value="<%= tournamentStats.get("Date") != null ? tournamentStats.get("Date") : "" %>" 
		                class="w-full border border-gray-300 rounded px-3 py-2">
		        </div>
                <div>
		            <label for="team1" class="block text-gray-700 font-medium">Team 1</label>
		            <input type="text" name="team1" id="team1" 
		                value="<%= tournamentStats.get("Team1") != null ? tournamentStats.get("Team1") : "" %>" 
		                class="w-full border border-gray-300 rounded px-3 py-2">
		        </div>
		        <div>
		            <label for="team2" class="block text-gray-700 font-medium">Team 2</label>
		            <input type="text" name="team2" id="team2" 
		                value="<%= tournamentStats.get("Team2") != null ? tournamentStats.get("Team2") : "" %>" 
		                class="w-full border border-gray-300 rounded px-3 py-2">
		        </div>
		        <div>
		            <label for="team1Pts" class="block text-gray-700 font-medium">Team 1 Points</label>
		            <input type="text" name="team1Pts" id="team1Pts" 
		                value="<%= tournamentStats.get("Team1Pts") != null ? tournamentStats.get("Team1Pts") : "" %>" 
		                class="w-full border border-gray-300 rounded px-3 py-2">
		        </div>
		        <div>
		            <label for="team2Pts" class="block text-gray-700 font-medium">Team 2 Points</label>
		            <input type="text" name="team2Pts" id="team2Pts" 
		                value="<%= tournamentStats.get("Team2Pts") != null ? tournamentStats.get("Team2Pts") : "" %>" 
		                class="w-full border border-gray-300 rounded px-3 py-2">
		        </div>
                <div>
            <label for="team1Rebounds" class="block text-gray-700 font-medium">Team 1 Rebounds</label>
            <input type="number" name="team1Rebounds" id="team1Rebounds" 
                value="<%= tournamentStats.get("Team1Rebounds") != null ? tournamentStats.get("Team1Rebounds") : "" %>" 
                class="w-full border border-gray-300 rounded px-3 py-2">
        		</div>
		        <div>
		            <label for="team2Rebounds" class="block text-gray-700 font-medium">Team 2 Rebounds</label>
		            <input type="number" name="team2Rebounds" id="team2Rebounds" 
		                value="<%= tournamentStats.get("Team2Rebounds") != null ? tournamentStats.get("Team2Rebounds") : "" %>" 
		                class="w-full border border-gray-300 rounded px-3 py-2">
		        </div>
		        <div>
		            <label for="team1Assists" class="block text-gray-700 font-medium">Team 1 Assists</label>
		            <input type="number" name="team1Assists" id="team1Assists" 
		                value="<%= tournamentStats.get("Team1Assists") != null ? tournamentStats.get("Team1Assists") : "" %>" 
		                class="w-full border border-gray-300 rounded px-3 py-2">
		        </div>
		        <div>
		            <label for="team2Assists" class="block text-gray-700 font-medium">Team 2 Assists</label>
		            <input type="number" name="team2Assists" id="team2Assists" 
		                value="<%= tournamentStats.get("Team2Assists") != null ? tournamentStats.get("Team2Assists") : "" %>" 
		                class="w-full border border-gray-300 rounded px-3 py-2">
		        </div>
		        <div>
		            <label for="team1Blocks" class="block text-gray-700 font-medium">Team 1 Blocks</label>
		            <input type="number" name="team1Blocks" id="team1Blocks" 
		                value="<%= tournamentStats.get("Team1Blocks") != null ? tournamentStats.get("Team1Blocks") : "" %>" 
		                class="w-full border border-gray-300 rounded px-3 py-2">
		        </div>
		        <div>
		            <label for="team2Blocks" class="block text-gray-700 font-medium">Team 2 Blocks</label>
		            <input type="number" name="team2Blocks" id="team2Blocks" 
		                value="<%= tournamentStats.get("Team2Blocks") != null ? tournamentStats.get("Team2Blocks") : "" %>" 
		                class="w-full border border-gray-300 rounded px-3 py-2">
		        </div>
		        <div>
		            <label for="team1FTPercent" class="block text-gray-700 font-medium">Team 1 FT%</label>
		            <input type="number" step="0.01" name="team1FTPercent" id="team1FTPercent" 
		                value="<%= tournamentStats.get("Team1FTPercent") != null ? tournamentStats.get("Team1FTPercent") : "" %>" 
		                class="w-full border border-gray-300 rounded px-3 py-2">
		        </div>
		        <div>
		            <label for="team2FTPercent" class="block text-gray-700 font-medium">Team 2 FT%</label>
		            <input type="number" step="0.01" name="team2FTPercent" id="team2FTPercent" 
		                value="<%= tournamentStats.get("Team2FTPercent") != null ? tournamentStats.get("Team2FTPercent") : "" %>" 
		                class="w-full border border-gray-300 rounded px-3 py-2">
		        </div>
		        <div>
		            <label for="team13PTPercent" class="block text-gray-700 font-medium">Team 1 3PT%</label>
		            <input type="number" step="0.01" name="team13PTPercent" id="team13PTPercent" 
		                value="<%= tournamentStats.get("Team13PTPercent") != null ? tournamentStats.get("Team13PTPercent") : "" %>" 
		                class="w-full border border-gray-300 rounded px-3 py-2">
		        </div>
		        <div>
		            <label for="team23PTPercent" class="block text-gray-700 font-medium">Team 2 3PT%</label>
		            <input type="number" step="0.01" name="team23PTPercent" id="team23PTPercent" 
		                value="<%= tournamentStats.get("Team23PTPercent") != null ? tournamentStats.get("Team23PTPercent") : "" %>" 
		                class="w-full border border-gray-300 rounded px-3 py-2">
		        </div>
		        <div>
		            <label for="team1TO" class="block text-gray-700 font-medium">Team 1 Turnovers</label>
		            <input type="number" name="team1TO" id="team1TO" 
		                value="<%= tournamentStats.get("Team1TO") != null ? tournamentStats.get("Team1TO") : "" %>" 
		                class="w-full border border-gray-300 rounded px-3 py-2">
		        </div>
		        <div>
		            <label for="team2TO" class="block text-gray-700 font-medium">Team 2 Turnovers</label>
		            <input type="number" name="team2TO" id="team2TO" 
		                value="<%= tournamentStats.get("Team2TO") != null ? tournamentStats.get("Team2TO") : "" %>" 
		                class="w-full border border-gray-300 rounded px-3 py-2">
		        </div>
		    </div>
            <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 mt-4">
                Save Stats
            </button>
        </form>
    </div>
</body>
</html>
