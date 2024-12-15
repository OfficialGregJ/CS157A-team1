<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.Team, com.TeamDao, com.TeamStatsDao, com.TeamStats, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Edit Team and Statistics</title>
</head>
<body class="bg-gray-100 min-h-screen">
    <div class="container mx-auto py-8">
        <h1 class="text-3xl font-bold mb-6 text-gray-800">Edit Team and Statistics</h1>

        <%
            // Fetch the team name from query parameters
            String teamName = request.getParameter("team");

            // Initialize DAOs
            TeamDao teamDao = new TeamDao();
            TeamStatsDao statsDao = new TeamStatsDao();

            // Fetch team details
            Team team = teamDao.getTeamDetails(teamName);

            // Fetch team statistics
            TeamStats stats = statsDao.getTeamStats(teamName);
        %>

        <!-- Form to Update Team Details -->
        <form action="EditTeamServlet" method="POST" class="bg-white p-6 rounded-lg shadow-md mb-6">
            <h2 class="text-xl font-bold text-gray-800 mb-4">Edit Team Details</h2>
            <input type="hidden" name="originalName" value="<%= team != null ? team.getName() : "" %>">

            <div class="mb-4">
                <label for="name" class="block text-sm font-medium text-gray-700">Team Name</label>
                <input type="text" id="name" name="name" 
                    value="<%= team != null ? team.getName() : "" %>" 
                    class="w-full border border-gray-300 rounded px-3 py-2 focus:ring-blue-500 focus:border-blue-500" required>
            </div>

            <div class="mb-4">
                <label for="city" class="block text-sm font-medium text-gray-700">City</label>
                <input type="text" id="city" name="city" 
                    value="<%= team != null ? team.getCity() : "" %>" 
                    class="w-full border border-gray-300 rounded px-3 py-2 focus:ring-blue-500 focus:border-blue-500">
            </div>

            <div class="mb-4">
                <label for="stadium" class="block text-sm font-medium text-gray-700">Stadium</label>
                <input type="text" id="stadium" name="stadium" 
                    value="<%= team != null ? team.getStadium() : "" %>" 
                    class="w-full border border-gray-300 rounded px-3 py-2 focus:ring-blue-500 focus:border-blue-500">
            </div>

            <div class="flex space-x-4">
                <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
                    Save Changes
                </button>
                <a href="manageTeams.jsp" class="text-blue-500 hover:underline">Cancel</a>
            </div>
        </form>

        <!-- Form to Update Team Statistics -->
        <form action="EditTeamStatsServlet" method="POST" class="bg-white p-6 rounded-lg shadow-md">
            <h2 class="text-xl font-bold text-gray-800 mb-4">Team Statistics</h2>
            <input type="hidden" name="teamName" value="<%= teamName %>">

            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label for="ppg" class="block text-sm font-medium text-gray-700">Points Per Game (PPG)</label>
                    <input type="number" step="0.1" name="ppg" id="ppg" 
                        value="<%= stats != null ? stats.getPPG() : "0" %>" 
                        class="w-full border border-gray-300 rounded px-3 py-2 focus:ring-blue-500 focus:border-blue-500" required>
                </div>
                <div>
                    <label for="apg" class="block text-sm font-medium text-gray-700">Assists Per Game (APG)</label>
                    <input type="number" step="0.1" name="apg" id="apg" 
                        value="<%= stats != null ? stats.getAPG() : "0" %>" 
                        class="w-full border border-gray-300 rounded px-3 py-2 focus:ring-blue-500 focus:border-blue-500" required>
                </div>
                <div>
                    <label for="spg" class="block text-sm font-medium text-gray-700">Steals Per Game (SPG)</label>
                    <input type="number" step="0.1" name="spg" id="spg" 
                        value="<%= stats != null ? stats.getSPG() : "0" %>" 
                        class="w-full border border-gray-300 rounded px-3 py-2 focus:ring-blue-500 focus:border-blue-500" required>
                </div>
                <div>
                    <label for="bpg" class="block text-sm font-medium text-gray-700">Blocks Per Game (BPG)</label>
                    <input type="number" step="0.1" name="bpg" id="bpg" 
                        value="<%= stats != null ? stats.getBPG() : "0" %>" 
                        class="w-full border border-gray-300 rounded px-3 py-2 focus:ring-blue-500 focus:border-blue-500" required>
                </div>
                <div>
                    <label for="topg" class="block text-sm font-medium text-gray-700">Turnovers Per Game (TOPG)</label>
                    <input type="number" step="0.1" name="topg" id="topg" 
                        value="<%= stats != null ? stats.getTOPG() : "0" %>" 
                        class="w-full border border-gray-300 rounded px-3 py-2 focus:ring-blue-500 focus:border-blue-500" required>
                </div>
                <div>
                    <label for="ft" class="block text-sm font-medium text-gray-700">Free Throw Percentage (FT%)</label>
                    <input type="number" step="0.01" name="ft" id="ft" 
                        value="<%= stats != null ? stats.getFTPercentage() : "0" %>" 
                        class="w-full border border-gray-300 rounded px-3 py-2 focus:ring-blue-500 focus:border-blue-500" required>
                </div>
                <div>
                    <label for="threePt" class="block text-sm font-medium text-gray-700">Three-Point Percentage (3PT%)</label>
                    <input type="number" step="0.01" name="threePt" id="threePt" 
                        value="<%= stats != null ? stats.getThreePTPercentage() : "0" %>" 
                        class="w-full border border-gray-300 rounded px-3 py-2 focus:ring-blue-500 focus:border-blue-500" required>
                </div>
                <div>
                    <label for="gamesPlayed" class="block text-sm font-medium text-gray-700">Games Played</label>
                    <input type="number" name="gamesPlayed" id="gamesPlayed" 
                        value="<%= stats != null ? stats.getGamesPlayed() : "0" %>" 
                        class="w-full border border-gray-300 rounded px-3 py-2 focus:ring-blue-500 focus:border-blue-500" required>
                </div>
                <div>
                    <label for="wins" class="block text-sm font-medium text-gray-700">Wins</label>
                    <input type="number" name="wins" id="wins" 
                        value="<%= stats != null ? stats.getWins() : "0" %>" 
                        class="w-full border border-gray-300 rounded px-3 py-2 focus:ring-blue-500 focus:border-blue-500" required>
                </div>
                <div>
                    <label for="losses" class="block text-sm font-medium text-gray-700">Losses</label>
                    <input type="number" name="losses" id="losses" 
                        value="<%= stats != null ? stats.getLosses() : "0" %>" 
                        class="w-full border border-gray-300 rounded px-3 py-2 focus:ring-blue-500 focus:border-blue-500" required>
                </div>
            </div>

            <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 mt-4">
                Save Team Statistics
            </button>
        </form>
    </div>
</body>
</html>
