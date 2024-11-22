<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Player" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NBA Player Search Results</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto px-4 py-8">
        <h1 class="text-3xl font-bold mb-6">NBA Player Search Results</h1>
        <p class="mb-4">
            Showing results for: 
            <span class="font-semibold">
                <%= request.getAttribute("searchName") != null ? request.getAttribute("searchName") : "All names" %>
            </span>
            <% if (request.getAttribute("searchPosition") != null && !((String)request.getAttribute("searchPosition")).isEmpty()) { %>
                , Position: <span class="font-semibold"><%= request.getAttribute("searchPosition") %></span>
            <% } %>
        </p>
        <a href="${pageContext.request.contextPath}/searchPlayers.jsp" class="text-blue-500 hover:underline mb-4 inline-block">Back to Search</a>
        <div class="overflow-x-auto">
            <table class="w-full bg-white shadow-md rounded">
                <thead>
                    <tr class="bg-gray-200 text-gray-600 uppercase text-sm leading-normal">
                        <th class="py-3 px-6 text-left">Name</th>
                        <th class="py-3 px-6 text-left">Team</th>
                        <th class="py-3 px-6 text-left">Position</th>
                        <th class="py-3 px-6 text-left">Age</th>
                        <th class="py-3 px-6 text-left">Height</th>
                        <th class="py-3 px-6 text-left">Weight</th>
                        <th class="py-3 px-6 text-left">College</th>
                        <th class="py-3 px-6 text-left">Years in NBA</th>
                    </tr>
                </thead>
                <tbody class="text-gray-600 text-sm font-light">
                    <%
                    List<Player> players = (List<Player>)request.getAttribute("players");
                    if (players != null && !players.isEmpty()) {
                        for (Player player : players) {
                    %>
                        <tr class="border-b border-gray-200 hover:bg-gray-100">
                            <td class="py-3 px-6 text-left whitespace-nowrap">
                                <a href="${pageContext.request.contextPath}/playerProfile?name=<%= java.net.URLEncoder.encode(player.getName(), "UTF-8") %>" class="font-medium text-blue-600 hover:underline"><%= player.getName() %></a>
                            </td>
                            <td class="py-3 px-6 text-left"><%= player.getTeam() %></td>
                            <td class="py-3 px-6 text-left"><%= player.getPosition() %></td>
                            <td class="py-3 px-6 text-left"><%= player.getAge() %></td>
                            <td class="py-3 px-6 text-left"><%= player.getHeight() %></td>
                            <td class="py-3 px-6 text-left"><%= player.getWeight() %></td>
                            <td class="py-3 px-6 text-left"><%= player.getCollege() %></td>
                            <td class="py-3 px-6 text-left"><%= player.getYearInNBA() %></td>
                        </tr>
                    <%
                        }
                    } else {
                    %>
                        <tr>
                            <td colspan="8" class="py-3 px-6 text-center">No players found matching your search criteria.</td>
                        </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>

