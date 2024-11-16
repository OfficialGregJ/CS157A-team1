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
<body class="bg-gray-100 font-sans">
    <% Player player = (Player) request.getAttribute("player"); %> <!-- Player cannot be resolved to a type -->
    <div class="container mx-auto px-4 py-8">
        <div class="bg-white shadow-lg rounded-lg overflow-hidden">
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
            </div>
        </div>
    </div>
</body>
</html>