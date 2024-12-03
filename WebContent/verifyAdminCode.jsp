<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Access</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-blue-500 to-green-500 min-h-screen flex items-center justify-center">
    <div class="bg-white p-6 rounded-lg shadow-lg max-w-md w-full">
        <h1 class="text-xl font-bold text-center mb-4">Enter Admin Access Code</h1>

        <%
            String errorMessage = (String) request.getAttribute("error");
            if (errorMessage != null) {
        %>
        <p class="text-red-500 text-center mb-4"><%= errorMessage %></p>
        <%
            }
        %>

        <form action="verifyAdminCodeServlet" method="POST">
            <div class="mb-4">
                <label for="accessCode" class="block text-sm font-medium text-gray-700">Access Code</label>
                <input type="password" id="accessCode" name="accessCode"
                    class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                    required>
            </div>
            <button type="submit"
                class="w-full py-2 px-4 bg-blue-600 text-white font-bold rounded-md hover:bg-blue-700">Verify</button>
        </form>
    </div>
</body>
</html>
