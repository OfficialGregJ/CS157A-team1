<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deep Drive - Homepage</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
</head>
<body class="bg-gradient-to-br from-blue-500 to-green-500 min-h-screen flex flex-col">
<!-- Header -->
<jsp:include page="header.jsp" />



    <!-- Main Content -->
    <main class="container mx-auto flex-grow py-8 px-4">
        <section class="text-center mb-8">
            <h2 class="text-4xl font-bold text-gray-800 mb-4">Welcome to Deep Drive</h2>
            <p class="text-lg text-gray-600">Navigate through our features and manage your NBA teams and players.</p>
        </section>
        <section class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            

            <!-- Team Details -->
            <div class="bg-white p-6 rounded-lg shadow-lg text-center">
                <h3 class="text-xl font-semibold text-gray-800 mb-4">NBA Team Details</h3>
                <p class="text-gray-600 mb-4">View detailed statistics about NBA teams.</p>
                <a href="displayTeams.jsp" class="inline-block px-6 py-2 bg-green-600 text-white rounded-md hover:bg-green-700 transition">
                    View Teams
                </a>
            </div>

            <!-- Players -->
            <div class="bg-white p-6 rounded-lg shadow-lg text-center">
                <h3 class="text-xl font-semibold text-gray-800 mb-4">NBA Players</h3>
                <p class="text-gray-600 mb-4">Explore NBA player profiles and stats.</p>
                <a href="players.jsp" class="inline-block px-6 py-2 bg-purple-600 text-white rounded-md hover:bg-purple-700 transition">
                    View Players
                </a>
            </div>

            <!-- NBA Team Stats -->
            <div class="bg-white p-6 rounded-lg shadow-lg text-center">
                <h3 class="text-xl font-semibold text-gray-800 mb-4">NBA Team Stats</h3>
                <p class="text-gray-600 mb-4">Analyze NBA team performance statistics.</p>
                <a href="teamStats.jsp" class="inline-block px-6 py-2 bg-red-600 text-white rounded-md hover:bg-red-700 transition">
                    View Stats
                </a>
            </div>
            
            <!-- NBA Team Games -->
            <div class="bg-white p-6 rounded-lg shadow-lg text-center">
                <h3 class="text-xl font-semibold text-gray-800 mb-4">NBA Team Games</h3>
                <p class="text-gray-600 mb-4">Browse NBA game schedules and results.</p>
                <a href="games.jsp" class="inline-block px-6 py-2 bg-red-600 text-white rounded-md hover:bg-red-700 transition">
                    View Games
                </a>
            </div>

        </section>
    </main>

    <!-- Footer -->
    <footer class="bg-gray-800 text-white py-4">
        <div class="container mx-auto text-center">
            <p>&copy; 2024 Deep Drive. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
