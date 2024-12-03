<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <h1 class="text-3xl font-bold text-center text-blue-600 mb-6">NBA Game Details</h1>

        <%
        Integer gameCount = (Integer) request.getAttribute("gameCount");
        if (gameCount != null && gameCount > 0) {
            for (int i = 1; i <= gameCount; i++) {
                String date = (String) request.getAttribute("game" + i + "_date");
                String team1 = (String) request.getAttribute("game" + i + "_team1");
                String team2 = (String) request.getAttribute("game" + i + "_team2");
                String winner = (String) request.getAttribute("game" + i + "_winner");
                String loser = (String) request.getAttribute("game" + i + "_loser");
                String location = (String) request.getAttribute("game" + i + "_location");
                String videoUrl = (String) request.getAttribute("game" + i + "_videoUrl");
                Integer team1Pts = (Integer) request.getAttribute("game" + i + "_team1Pts");
                Integer team2Pts = (Integer) request.getAttribute("game" + i + "_team2Pts");
                Integer team1Rebounds = (Integer) request.getAttribute("game" + i + "_team1Rebounds");
                Integer team2Rebounds = (Integer) request.getAttribute("game" + i + "_team2Rebounds");
                Integer team1Assists = (Integer) request.getAttribute("game" + i + "_team1Assists");
                Integer team2Assists = (Integer) request.getAttribute("game" + i + "_team2Assists");
                Integer team1Blocks = (Integer) request.getAttribute("game" + i + "_team1Blocks");
                Integer team2Blocks = (Integer) request.getAttribute("game" + i + "_team2Blocks");
                Double team1FT = (Double) request.getAttribute("game" + i + "_team1FT");
                Double team2FT = (Double) request.getAttribute("game" + i + "_team2FT");
                Double team13PT = (Double) request.getAttribute("game" + i + "_team13PT");
                Double team23PT = (Double) request.getAttribute("game" + i + "_team23PT");
                Integer team1TO = (Integer) request.getAttribute("game" + i + "_team1TO");
                Integer team2TO = (Integer) request.getAttribute("game" + i + "_team2TO");
        %>

        <!-- Flexbox Layout -->
        <div class="flex flex-col lg:flex-row gap-6">
            <!-- Game Details Box -->
            <div class="bg-white rounded-lg shadow-md p-6 mt-6 w-full lg:w-1/2 space-y-4">
                <h2 class="text-2xl font-bold text-blue-600 mb-4">Game Details</h2>
                <p class="text-gray-600">
                    <span class="font-medium">Date:</span> <%= date %>
                </p>
                <p class="text-gray-600">
                    <span class="font-medium">Teams:</span> <%= team1 %> vs <%= team2 %>
                </p>
                <p class="text-gray-600">
                    <span class="font-medium">Winner:</span> <%= winner %>
                </p>
                <p class="text-gray-600">
                    <span class="font-medium">Loser:</span> <%= loser %>
                </p>
                <p class="text-gray-600">
                    <span class="font-medium">Location:</span> <%= location %>
                </p>
                <% if (videoUrl != null && !videoUrl.isEmpty()) { %>
		        <div class="mt-4">
		            <h3 class="text-xl font-semibold mb-2">Watch the Game</h3>
		            <% if (videoUrl.contains("youtube.com") || videoUrl.contains("youtu.be")) { %>
		                <!-- Embed YouTube Video -->
		                <iframe width="100%" height="315" 
		                        src="<%= videoUrl.replace("watch?v=", "embed/") %>" 
		                        frameborder="0" 
		                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
		                        allowfullscreen>
		                </iframe>
		            <% } else { %>
		                <!-- Embed MP4 Video -->
		                <video controls width="100%">
		                    <source src="<%= videoUrl %>" type="video/mp4">
		                    Your browser does not support the video tag.
		                </video>
		            <% } %>
		        </div>
		    <% } else { %>
		        <p class="italic text-gray-500">No video available for this game.</p>
		    <% } %>
            </div>

            <!-- Game Statistics Box -->
            <div class="bg-white rounded-lg shadow-md p-6 mt-6 w-full lg:w-1/2 space-y-4">
                <h2 class="text-2xl font-bold text-blue-600 mb-4">NBA Game Statistics</h2>
                <p class="text-gray-600">
                    <span class="font-medium"><%= team1 %> Points:</span> <%= team1Pts %>
                </p>
                <p class="text-gray-600">
                    <span class="font-medium"><%= team2 %> Points:</span> <%= team2Pts %>
                </p>
                <p class="text-gray-600">
                    <span class="font-medium">Rebounds:</span> <%= team1 %> (<%= team1Rebounds %>) vs <%= team2 %> (<%= team2Rebounds %>)
                </p>
                <p class="text-gray-600">
                    <span class="font-medium">Assists:</span> <%= team1 %> (<%= team1Assists %>) vs <%= team2 %> (<%= team2Assists %>)
                </p>
                <p class="text-gray-600">
                    <span class="font-medium">Blocks:</span> <%= team1 %> (<%= team1Blocks %>) vs <%= team2 %> (<%= team2Blocks %>)
                </p>
                <p class="text-gray-600">
                    <span class="font-medium">Free Throw %:</span> <%= team1 %> (<%= Math.round(team1FT * 100) %>%) vs <%= team2 %> (<%= Math.round(team2FT * 100) %>%)
                </p>
                <p class="text-gray-600">
                    <span class="font-medium">3PT %:</span> <%= team1 %> (<%= Math.round(team13PT * 100) %>%) vs <%= team2 %> (<%= Math.round(team23PT * 100) %>%)
                </p>
                <p class="text-gray-600">
                    <span class="font-medium">Turnovers:</span> <%= team1 %> (<%= team1TO %>) vs <%= team2 %> (<%= team2TO %>)
                </p>
            </div>
        </div>

        <%
            }
            } else {
        %>
            <p class="text-center text-red-500">Game details not found.</p>
        <%
            }
        %>
    </div>
</body>
</html>
