<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NBA Games</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex flex-col items-center p-6">
    <h1 class="text-3xl font-bold text-blue-600 mb-6">NBA Games</h1>

    <%
        // Check if the gameDates attribute is null
        if (request.getAttribute("gameDates") == null) {
            response.sendRedirect("GamesServlet");
            return;
        }

        // Fetch the list of game dates
        List<String> gameDates = (List<String>) request.getAttribute("gameDates");
        if (gameDates != null && !gameDates.isEmpty()) {
    %>
        <ul class="w-full max-w-md space-y-4">
            <% for (String date : gameDates) { %>
                <li class="bg-white rounded-lg shadow-md transition-transform duration-200 hover:transform hover:-translate-y-1">
                    <a href="GamesServlet?date=<%= date %>" 
                       class="block py-4 px-6 text-blue-600 hover:text-blue-800 hover:underline">
                        NBA Games on <%= date %>
                    </a>
                </li>
            <% } %>
        </ul>
    <% } else { %>
        <p class="text-center text-gray-500 italic">No games available.</p>
    <% } %>
</body>
</html>
