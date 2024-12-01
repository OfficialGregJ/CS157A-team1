<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Team" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NBA Team Search</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<jsp:include page="header.jsp" />
<body class="bg-gray-100">
    <div class="container mx-auto px-4 py-8">
        <h1 class="text-3xl font-bold mb-6">NBA Team Search</h1>
        <form action="${pageContext.request.contextPath}/searchTeams" method="get" class="mb-8">
            <div class="flex flex-wrap -mx-2 mb-4">
                <div class="w-full md:w-1/2 px-2 mb-4 md:mb-0">
                    <label for="name" class="block mb-2 font-bold">Team Name:</label>
                    <input type="text" id="name" name="name" class="w-full px-3 py-2 border rounded" value="<%= request.getParameter("name") != null ? request.getParameter("name") : "" %>">
                </div>
                <div class="w-full md:w-1/2 px-2">
                    <label for="city" class="block mb-2 font-bold">City:</label>
                    <input type="text" id="city" name="city" class="w-full px-3 py-2 border rounded" value="<%= request.getParameter("city") != null ? request.getParameter("city") : "" %>">
                </div>
            </div>
            <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">Search</button>
        </form>

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
                    List<com.Team> teams = (List<com.Team>)request.getAttribute("teams");
                                        if (teams != null && !teams.isEmpty()) {
                                            for (com.Team team : teams) {
                    %>
                        <tr class="border-b border-gray-200 hover:bg-gray-100">
                            <td class="py-3 px-6 text-left whitespace-nowrap">
                                <a href="${pageContext.request.contextPath}/teamProfile?name=<%= java.net.URLEncoder.encode(team.getName(), "UTF-8") %>" class="font-medium text-blue-600 hover:underline"><%= team.getName() %></a>
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