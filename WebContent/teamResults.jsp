<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Team" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NBA Team Search Results</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<jsp:include page="header.jsp" />
<body class="bg-gray-100">
    <div class="container mx-auto px-4 py-8">
        <h1 class="text-3xl font-bold mb-6">NBA Team Search Results</h1>
        <p class="mb-4">
            Showing results for: 
            <span class="font-semibold">
                <%= request.getAttribute("searchName") != null ? request.getAttribute("searchName") : "All teams" %>
            </span>
            <% if (request.getAttribute("searchCity") != null && !((String)request.getAttribute("searchCity")).isEmpty()) { %>
                , City: <span class="font-semibold"><%= request.getAttribute("searchCity") %></span>
            <% } %>
        </p>
        <a href="${pageContext.request.contextPath}/searchTeam.jsp" class="text-blue-500 hover:underline mb-4 inline-block">Back to Search</a>
        <div class="overflow-x-auto">
            <table class="w-full bg-white shadow-md rounded">
                <thead>
                    <tr class="bg-gray-200 text-gray-600 uppercase text-sm leading-normal">
                        <th class="py-3 px-6 text-left">Name</th>
                        <th class="py-3 px-6 text-left">City</th>
                        <th class="py-3 px-6 text-left">Stadium</th>
                    </tr>
                </thead>
                <tbody class="text-gray-600 text-sm font-light">
                    <%
                    List<Team> teams = (List<Team>)request.getAttribute("teams");
                    if (teams != null && !teams.isEmpty()) {
                        for (Team team : teams) {
                    %>
                        <tr class="border-b border-gray-200 hover:bg-gray-100">
                            <td class="py-3 px-6 text-left whitespace-nowrap">
                                <a href="${pageContext.request.contextPath}/TeamServlet?team=<%= java.net.URLEncoder.encode(team.getName(), "UTF-8") %>" class="font-medium text-blue-600 hover:underline"><%= team.getName() %></a>
                            </td>
                            <td class="py-3 px-6 text-left"><%= team.getCity() %></td>
                            <td class="py-3 px-6 text-left"><%= team.getStadium() %></td>
                        </tr>
                    <%
                        }
                    } else {
                    %>
                        <tr>
                            <td colspan="3" class="py-3 px-6 text-center">No teams found matching your search criteria.</td>
                        </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>