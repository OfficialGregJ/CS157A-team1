<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.TeamDao, com.TeamStatsDao, com.TeamStats, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Teams and Statistics</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">
    <div class="container mx-auto py-8">
    	<div class="flex justify-center mb-6">
            <a href="adminPage.jsp" 
               class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                Back to Dashboard
            </a>
        </div>
        
        <!-- Error or Success Message -->
        <% 
            String errorMessage = request.getParameter("error"); 
            String successMessage = request.getParameter("success");
        %>
        <% if (errorMessage != null && !errorMessage.trim().isEmpty()) { %>
            <div class="bg-red-100 text-red-800 px-4 py-2 rounded mb-4">
                <%= errorMessage %>
            </div>
        <% } %>
        <% if (successMessage != null && !successMessage.trim().isEmpty()) { %>
            <div class="bg-green-100 text-green-800 px-4 py-2 rounded mb-4">
                <%= successMessage %>
            </div>
        <% } %>
        
        <h1 class="text-3xl font-bold mb-6 text-center">Manage Teams and Statistics</h1>

        <%
            TeamDao teamDao = new TeamDao();
            TeamStatsDao statsDao = new TeamStatsDao();
            List<String> teams = teamDao.getAllTeamNames();
        %>

        <!-- Add Team Form -->
        <form action="AddTeamServlet" method="POST" class="mb-6">
            <h2 class="text-2xl font-bold mb-4">Add New Team</h2>
            <div class="grid grid-cols-3 gap-4">
                <input type="text" name="name" placeholder="Team Name" class="p-2 border rounded" required>
                <input type="text" name="city" placeholder="City" class="p-2 border rounded">
                <input type="text" name="stadium" placeholder="Stadium" class="p-2 border rounded">
            </div>
            <button type="submit" class="mt-4 bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600">
                Add Team
            </button>
        </form>

        <!-- Team List -->
        <h2 class="text-2xl font-bold mb-4">Teams and Statistics</h2>
        <table class="min-w-full bg-white shadow-md rounded-lg">
            <thead>
                <tr>
                    <th class="px-4 py-2">Name</th>
                    <th class="px-4 py-2">City</th>
                    <th class="px-4 py-2">Stadium</th>
                    <th class="px-4 py-2">Statistics</th>
                    <th class="px-4 py-2">Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (String team : teams) {
                    TeamStats stats = statsDao.getTeamStats(team); // Fetch team stats dynamically
                    Map<String, String> teamDetails = teamDao.getTeamDetailsMap(team); // Use a map for city and stadium
                %>
                    <tr>
                        <!-- Team Details -->
                        <td class="border px-4 py-2"><%= team %></td>
                        <td class="border px-4 py-2"><%= teamDetails.get("City") %></td>
                        <td class="border px-4 py-2"><%= teamDetails.get("Stadium") %></td>
                        
                        <!-- Team Statistics -->
                        <td class="border px-4 py-2">
                            <form action="EditTeamStatsServlet" method="POST" class="grid grid-cols-2 gap-2">
							    <input type="hidden" name="teamName" value="<%= team %>">
							    <input type="number" step="0.1" name="ppg" placeholder="PPG" class="p-2 border rounded" value="<%= stats != null ? stats.getPPG() : "0" %>">
							    <input type="number" step="0.1" name="apg" placeholder="APG" class="p-2 border rounded" value="<%= stats != null ? stats.getAPG() : "0" %>">
							    <input type="number" step="0.1" name="spg" placeholder="SPG" class="p-2 border rounded" value="<%= stats != null ? stats.getSPG() : "0" %>">
							    <input type="number" step="0.1" name="bpg" placeholder="BPG" class="p-2 border rounded" value="<%= stats != null ? stats.getBPG() : "0" %>">
							    <input type="number" step="0.1" name="topg" placeholder="TOPG" class="p-2 border rounded" value="<%= stats != null ? stats.getTOPG() : "0" %>">
							    <input type="number" step="0.1" name="ft" placeholder="FT%" class="p-2 border rounded" value="<%= stats != null ? stats.getFTPercentage() : "0" %>">
							    <input type="number" step="0.1" name="threePt" placeholder="3PT%" class="p-2 border rounded" value="<%= stats != null ? stats.getThreePTPercentage() : "0" %>">
							    <input type="number" name="gamesPlayed" placeholder="Games Played" class="p-2 border rounded" value="<%= stats != null ? stats.getGamesPlayed() : "0" %>">
							    <input type="number" name="wins" placeholder="Wins" class="p-2 border rounded" value="<%= stats != null ? stats.getWins() : "0" %>">
							    <input type="number" name="losses" placeholder="Losses" class="p-2 border rounded" value="<%= stats != null ? stats.getLosses() : "0" %>">
							    <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 col-span-2">
							        Save Stats
							    </button>
							</form>

                        </td>

                        <!-- Actions -->
                        <td class="border px-4 py-2">
                            <form action="DeleteTeamAndStatsServlet" method="POST" class="inline">
                                <input type="hidden" name="teamName" value="<%= team %>">
                                <button type="submit" class="text-red-500 hover:underline">Delete</button>
                            </form>
                        </td>
                    </tr>
                    
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
