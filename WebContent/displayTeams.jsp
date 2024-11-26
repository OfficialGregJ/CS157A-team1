<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NBA Team List</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center p-4">
    <div class="bg-white rounded-lg shadow-md p-6 w-full max-w-md">
        <h1 class="text-3xl font-bold mb-6 text-center text-blue-600">NBA Team List</h1>
        <ul class="space-y-2">

			    if (request.getAttribute("teamNames") == null) {
			        response.sendRedirect("TeamServlet");
			        return;
			    }
			%>

            <%
                List<String> teamNames = (List<String>) request.getAttribute("teamNames");
                if (teamNames != null && !teamNames.isEmpty()) {
                    for (String teamName : teamNames) {
            %>
                <li>
                    <a href="TeamServlet?team=<%= teamName %>" 
                       class="block py-2 px-4 rounded transition duration-300 ease-in-out hover:bg-blue-100 text-blue-600 hover:text-blue-800">
                        <%= teamName %>
                    </a>
                </li>
            <%
                    }
                } else {
            %>
                <li class="text-center text-gray-500 italic py-2">No teams available</li>
            <%
                }
            %>
        </ul>
    </div>
</body>
</html>