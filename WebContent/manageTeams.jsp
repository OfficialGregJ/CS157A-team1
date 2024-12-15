<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.Team, com.TeamDao, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Manage Teams</title>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto p-4">
        <!-- Page Header -->
        <div class="flex justify-between items-center mb-6">
            <h1 class="text-3xl font-bold text-gray-800">Manage Teams</h1>
            <a href="adminPage.jsp" class="bg-gray-800 text-white px-4 py-2 rounded hover:bg-gray-700">
                Back to Dashboard
            </a>
        </div>

        <!-- Add Team Form -->
        <div class="bg-white p-6 rounded-lg shadow-md mb-6">
            <h2 class="text-xl font-semibold text-gray-800 mb-4">Add a New Team</h2>
            <form action="AddTeamServlet" method="POST" class="space-y-4">
                <div class="grid grid-cols-3 gap-4">
                    <input type="text" name="name" placeholder="Team Name" 
                           class="w-full border border-gray-300 rounded px-3 py-2 focus:ring-blue-500 focus:border-blue-500" required>
                    <input type="text" name="city" placeholder="City" 
                           class="w-full border border-gray-300 rounded px-3 py-2 focus:ring-blue-500 focus:border-blue-500">
                    <input type="text" name="stadium" placeholder="Stadium" 
                           class="w-full border border-gray-300 rounded px-3 py-2 focus:ring-blue-500 focus:border-blue-500">
                </div>
                <button type="submit" class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600 mt-4">
                    Add Team
                </button>
            </form>
        </div>

        <!-- Team List -->
        <div class="bg-white p-6 rounded-lg shadow-md">
            <h2 class="text-xl font-semibold text-gray-800 mb-4">Existing Teams</h2>
            <table class="w-full border-collapse border border-gray-300">
                <thead class="bg-gray-200">
                    <tr>
                        <th class="px-4 py-2 text-left text-gray-600 font-medium">Name</th>
                        <th class="px-4 py-2 text-left text-gray-600 font-medium">City</th>
                        <th class="px-4 py-2 text-left text-gray-600 font-medium">Stadium</th>
                        <th class="px-4 py-2 text-center text-gray-600 font-medium">Actions</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200">
                    <%
                        TeamDao teamDao = new TeamDao();
                        List<String> teams = teamDao.getAllTeamNames();

                        for (String team : teams) {
                            Team teamDetails = teamDao.getTeamDetails(team);
                    %>
                        <tr class="hover:bg-gray-50">
                            <td class="px-4 py-2 text-gray-700"><%= team %></td>
                            <td class="px-4 py-2 text-gray-700"><%= teamDetails != null ? teamDetails.getCity() : "---" %></td>
                            <td class="px-4 py-2 text-gray-700"><%= teamDetails != null ? teamDetails.getStadium() : "---" %></td>
                            <td class="px-4 py-2 text-center">
                                <div class="flex justify-center space-x-4">
                                    <!-- Edit Button -->
                                    <a href="editTeam.jsp?team=<%= team %>" 
                                       class="text-blue-500 hover:text-blue-700 font-semibold">Edit</a>
                                    <!-- Delete Button -->
                                    <form action="DeleteTeamAndStatsServlet" method="POST" class="inline">
                                        <input type="hidden" name="teamName" value="<%= team %>">
                                        <button type="submit" class="text-red-500 hover:text-red-700 font-semibold">
                                            Delete
                                        </button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
