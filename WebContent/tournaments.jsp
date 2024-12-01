<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NBA Tournaments</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<jsp:include page="header.jsp" />

<body class="bg-gray-100 min-h-screen">
    <!-- Main Content -->
    <div class="flex flex-col items-center p-6">
        <h1 class="text-3xl font-bold text-blue-600 mb-6">NBA Postseason</h1>

        <%
            // Check if the tournamentNames attribute is null
            if (request.getAttribute("tournamentNames") == null) {
                response.sendRedirect("TournamentServlet");
                return;
            }

            // Fetch the list of tournament names
            List<String> tournamentNames = (List<String>) request.getAttribute("tournamentNames");
            if (tournamentNames != null && !tournamentNames.isEmpty()) {
        %>
            <ul class="w-full max-w-md space-y-4">
                <% for (String tournamentName : tournamentNames) { %>
                    <li class="bg-white rounded-lg shadow-md transition-transform duration-200 hover:transform hover:-translate-y-1">
                        <a href="TournamentServlet?tournamentName=<%= tournamentName %>" 
                           class="block py-4 px-6 text-blue-600 hover:text-blue-800 hover:underline">
                            <%= tournamentName %>
                        </a>
                    </li>
                <% } %>
            </ul>
        <% } else { %>
            <p class="text-center text-gray-500 italic">No tournaments available.</p>
        <% } %>
    </div>
</body>
</html>
