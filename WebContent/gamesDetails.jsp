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
