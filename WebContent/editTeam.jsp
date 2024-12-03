<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.Team, com.TeamDao, com.TeamStatsDao, com.TeamStats, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Team and Statistics</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">
    <div class="container mx-auto py-8">
        <h1 class="text-3xl font-bold mb-6">Edit Team and Statistics</h1>

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
        <form action="EditTeamServlet" method="POST" class="bg-white p-6 rounded shadow-md mb-6">
    <input type="hidden" name="originalName" value="<%= team != null ? team.getName() : "" %>">

    <div class="mb-4">
        <label for="name" class="block text-sm font-medium text-gray-700">Team Name</label>
        <input type="text" id="name" name="name" 
            value="<%= team != null ? team.getName() : "" %>" 
            class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm" required>
    </div>

    <div class="mb-4">
        <label for="city" class="block text-sm font-medium text-gray-700">City</label>
        <input type="text" id="city" name="city" 
            value="<%= team != null ? team.getCity() : "" %>" 
            class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
    </div>

    <div class="mb-4">
        <label for="stadium" class="block text-sm font-medium text-gray-700">Stadium</label>
        <input type="text" id="stadium" name="stadium" 
            value="<%= team != null ? team.getStadium() : "" %>" 
            class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
    </div>

    <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
        Save Changes
    </button>
    <a href="manageTeams.jsp" class="ml-4 text-blue-500 hover:underline">Cancel</a>
</form>


        <!-- Form to Update Team Statistics -->
        <form action="EditTeamStatsServlet" method="POST" class="bg-white shadow-md rounded-lg p-6">
            <h2 class="text-2xl font-bold mb-4">Team Statistics</h2>
            <input type="hidden" name="teamName" value="<%= teamName %>">

            <div class="grid grid-cols-2 gap-4">
                <input type="number" step="0.1" name="ppg" placeholder="PPG" 
                       value="<%= stats != null ? stats.getPPG() : "0" %>" 
                       class="p-2 border rounded" required>
                <input type="number" step="0.1" name="apg" placeholder="APG" 
                       value="<%= stats != null ? stats.getAPG() : "0" %>" 
                       class="p-2 border rounded" required>
                <input type="number" step="0.1" name="spg" placeholder="SPG" 
                       value="<%= stats != null ? stats.getSPG() : "0" %>" 
                       class="p-2 border rounded" required>
                <input type="number" step="0.1" name="bpg" placeholder="BPG" 
                       value="<%= stats != null ? stats.getBPG() : "0" %>" 
                       class="p-2 border rounded" required>
                <input type="number" step="0.1" name="topg" placeholder="TOPG" 
                       value="<%= stats != null ? stats.getTOPG() : "0" %>" 
                       class="p-2 border rounded" required>
                <input type="number" step="0.1" name="ft" placeholder="FT%" 
                       value="<%= stats != null ? stats.getFTPercentage() : "0" %>" 
                       class="p-2 border rounded" required>
                <input type="number" step="0.1" name="threePt" placeholder="3PT%" 
                       value="<%= stats != null ? stats.getThreePTPercentage() : "0" %>" 
                       class="p-2 border rounded" required>
                <input type="number" name="gamesPlayed" placeholder="Games Played" 
                       value="<%= stats != null ? stats.getGamesPlayed() : "0" %>" 
                       class="p-2 border rounded" required>
                <input type="number" name="wins" placeholder="Wins" 
                       value="<%= stats != null ? stats.getWins() : "0" %>" 
                       class="p-2 border rounded" required>
                <input type="number" name="losses" placeholder="Losses" 
                       value="<%= stats != null ? stats.getLosses() : "0" %>" 
                       class="p-2 border rounded" required>
            </div>

            <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white px-4 py-2 rounded mt-4">
                Save Team Statistics
            </button>
        </form>
    </div>
</body>
</html>
