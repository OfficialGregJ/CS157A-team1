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
    <div class="flex items-center justify-center min-h-[calc(100vh-64px)] p-6">
        <div class="bg-white rounded-lg shadow-md p-6 w-full max-w-lg">
            <h1 class="text-3xl font-bold text-center text-blue-600 mb-6">NBA Game Details</h1>

            <%
                String date = (String) request.getAttribute("date");
                String team1 = (String) request.getAttribute("team1");
                String team2 = (String) request.getAttribute("team2");
                String winner = (String) request.getAttribute("winner");
                String loser = (String) request.getAttribute("loser");
                String location = (String) request.getAttribute("location");
                
                Integer team1Pts = (Integer) request.getAttribute("team1Pts");
                Integer team2Pts = (Integer) request.getAttribute("team2Pts");
                Integer team1Rebounds = (Integer) request.getAttribute("team1Rebounds");
                Integer team2Rebounds = (Integer) request.getAttribute("team2Rebounds");
                Integer team1Assists = (Integer) request.getAttribute("team1Assists");
                Integer team2Assists = (Integer) request.getAttribute("team2Assists");
                Integer team1Blocks = (Integer) request.getAttribute("team1Blocks");
                Integer team2Blocks = (Integer) request.getAttribute("team2Blocks");
                Double team1FT = (Double) request.getAttribute("team1FT");
                Double team2FT = (Double) request.getAttribute("team2FT");
                Double team13PT = (Double) request.getAttribute("team13PT");
                Double team23PT = (Double) request.getAttribute("team23PT");
                Integer team1TO = (Integer) request.getAttribute("team1TO");
                Integer team2TO = (Integer) request.getAttribute("team2TO");

                if (date != null && team1 != null && team2 != null) {
            %>
                <div class="space-y-4">
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
                    
                    <hr class="my-4">

                    <h2 class="text-3xl font-bold text-center text-blue-600 mb-6">NBA Game Statistics</h2>
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
            <%
                } else {
            %>
                <p class="text-center text-red-500">Game details not found.</p>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>
