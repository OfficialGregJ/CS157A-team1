<%@ page import="java.util.List" %>
<%@ page import="com.TournamentDao" %>

<%
    TournamentDao tournamentDao = new TournamentDao();
    List<String> tournaments = tournamentDao.getAllTournamentNames(); // Fetch all tournament names
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Manage Tournaments</title>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto p-4">
        <!-- Page Header -->
        <div class="flex justify-between items-center mb-6">
            <h1 class="text-3xl font-bold text-gray-800">Manage Tournaments</h1>
            <a href="index.jsp" class="bg-gray-800 text-white px-4 py-2 rounded hover:bg-gray-700">Back to Home</a>
        </div>

        <!-- Add Tournament Form -->
        <div class="bg-white p-6 rounded-lg shadow-md mb-6">
            <h2 class="text-xl font-semibold text-gray-800 mb-4">Add a New Tournament</h2>
            <form action="AddTournamentServlet" method="post" class="space-y-4">
                <div>
                    <label for="name" class="block text-gray-700">Tournament Name</label>
                    <input type="text" name="name" id="name" required 
                        class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>
                <div>
                    <label for="location" class="block text-gray-700">Location</label>
                    <input type="text" name="location" id="location" required 
                        class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>
                <div>
                    <label for="startDate" class="block text-gray-700">Start Date</label>
                    <input type="date" name="startDate" id="startDate" required 
                        class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>
                <div>
                    <label for="endDate" class="block text-gray-700">End Date</label>
                    <input type="date" name="endDate" id="endDate" required 
                        class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>
                <div>
                    <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
                        Add Tournament
                    </button>
                </div>
            </form>
        </div>

        <!-- List of Tournaments -->
        <div class="bg-white p-6 rounded-lg shadow-md">
            <h2 class="text-xl font-semibold text-gray-800 mb-4">Existing Tournaments</h2>
            <ul class="divide-y divide-gray-200">
                <% for (String tournament : tournaments) { %>
                    <li class="py-4 flex justify-between items-center">
                        <span class="text-gray-700 font-medium"><%= tournament %></span>
                        <div class="space-x-2">
                            <!-- Edit Button -->
                            <a href="editTournament.jsp?name=<%= tournament %>" 
                                class="text-blue-500 hover:text-blue-700 font-semibold">Edit</a>
                            <!-- Delete Button -->
                            <form action="DeleteTournamentServlet" method="post" class="inline">
                                <input type="hidden" name="name" value="<%= tournament %>">
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
