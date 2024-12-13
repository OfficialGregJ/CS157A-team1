<%@ page import="java.util.List" %>
<%@ page import="com.PlayerDao" %>

<%
    PlayerDao playerDao = new PlayerDao();
    List<String> players = playerDao.getAllPlayerNames(); // Fetch all player names
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Manage Players</title>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto p-4">
        <!-- Page Header -->
        <div class="flex justify-between items-center mb-6">
            <h1 class="text-3xl font-bold text-gray-800">Manage Players</h1>
            <a href="index.jsp" class="bg-gray-800 text-white px-4 py-2 rounded hover:bg-gray-700">Back to Home</a>
        </div>

        <!-- Add Player Form -->
        <div class="bg-white p-6 rounded-lg shadow-md mb-6">
            <h2 class="text-xl font-semibold text-gray-800 mb-4">Add a New Player</h2>
            <form action="AddPlayerServlet" method="post" class="space-y-4">
                <div>
                    <label for="name" class="block text-gray-700">Player Name</label>
                    <input type="text" name="name" id="name" required class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="team" class="block text-gray-700">Team</label>
                    <input type="text" name="team" id="team" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="position" class="block text-gray-700">Position</label>
                    <input type="text" name="position" id="position" class="w-full border rounded px-3 py-2">
                </div>
                <div class="grid grid-cols-2 gap-4">
                    <div>
                        <label for="age" class="block text-gray-700">Age</label>
                        <input type="number" name="age" id="age" class="w-full border rounded px-3 py-2">
                    </div>
                    <div>
                        <label for="yearInNBA" class="block text-gray-700">Years in NBA</label>
                        <input type="number" name="yearInNBA" id="yearInNBA" class="w-full border rounded px-3 py-2">
                    </div>
                </div>
                <div class="grid grid-cols-2 gap-4">
                    <div>
                        <label for="height" class="block text-gray-700">Height</label>
                        <input type="text" name="height" id="height" class="w-full border rounded px-3 py-2">
                    </div>
                    <div>
                        <label for="weight" class="block text-gray-700">Weight</label>
                        <input type="number" step="0.1" name="weight" id="weight" class="w-full border rounded px-3 py-2">
                    </div>
                </div>
                <div>
                    <label for="college" class="block text-gray-700">College</label>
                    <input type="text" name="college" id="college" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <label for="imageUrl" class="block text-gray-700">Image URL</label>
                    <input type="text" name="imageUrl" id="imageUrl" class="w-full border rounded px-3 py-2">
                </div>
                <div>
                    <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
                        Add Player
                    </button>
                </div>
            </form>
        </div>

        <!-- List of Players -->
        <div class="bg-white p-6 rounded-lg shadow-md">
            <h2 class="text-xl font-semibold text-gray-800 mb-4">Existing Players</h2>
            <ul class="divide-y divide-gray-200">
                <% for (String player : players) { %>
                    <li class="py-4 flex justify-between items-center">
                        <span class="text-gray-700 font-medium"><%= player %></span>
                        <div class="space-x-2">
                            <!-- Edit Button -->
                            <a href="editPlayer.jsp?name=<%= player %>" class="text-blue-500 hover:text-blue-700 font-semibold">Edit</a>
                            <!-- Delete Button -->
                            <form action="DeletePlayerServlet" method="post" class="inline">
                                <input type="hidden" name="name" value="<%= player %>">
                                <button type="submit" class="text-red-500 hover:text-red-700 font-semibold">
                                    Delete
                                </button>
                            </form>
                        </div>
                    </li>
                <% } %>
            </ul>
        </div>
    </div>
</body>
</html>
