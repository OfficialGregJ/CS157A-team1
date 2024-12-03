<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.Team, com.TeamDao, com.TeamStatsDao, com.TeamStats, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Teams</title>
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
        <h1 class="flex text-3xl justify-center font-bold mb-6">Manage Teams</h1>

        <%
            TeamDao teamDao = new TeamDao();
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
        <h2 class="text-2xl font-bold mb-4">Teams</h2>
        <table class="min-w-full bg-white shadow-md rounded-lg">
            <thead>
                <tr>
                    <th class="px-4 py-2">Name</th>
                    <th class="px-4 py-2">City</th>
                    <th class="px-4 py-2">Stadium</th>
                    <th class="px-4 py-2">Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    for (String team : teams) {
                        Team teamDetails = teamDao.getTeamDetails(team);
                %>
                    <tr>
                        <td class="border px-4 py-2"><%= team %></td>
                        <td class="border px-4 py-2"><%= teamDetails != null ? teamDetails.getCity() : "---" %></td>
                        <td class="border px-4 py-2"><%= teamDetails != null ? teamDetails.getStadium() : "---" %></td>
                        <td class="border px-4 py-2">
                            <a href="editTeam.jsp?team=<%= team %>" class="text-blue-500 hover:underline">Edit</a>
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
