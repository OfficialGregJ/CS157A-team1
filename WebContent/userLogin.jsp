<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
</head>
<body class="bg-gradient-to-br from-blue-500 to-green-500 flex items-center justify-center min-h-screen p-4">
    <div class="bg-white p-8 rounded-lg shadow-xl w-full max-w-md">
        <div class="flex items-center justify-center mb-6">
            <i data-lucide="activity" class="w-12 h-12 text-blue-600 mr-2"></i>
            <h2 class="text-3xl font-bold text-gray-800">Deep Drive</h2>
        </div>
        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative mb-4" role="alert">
                <span class="block sm:inline"><%= request.getAttribute("errorMessage") %></span>
            </div>
        <% } %>
        <form action="UserLogin" method="post" class="space-y-4">
            <div>
                <label for="uname" class="block text-sm font-medium text-gray-700">Username</label>
                <div class="mt-1 relative rounded-md shadow-sm">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i data-lucide="user" class="h-5 w-5 text-gray-400"></i>
                    </div>
                    <input type="text" id="uname" name="uname" required class="pl-10 block w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                </div>
            </div>
            <div>
                <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                <div class="mt-1 relative rounded-md shadow-sm">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i data-lucide="lock" class="h-5 w-5 text-gray-400"></i>
                    </div>
                    <input type="password" id="password" name="password" required class="pl-10 block w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                </div>
            </div>
            <div>
                <button type="submit" class="w-full flex justify-center items-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition duration-150 ease-in-out">
                    <i data-lucide="log-in" class="h-5 w-5 mr-2"></i>
                    Login
                </button>
            </div>
        </form>
    </div>
    <script>
        lucide.createIcons();
    </script>
</body>
</html>