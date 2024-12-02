<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Team Details and Stats</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<!-- Include the header -->
<jsp:include page="header.jsp" />
<body class="bg-gray-100 min-h-screen">
    <div class="flex items-center justify-center min-h-[calc(100vh-64px)] p-6">
        <!-- Parent Flex Container -->
        <div class="flex flex-col lg:flex-row gap-8 w-full max-w-6xl items-start">
            <!-- Team Details Container -->
            <div class="bg-white rounded-lg shadow-md p-6 w-full lg:w-1/2">
                <h1 class="text-2xl font-bold mb-6 text-center text-blue-600">Team Details</h1>
                <%
                    String teamName = (String) request.getAttribute("teamName");
                    String city = (String) request.getAttribute("city");
                    String stadium = (String) request.getAttribute("stadium");

                    if (teamName != null) {
                %>
                    <div class="space-y-4">
                        <h2 class="text-xl font-semibold text-gray-800"><%= teamName %></h2>
                        <p class="text-gray-600">
                            <span class="font-medium">City:</span> <%= city %>
                        </p>
                        <p class="text-gray-600">
                            <span class="font-medium">Stadium:</span> <%= stadium %>
                        </p>
                    </div>
                    <div class="p-6 border-t">
	                    <form action="AddToTeamFavorites" method="POST">
						    <input type="hidden" name="teamNames" value="<%= teamName %>">
						    <button type="submit" class="bg-green-500 hover:bg-green-600 text-white font-bold py-2 px-4 rounded">
						        Add to Favorites
						    </button>
						</form>

                </div>
                <%
                    } else {
                %>
                    <p class="text-center text-gray-500 italic">Team details not found.</p>
                <%
                    }
                %>
            </div>

            <!-- Team Stats Container -->
            <div class="bg-white rounded-lg shadow-md p-6 w-full lg:w-1/2">
                <h2 class="text-2xl font-semibold text-center text-blue-600 mb-4">Team Statistics</h2>
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
        </div>
    </div>
</body>
</html>
