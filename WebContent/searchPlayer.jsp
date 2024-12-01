<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Player" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NBA Player Search</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<jsp:include page="header.jsp" />
<body class="bg-gray-100">
    <div class="container mx-auto px-4 py-8">
        <h1 class="text-3xl font-bold mb-6">NBA Player Search</h1>
        <form action="${pageContext.request.contextPath}/searchPlayers" method="get" class="mb-8">
            <div class="flex flex-wrap -mx-2 mb-4">
                <div class="w-full md:w-1/2 px-2 mb-4 md:mb-0">
                    <label for="name" class="block mb-2 font-bold">Player Name:</label>
                    <input type="text" id="name" name="name" class="w-full px-3 py-2 border rounded" value="<%= request.getParameter("name") != null ? request.getParameter("name") : "" %>">
                </div>
                <div class="w-full md:w-1/2 px-2">
                    <label for="position" class="block mb-2 font-bold">Position:</label>
                    <select id="position" name="position" class="w-full px-3 py-2 border rounded">
                        <option value="">All Positions</option>
                        <option value="Point Guard" <%= "Point Guard".equals(request.getParameter("position")) ? "selected" : "" %>>Point Guard</option>
                        <option value="Shooting Guard" <%= "Shooting Guard".equals(request.getParameter("position")) ? "selected" : "" %>>Shooting Guard</option>
                        <option value="Small Forward" <%= "Small Forward".equals(request.getParameter("position")) ? "selected" : "" %>>Small Forward</option>
                        <option value="Power Forward" <%= "Power Forward".equals(request.getParameter("position")) ? "selected" : "" %>>Power Forward</option>
                        <option value="Center" <%= "Center".equals(request.getParameter("position")) ? "selected" : "" %>>Center</option>
                    </select>
                </div>
            </div>
            <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">Search</button>
        </form>

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