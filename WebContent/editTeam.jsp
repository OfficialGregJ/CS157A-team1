<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.TeamDao, com.Team" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Team</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">
    <div class="container mx-auto py-8">
        <h1 class="text-3xl font-bold mb-6">Edit Team</h1>

        <%
            String teamName = request.getParameter("team");
            TeamDao teamDao = new TeamDao();
            Team team = teamDao.getTeamDetails(teamName);
        %>

        <form action="EditTeamServlet" method="POST" class="bg-white p-6 rounded shadow-md">
            <input type="hidden" name="originalName" value="<%= team != null ? team.getName() : "" %>">

            <div class="mb-4">
                <label for="name" class="block text-sm font-medium text-gray-700">Team Name</label>
                <input type="text" id="name" name="name" 
                    value="<%= team != null ? team.getName() : "" %>" 
                    class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm" required>
            </div>

            <div class="mb-4">
                <label for="city" class="block text-sm font-medium text-gray-700">City</label>
                <input type="text" id="city" name="city" 
                    value="<%= team != null ? team.getCity() : "" %>" 
                    class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
            </div>

            <div class="mb-4">
                <label for="stadium" class="block text-sm font-medium text-gray-700">Stadium</label>
                <input type="text" id="stadium" name="stadium" 
                    value="<%= team != null ? team.getStadium() : "" %>" 
                    class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
            </div>

            <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
                Save Changes
            </button>
            <a href="manageTeams.jsp" class="ml-4 text-blue-500 hover:underline">Cancel</a>
        </form>
    </div>
</body>
</html>
