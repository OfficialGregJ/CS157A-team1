<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.DashboardDao" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
</head>
<body class="bg-gray-100 min-h-screen">
<jsp:include page="header.jsp" />

<%
    DashboardDao dashboardDao = new DashboardDao();
    int totalUsers = dashboardDao.getUserCount();
    int totalPlayers = dashboardDao.getPlayerCount();
    int totalTournaments = dashboardDao.getTournamentCount();
    int totalTeams = dashboardDao.getTeamCount();
%>

    <main class="container mx-auto mt-8 px-4">
        <h1 class="text-3xl font-bold mb-6">Welcome, Admin <%= session.getAttribute("adminUsername") %>!</h1>

        <!-- Dashboard Section -->
        <section class="bg-white rounded-lg shadow-md p-6 mb-8">
            <h2 class="text-2xl font-semibold mb-4 flex items-center">
                <i data-lucide="settings" class="w-6 h-6 mr-2 text-yellow-500"></i>
                Admin Dashboard
            </h2>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <a href="manageUsers.jsp" class="block bg-blue-100 p-4 rounded-lg shadow-md hover:bg-blue-200">
                   <h3 class="font-semibold mb-2">User Management</h3>
                   <p>Manage users: view, add, edit, or delete users.</p>
                </a>
                <a href="manageFavorites.jsp" class="block bg-green-100 p-4 rounded-lg shadow-md hover:bg-green-200">
                    <h3 class="font-semibold mb-2">Teams Management</h3>
                    <p>Add, edit, or delete teams.</p>
                </a>
                <a href="manageTournaments.jsp" class="block bg-yellow-100 p-4 rounded-lg shadow-md hover:bg-yellow-200">
                    <h3 class="font-semibold mb-2">Tournament Management</h3>
                    <p>Add, edit, or delete tournaments.</p>
                </a>
                <a href="managePlayers.jsp" class="block bg-purple-100 p-4 rounded-lg shadow-md hover:bg-purple-200">
                    <h3 class="font-semibold mb-2">Player Management</h3>
                    <p>Add, edit, or delete player details.</p>
                </a>
            </div>
        </section>

         <!-- System Overview Section -->
	    <section class="bg-white rounded-lg shadow-md p-6">
	        <h2 class="text-2xl font-semibold mb-4 flex items-center">
	            <i data-lucide="activity" class="w-6 h-6 mr-2 text-green-500"></i>
	            System Overview
	        </h2>
	        <p class="text-gray-600 mb-4">Here's a quick summary of the system:</p>
	        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
	            <div class="bg-blue-100 p-4 rounded-lg">
	                <h3 class="font-semibold mb-2">Total Users</h3>
	                <p class="text-2xl font-bold"><%= totalUsers %></p>
	            </div>
	            <div class="bg-green-100 p-4 rounded-lg">
	                <h3 class="font-semibold mb-2">Total Players</h3>
	                <p class="text-2xl font-bold"><%= totalPlayers %></p>
	            </div>
	            <div class="bg-yellow-100 p-4 rounded-lg">
	                <h3 class="font-semibold mb-2">Total Tournaments</h3>
	                <p class="text-2xl font-bold"><%= totalTournaments %></p>
	            </div>
	            <div class="bg-red-100 p-4 rounded-lg">
	                <h3 class="font-semibold mb-2">Total Teams</h3>
	                <p class="text-2xl font-bold"><%= totalTeams %></p>
	            </div>
	        </div>
	    </section>
	</main>

    <script>
        lucide.createIcons();
    </script>
</body>
</html>
