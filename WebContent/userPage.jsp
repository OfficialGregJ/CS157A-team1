<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="DatabaseConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deep Drive - User Home</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
</head>
<body class="bg-gray-100 min-h-screen">
    <nav class="bg-blue-600 text-white p-4">
        <div class="container mx-auto flex justify-between items-center">
            <div class="flex items-center space-x-2">
                <i data-lucide="activity" class="w-8 h-8"></i>
                <span class="text-2xl font-bold">Deep Drive</span>
            </div>
            <div class="flex items-center space-x-4">
                <a href="/DeepDrive/userPage.jsp" class="hover:text-blue-200">Dashboard</a>
                <a href="/DeepDrive/userLogin.jsp" class="hover:text-blue-200">Logout</a>
            </div>
        </div>
    </nav>

    <main class="container mx-auto mt-8 px-4">
        <h1 class="text-3xl font-bold mb-6">Welcome, <%= session.getAttribute("userUsername") %>!</h1>

        <section class="bg-white rounded-lg shadow-md p-6 mb-8">
            <h2 class="text-2xl font-semibold mb-4 flex items-center">
                <i data-lucide="star" class="w-6 h-6 mr-2 text-yellow-500"></i>
                Favorites
            </h2>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                    <h3 class="text-xl font-semibold mb-2">Teams</h3>
                    <ul class="space-y-2">
                        <li class="flex items-center">
                            <i data-lucide="shield" class="w-5 h-5 mr-2 text-blue-500"></i>
                            Los Angeles Lakers
                        </li>
                        <li class="flex items-center">
                            <i data-lucide="shield" class="w-5 h-5 mr-2 text-green-500"></i>
                            Boston Celtics
                        </li>
                        <li class="flex items-center">
                            <i data-lucide="shield" class="w-5 h-5 mr-2 text-red-500"></i>
                            Chicago Bulls
                        </li>
                    </ul>
                </div>
                <div>
                    <h3 class="text-xl font-semibold mb-2">Players</h3>
                    <ul class="space-y-2">
                        <%
                        String username = (String) session.getAttribute("userUsername");
                        List<String> favoritePlayers = DatabaseConnection.getFavoritePlayers(username);
                        for (String playerName : favoritePlayers) {
                        %>
                        <li class="flex items-center">
                            <i data-lucide="user" class="w-5 h-5 mr-2 text-purple-500"></i>
                            <a href="PlayerProfile?name=<%= playerName %>" class="hover:text-blue-500"><%= playerName %></a>
                        </li>
                        <%
                        }
                        %>
                    </ul>
                </div>
            </div>
        </section>

        <section class="bg-white rounded-lg shadow-md p-6">
            <h2 class="text-2xl font-semibold mb-4 flex items-center">
                <i data-lucide="trending-up" class="w-6 h-6 mr-2 text-green-500"></i>
                Recent Analytics
            </h2>
            <p class="text-gray-600 mb-4">Here's a quick overview of your recent analytics:</p>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                <div class="bg-blue-100 p-4 rounded-lg">
                    <h3 class="font-semibold mb-2">Points per Game</h3>
                    <p class="text-2xl font-bold">24.7</p>
                </div>
                <div class="bg-green-100 p-4 rounded-lg">
                    <h3 class="font-semibold mb-2">Assists per Game</h3>
                    <p class="text-2xl font-bold">7.2</p>
                </div>
                <div class="bg-yellow-100 p-4 rounded-lg">
                    <h3 class="font-semibold mb-2">Rebounds per Game</h3>
                    <p class="text-2xl font-bold">10.1</p>
                </div>
            </div>
        </section>
    </main>

    <script>
        lucide.createIcons();
    </script>
</body>
</html>