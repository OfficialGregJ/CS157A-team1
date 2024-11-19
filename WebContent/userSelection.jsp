<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deep Drive Registration</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
</head>
<body class="bg-gradient-to-br from-blue-500 to-green-500 flex items-center justify-center min-h-screen p-4">
    <div class="bg-white p-8 rounded-lg shadow-xl w-full max-w-md">
        <div class="flex items-center justify-center mb-6">
            <i data-lucide="activity" class="w-12 h-12 text-blue-600 mr-2"></i>
            <h1 class="text-3xl font-bold text-gray-800">Deep Drive</h1>
        </div>
        <h2 class="text-2xl font-semibold mb-6 text-center text-gray-700">Choose Your Role</h2>
        <div class="space-y-4">
            <form action="userRegister.jsp" method="get" class="w-full">
                <button type="submit" class="w-full flex justify-center items-center py-3 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition duration-150 ease-in-out">
                    <i data-lucide="user-plus" class="h-5 w-5 mr-2"></i>
                    User Registration
                </button>
            </form>
            <form action="adminRegister.jsp" method="get" class="w-full">
                <button type="submit" class="w-full flex justify-center items-center py-3 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-orange-600 hover:bg-orange-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-orange-500 transition duration-150 ease-in-out">
                    <i data-lucide="shield" class="h-5 w-5 mr-2"></i>
                    Admin Registration
                </button>
            </form>
        </div>
    </div>
    <script>
        lucide.createIcons();
    </script>
</body>
</html>
