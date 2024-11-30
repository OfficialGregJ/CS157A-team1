<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NBA Player List</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<jsp:include page="header.jsp" />

<body class="bg-gray-100 font-sans min-h-screen">
    <!-- Main Content -->
    <div class="flex flex-col items-center p-6">
        <h1 class="text-4xl font-bold text-orange-500 mb-8 text-center shadow-text">NBA Player List</h1>
        <%
            if (request.getAttribute("playerNames") == null) {
                response.sendRedirect("players");
                return;
            }
        %>
        <%
            @SuppressWarnings("unchecked")
            List<String> playerNames = (List<String>) request.getAttribute("playerNames");
            if (playerNames != null && !playerNames.isEmpty()) {
        %>
        <ul class="w-full max-w-md space-y-4">
            <% for (String playerName : playerNames) { %>
            <li class="bg-white rounded-lg shadow-md transition-transform duration-200 hover:transform hover:-translate-y-1">
                <a href="playerProfile?name=<%= URLEncoder.encode(playerName, "UTF-8") %>" 
                   class="block w-full p-4 text-blue-600 hover:text-blue-800 hover:underline">
                    <%= playerName %>
                </a>
            </li>
            <% } %>
        </ul>
        <%
            } else {
        %>
        <p class="text-red-500 text-center">No players found or the list is empty.</p>
        <%
            }
        %>
    </div>

    <style>
        .shadow-text {
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
        }
    </style>
</body>
</html>
