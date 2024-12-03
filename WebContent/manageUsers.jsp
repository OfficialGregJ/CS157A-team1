<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.UserDao, com.User, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">
    <div class="container mx-auto py-8">
        <!-- Back to Dashboard Button -->
        <div class="flex justify-center mb-6">
            <a href="adminPage.jsp" 
               class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                Back to Dashboard
            </a>
        </div>

        <h1 class="flex text-3xl justify-center font-bold mb-6">Manage Users</h1>

        <%
            UserDao userDao = new UserDao();
            List<User> users = userDao.getAllUsers();
        %>

        <!-- User Table -->
        <table class="min-w-full bg-white shadow-md rounded-lg">
            <thead>
                <tr>
                    <th class="px-4 py-2">Username</th>
                    <th class="px-4 py-2">Email</th>
                    <th class="px-4 py-2">Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (User user : users) { %>
                    <tr>
                        <td class="border px-4 py-2"><%= user.getUname() %></td>
                        <td class="border px-4 py-2"><%= user.getEmail() %></td>
                        <td class="border px-4 py-2">
                            <form action="DeleteUserServlet" method="POST" class="inline">
                                <input type="hidden" name="username" value="<%= user.getUname() %>">
                                <button type="submit" class="text-red-500 hover:underline">Delete</button>
                            </form>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
