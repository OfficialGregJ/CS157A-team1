<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.yourpackage.Game" %>
<%@ page import="com.yourpackage.PlayerStats" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NBA Game Details</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<jsp:include page="header.jsp" />

<body class="bg-gray-100 min-h-screen">
    <!-- Main Content -->
    <div class="container mx-auto p-6">
        <h1 class="text-3xl font-bold text-center text-blue-600 mb-6">NBA Game Details for <%= request.getAttribute("date") %></h1>

        <%
            List<Game> games = (List<Game>) request.getAttribute("games");
            if (games != null && !games.isEmpty()) {
                for (Game game : games) {
        %>
            <div class="bg-white rounded-lg shadow-md p-6 mb-6">
                <h2 class="text-2xl font-bold text-blue-600 mb-4"><%= game.getTeam1() %> vs <%= game.getTeam2() %></h2>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                    <!-- Game Details -->
                    <div class="space-y-2">
                        <p><span class="font-medium">Winner:</span> <%= game.getWinner() %></p>
                        <p><span class="font-medium">Loser:</span> <%= game.getLoser() %></p>
                        <p><span class="font-medium">Location:</span> <%= game.getLocation() %></p>
                    </div>
                    <!-- Game Statistics -->
                    <div class="space-y-2">
                        <p><span class="font-medium">Score:</span> <%= game.getTeam1() %> (<%= game.getTeam1Pts() %>) - <%= game.getTeam2() %> (<%= game.getTeam2Pts() %>)</p>
                        <p><span class="font-medium">Rebounds:</span> <%= game.getTeam1() %> (<%= game.getTeam1Rebounds() %>) vs <%= game.getTeam2() %> (<%= game.getTeam2Rebounds() %>)</p>
                        <p><span class="font-medium">Assists:</span> <%= game.getTeam1() %> (<%= game.getTeam1Assists() %>) vs <%= game.getTeam2() %> (<%= game.getTeam2Assists() %>)</p>
                        <p><span class="font-medium">Blocks:</span> <%= game.getTeam1() %> (<%= game.getTeam1Blocks() %>) vs <%= game.getTeam2() %> (<%= game.getTeam2Blocks() %>)</p>
                        <p><span class="font-medium">Free Throw %:</span> <%= game.getTeam1() %> (<%= Math.round(game.getTeam1FT() * 100) %>%) vs <%= game.getTeam2() %> (<%= Math.round(game.getTeam2FT() * 100) %>%)</p>
                        <p><span class="font-medium">3PT %:</span> <%= game.getTeam1() %> (<%= Math.round(game.getTeam13PT() * 100) %>%) vs <%= game.getTeam2() %> (<%= Math.round(game.getTeam23PT() * 100) %>%)</p>
                        <p><span class="font-medium">Turnovers:</span> <%= game.getTeam1() %> (<%= game.getTeam1TO() %>) vs <%= game.getTeam2() %> (<%= game.getTeam2TO() %>)</p>
                    </div>
                </div>
                
                <!-- Player Details -->
                <div class="mt-6">
                    <h3 class="text-xl font-bold text-blue-600 mb-4">Player Details</h3>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <% for (Map.Entry<String, List<PlayerStats>> entry : game.getPlayerStats().entrySet()) { %>
                            <div>
                                <h4 class="text-lg font-semibold mb-2"><%= entry.getKey() %></h4>
                                <table class="w-full">
                                    <thead>
                                        <tr class="bg-gray-200">
                                            <th class="px-2 py-1 text-left">Player</th>
                                            <th class="px-2 py-1 text-right">PTS</th>
                                            <th class="px-2 py-1 text-right">RBS</th>
                                            <th class="px-2 py-1 text-right">AST</th>
                                            <th class="px-2 py-1 text-right">BLK</th>
                                            <th class="px-2 py-1 text-right">FT%</th>
                                            <th class="px-2 py-1 text-right">3PT%</th>
                                            <th class="px-2 py-1 text-right">TOV</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (PlayerStats stats : entry.getValue()) { %>
                                            <tr>
                                                <td class="px-2 py-1"><%= stats.getPlayerName() %></td>
                                                <td class="px-2 py-1 text-right"><%= stats.getPoints() %></td>
                                                <td class="px-2 py-1 text-right"><%= stats.getRebounds() %></td>
                                                <td class="px-2 py-1 text-right"><%= stats.getAssists() %></td>
                                                <td class="px-2 py-1 text-right"><%= stats.getBlocks() %></td>
                                                <td class="px-2 py-1 text-right"><%= String.format("%.1f", stats.getFreeThrowPercentage()) %>%</td>
                                                <td class="px-2 py-1 text-right"><%= String.format("%.1f", stats.getThreePointPercentage()) %>%</td>
                                                <td class="px-2 py-1 text-right"><%= stats.getTurnovers() %></td>
                                            </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        <% } %>
                    </div>
                </div>
            </div>
        <%
                }
            } else {
        %>
            <p class="text-center text-red-500">No games found for this date.</p>
        <%
            }
        %>
        <div class="text-center mt-6">
            <a href="GamesServlet" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                Back to All Dates
            </a>
        </div>
    </div>
</body>
</html>
