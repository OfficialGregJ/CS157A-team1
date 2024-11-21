<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Team Stats</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex flex-col items-center p-6">
    <h1 class="text-4xl font-bold mb-8 text-gray-800 text-center">Team Stats</h1>
    
     <!-- Form to Select Team -->
    <form action="TeamStatsServlet" method="get" class="mb-8 bg-white p-6 rounded-lg shadow-md max-w-md w-full">
        <label for="team" class="block text-lg font-medium text-gray-700 text-center mb-4">Select a Team:</label>
        <div class="flex flex-col items-center gap-4">
            <select id="team" name="team" required class="w-full max-w-sm px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500">
            	<%
			    if (request.getAttribute("teamNames") == null) {
			        response.sendRedirect("TeamStatsServlet");
			        return;
			    }
				%>
                <% 
                    // Fetch the team names from the request attribute
                    List<String> teamNames = (List<String>) request.getAttribute("teamNames");
                	String selectedTeam = request.getParameter("team");
                    if (teamNames != null && !teamNames.isEmpty()) {
                        for (String teamName : teamNames) {
                %>
                            <option value="<%= teamName %>" <%= teamName.equals(selectedTeam) ? "selected" : "" %>><%= teamName %></option>
                <%
                        }
                    } else {
                %>
                        <option value="" disabled>No teams available</option>
                <%
                    }
                %>
            </select>
            <button type="submit" class="px-8 py-2 bg-blue-600 text-white font-semibold rounded-md hover:bg-blue-700 focus:ring-4 focus:ring-blue-300 transition">
                Retrieve Stats
            </button>
        </div>
    </form>

    <!-- Stats Table -->
    <div id="stats" class="bg-white rounded-lg shadow-md p-6 w-full max-w-2xl">
    <h2 class="text-2xl font-semibold text-gray-800 mb-4 text-center">Team Statistics</h2>
    <table class="table-auto w-full border-collapse border border-gray-300 rounded-lg overflow-hidden">
        <thead>
            <tr class="bg-blue-600 text-white">
                <th class="px-4 py-3 text-left text-sm font-medium">Attribute</th>
                <th class="px-4 py-3 text-right text-sm font-medium">Value</th>
            </tr>
        </thead>
        <tbody class="divide-y divide-gray-200">
            <tr class="hover:bg-gray-100">
                <td class="px-4 py-3 text-gray-700">PPG</td>
                <td class="px-4 py-3 text-right text-gray-900 font-semibold"><%= request.getAttribute("ppg") != null ? request.getAttribute("ppg") : "N/A" %></td>
            </tr>
            <tr class="bg-gray-50 hover:bg-gray-100">
                <td class="px-4 py-3 text-gray-700">APG</td>
                <td class="px-4 py-3 text-right text-gray-900 font-semibold"><%= request.getAttribute("apg") != null ? request.getAttribute("apg") : "N/A" %></td>
            </tr>
            <tr class="hover:bg-gray-100">
                <td class="px-4 py-3 text-gray-700">SPG</td>
                <td class="px-4 py-3 text-right text-gray-900 font-semibold"><%= request.getAttribute("spg") != null ? request.getAttribute("spg") : "N/A" %></td>
            </tr>
            <tr class="bg-gray-50 hover:bg-gray-100">
                <td class="px-4 py-3 text-gray-700">BPG</td>
                <td class="px-4 py-3 text-right text-gray-900 font-semibold"><%= request.getAttribute("bpg") != null ? request.getAttribute("bpg") : "N/A" %></td>
            </tr>
            <tr class="hover:bg-gray-100">
                <td class="px-4 py-3 text-gray-700">TOPG</td>
                <td class="px-4 py-3 text-right text-gray-900 font-semibold"><%= request.getAttribute("topg") != null ? request.getAttribute("topg") : "N/A" %></td>
            </tr>
            <tr class="bg-gray-50 hover:bg-gray-100">
                <td class="px-4 py-3 text-gray-700">FT%</td>
                <td class="px-4 py-3 text-right text-gray-900 font-semibold"><%= request.getAttribute("ft") != null ? request.getAttribute("ft") : "N/A" %></td>
            </tr>
            <tr class="hover:bg-gray-100">
                <td class="px-4 py-3 text-gray-700">3PT%</td>
                <td class="px-4 py-3 text-right text-gray-900 font-semibold"><%= request.getAttribute("threept") != null ? request.getAttribute("threept") : "N/A" %></td>
            </tr>
            <tr class="bg-gray-50 hover:bg-gray-100">
                <td class="px-4 py-3 text-gray-700">Games Played</td>
                <td class="px-4 py-3 text-right text-gray-900 font-semibold"><%= request.getAttribute("gamesPlayed") != null ? request.getAttribute("gamesPlayed") : "N/A" %></td>
            </tr>
            <tr class="hover:bg-gray-100">
                <td class="px-4 py-3 text-gray-700">Wins</td>
                <td class="px-4 py-3 text-right text-gray-900 font-semibold"><%= request.getAttribute("wins") != null ? request.getAttribute("wins") : "N/A" %></td>
            </tr>
            <tr class="bg-gray-50 hover:bg-gray-100">
                <td class="px-4 py-3 text-gray-700">Losses</td>
                <td class="px-4 py-3 text-right text-gray-900 font-semibold"><%= request.getAttribute("losses") != null ? request.getAttribute("losses") : "N/A" %></td>
            </tr>
        </tbody>
    </table>
</div>

</body>
</html>
