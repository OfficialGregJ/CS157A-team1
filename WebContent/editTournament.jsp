<%@ page import="com.TournamentDao" %>
<%
    String tournamentName = request.getParameter("name");
    TournamentDao dao = new TournamentDao();
    // Fetch tournament details and stats for pre-filling the form
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
                <input type="text" name="name" id="name" value="<%= tournamentName %>" required 
                    class="w-full border border-gray-300 rounded px-3 py-2">
            </div>
            <div class="mb-4">
                <label for="location" class="block text-gray-700 font-medium">Location</label>
                <input type="text" name="location" id="location" 
                    class="w-full border border-gray-300 rounded px-3 py-2">
            </div>
            <div class="mb-4">
                <label for="startDate" class="block text-gray-700 font-medium">Start Date</label>
                <input type="date" name="startDate" id="startDate" 
                    class="w-full border border-gray-300 rounded px-3 py-2">
            </div>
            <div class="mb-4">
                <label for="endDate" class="block text-gray-700 font-medium">End Date</label>
                <input type="date" name="endDate" id="endDate" 
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
                        class="w-full border border-gray-300 rounded px-3 py-2">
                </div>
                <div>
                    <label for="team1" class="block text-gray-700 font-medium">Team 1</label>
                    <input type="text" name="team1" id="team1" 
                        class="w-full border border-gray-300 rounded px-3 py-2">
                </div>
                <div>
                    <label for="team2" class="block text-gray-700 font-medium">Team 2</label>
                    <input type="text" name="team2" id="team2" 
                        class="w-full border border-gray-300 rounded px-3 py-2">
                </div>
                <div>
                    <label for="team1Pts" class="block text-gray-700 font-medium">Team 1 Points</label>
                    <input type="text" name="team1Pts" id="team1Pts" 
                        class="w-full border border-gray-300 rounded px-3 py-2">
                </div>
                <div>
                    <label for="team2Pts" class="block text-gray-700 font-medium">Team 2 Points</label>
                    <input type="text" name="team2Pts" id="team2Pts" 
                        class="w-full border border-gray-300 rounded px-3 py-2">
                </div>
                <div>
                    <label for="team1Rebounds" class="block text-gray-700 font-medium">Team 1 Rebounds</label>
                    <input type="number" name="team1Rebounds" id="team1Rebounds" 
                        class="w-full border border-gray-300 rounded px-3 py-2">
                </div>
                <div>
                    <label for="team2Rebounds" class="block text-gray-700 font-medium">Team 2 Rebounds</label>
                    <input type="number" name="team2Rebounds" id="team2Rebounds" 
                        class="w-full border border-gray-300 rounded px-3 py-2">
                </div>
                <div>
                    <label for="team1Assists" class="block text-gray-700 font-medium">Team 1 Assists</label>
                    <input type="number" name="team1Assists" id="team1Assists" 
                        class="w-full border border-gray-300 rounded px-3 py-2">
                </div>
                <div>
                    <label for="team2Assists" class="block text-gray-700 font-medium">Team 2 Assists</label>
                    <input type="number" name="team2Assists" id="team2Assists" 
                        class="w-full border border-gray-300 rounded px-3 py-2">
                </div>
                <div>
                    <label for="team1Blocks" class="block text-gray-700 font-medium">Team 1 Blocks</label>
                    <input type="number" name="team1Blocks" id="team1Blocks" 
                        class="w-full border border-gray-300 rounded px-3 py-2">
                </div>
                <div>
                    <label for="team2Blocks" class="block text-gray-700 font-medium">Team 2 Blocks</label>
                    <input type="number" name="team2Blocks" id="team2Blocks" 
                        class="w-full border border-gray-300 rounded px-3 py-2">
                </div>
                <div>
                    <label for="team1FTPercent" class="block text-gray-700 font-medium">Team 1 FT%</label>
                    <input type="number" step="0.01" name="team1FTPercent" id="team1FTPercent" 
                        class="w-full border border-gray-300 rounded px-3 py-2">
                </div>
                <div>
                    <label for="team2FTPercent" class="block text-gray-700 font-medium">Team 2 FT%</label>
                    <input type="number" step="0.01" name="team2FTPercent" id="team2FTPercent" 
                        class="w-full border border-gray-300 rounded px-3 py-2">
                </div>
                <div>
                    <label for="team13PTPercent" class="block text-gray-700 font-medium">Team 1 3PT%</label>
                    <input type="number" step="0.01" name="team13PTPercent" id="team13PTPercent" 
                        class="w-full border border-gray-300 rounded px-3 py-2">
                </div>
                <div>
                    <label for="team23PTPercent" class="block text-gray-700 font-medium">Team 2 3PT%</label>
                    <input type="number" step="0.01" name="team23PTPercent" id="team23PTPercent" 
                        class="w-full border border-gray-300 rounded px-3 py-2">
                </div>
                <div>
                    <label for="team1TO" class="block text-gray-700 font-medium">Team 1 TO</label>
                    <input type="number" name="team1TO" id="team1TO" 
                        class="w-full border border-gray-300 rounded px-3 py-2">
                </div>
                <div>
                    <label for="team2TO" class="block text-gray-700 font-medium">Team 2 TO</label>
                    <input type="number" name="team2TO" id="team2TO" 
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