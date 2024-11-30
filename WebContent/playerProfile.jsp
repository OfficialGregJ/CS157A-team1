<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.Player" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Player Profile</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<jsp:include page="header.jsp" />

<body class="bg-gray-100 font-sans">
    <% Player player = (Player) request.getAttribute("player"); %>
    <div class="container mx-auto px-4 py-8">
        <!-- Player Profile Section -->
        <div class="bg-white shadow-lg rounded-lg overflow-hidden mb-8">
            <div class="bg-blue-600 text-white p-4 flex items-center">
                <img src="https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/1966.png&w=350&h=254" 
                     alt="<%= player.getName() %>" 
                     class="w-24 h-24 rounded-full border-4 border-blue-300 bg-white mr-4 object-cover">
                <div>
                    <h1 class="text-3xl font-bold"><%= player.getName() %></h1>
                    <p class="text-xl"><%= player.getTeam() %></p>
                </div>
            </div>
            <div class="p-6">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div class="space-y-2">
                        <p class="text-gray-600">Position</p>
                        <p class="text-xl font-semibold"><%= player.getPosition() %></p>
                    </div>
                    <div class="space-y-2">
                        <p class="text-gray-600">Age</p>
                        <p class="text-xl font-semibold"><%= player.getAge() %></p>
                    </div>
                    <div class="space-y-2">
                        <p class="text-gray-600">Height</p>
                        <p class="text-xl font-semibold"><%= player.getHeight() %></p>
                    </div>
                    <div class="space-y-2">
                        <p class="text-gray-600">Weight</p>
                        <p class="text-xl font-semibold"><%= player.getWeight() %></p>
                    </div>
                    <div class="space-y-2">
                        <p class="text-gray-600">College</p>
                        <p class="text-xl font-semibold"><%= player.getCollege() %></p>
                    </div>
                    <div class="space-y-2">
                        <p class="text-gray-600">Years in NBA</p>
                        <p class="text-xl font-semibold"><%= player.getYearInNBA() %></p>
                    </div>
                </div>
                <div class="p-6 border-t">
                    <form action="AddToFavorites" method="POST">
                        <input type="hidden" name="playerName" value="<%= player.getName() %>">
                        <button type="submit" class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded">
                            Add to Favorites
                        </button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Player Stats Section -->
        <div class="bg-white shadow-lg rounded-lg overflow-hidden">
            <div class="p-6">
                <h2 class="text-2xl font-bold text-blue-600 mb-4">Player Statistics</h2>
                <table class="table-auto w-full border-collapse border border-gray-300 rounded-lg overflow-hidden">
                    <thead>
                        <tr class="bg-blue-600 text-white">
                            <th class="px-4 py-3 text-left text-sm font-medium">Attribute</th>
                            <th class="px-4 py-3 text-right text-sm font-medium">Value</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-200">
                        <tr class="hover:bg-gray-100">
                            <td class="px-4 py-3 text-gray-700">PPG</td>
                            <td class="px-4 py-3 text-right text-gray-900 font-semibold"><%= request.getAttribute("ppg") != null ? request.getAttribute("ppg") : "N/A" %></td>
                        </tr>
                        <tr class="bg-gray-50 hover:bg-gray-100">
                            <td class="px-4 py-3 text-gray-700">APG</td>
                            <td class="px-4 py-3 text-right text-gray-900 font-semibold"><%= request.getAttribute("apg") != null ? request.getAttribute("apg") : "N/A" %></td>
                        </tr>
                        <tr class="hover:bg-gray-100">
                            <td class="px-4 py-3 text-gray-700">BPG</td>
                            <td class="px-4 py-3 text-right text-gray-900 font-semibold"><%= request.getAttribute("bpg") != null ? request.getAttribute("bpg") : "N/A" %></td>
                        </tr>
                        <tr class="bg-gray-50 hover:bg-gray-100">
                            <td class="px-4 py-3 text-gray-700">SPG</td>
                            <td class="px-4 py-3 text-right text-gray-900 font-semibold"><%= request.getAttribute("spg") != null ? request.getAttribute("spg") : "N/A" %></td>
                        </tr>
                        <tr class="hover:bg-gray-100">
                            <td class="px-4 py-3 text-gray-700">RPG</td>
                            <td class="px-4 py-3 text-right text-gray-900 font-semibold"><%= request.getAttribute("rpg") != null ? request.getAttribute("rpg") : "N/A" %></td>
                        </tr>
                        <tr class="bg-gray-50 hover:bg-gray-100">
                            <td class="px-4 py-3 text-gray-700">FT%</td>
                            <td class="px-4 py-3 text-right text-gray-900 font-semibold"><%= request.getAttribute("ft") != null ? request.getAttribute("ft") : "N/A" %></td>
                        </tr>
                        <tr class="hover:bg-gray-100">
                            <td class="px-4 py-3 text-gray-700">3PT%</td>
                            <td class="px-4 py-3 text-right text-gray-900 font-semibold"><%= request.getAttribute("threept") != null ? request.getAttribute("threept") : "N/A" %></td>
                        </tr>
                        <tr class="bg-gray-50 hover:bg-gray-100">
                            <td class="px-4 py-3 text-gray-700">TOPG</td>
                            <td class="px-4 py-3 text-right text-gray-900 font-semibold"><%= request.getAttribute("topg") != null ? request.getAttribute("topg") : "N/A" %></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
