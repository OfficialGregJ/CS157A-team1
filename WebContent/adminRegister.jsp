<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="AdminRegister" method="post">
		<table>
			<tr>
				<td>User Name</td>
				<td><input type="text" name="uname"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td><input type="submit" value="Register"></td>
			</tr>
		</table>
	</form>
</body>
</html> --%>

 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deep Drive Admin Registration</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
</head>
<body class="bg-gradient-to-br from-blue-700 to-green-600 flex items-center justify-center min-h-screen p-4">
    <div class="bg-white p-8 rounded-lg shadow-xl w-full max-w-md">
        <div class="flex items-center justify-center mb-6">
            <i data-lucide="trending-up" class="w-12 h-12 text-orange-600 mr-2"></i>
            <h2 class="text-3xl font-bold text-gray-800">Deep Drive</h2>
        </div>
        <h3 class="text-xl font-semibold mb-6 text-center text-gray-700">Admin Registration</h3>
        <form action="AdminRegister" method="post" class="space-y-4">
            <div>
                <label for="uname" class="block text-sm font-medium text-gray-700">Admin Username</label>
                <div class="mt-1 relative rounded-md shadow-sm">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i data-lucide="user-cog" class="h-5 w-5 text-gray-400"></i>
                    </div>
                    <input type="text" id="uname" name="uname" required class="pl-10 block w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500">
                </div>
            </div>
            <div>
                <label for="password" class="block text-sm font-medium text-gray-700">Admin Password</label>
                <div class="mt-1 relative rounded-md shadow-sm">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i data-lucide="key" class="h-5 w-5 text-gray-400"></i>
                    </div>
                    <input type="password" id="password" name="password" required class="pl-10 block w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500">
                </div>
            </div>
            <div>
                <label for="email" class="block text-sm font-medium text-gray-700">Admin Email</label>
                <div class="mt-1 relative rounded-md shadow-sm">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i data-lucide="at-sign" class="h-5 w-5 text-gray-400"></i>
                    </div>
                    <input type="text" id="email" name="email" required class="pl-10 block w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500">
                </div>
            </div>
            <div>
                <button type="submit" class="w-full flex justify-center items-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-orange-600 hover:bg-orange-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-orange-500 transition duration-150 ease-in-out">
                    <i data-lucide="clipboard-check" class="h-5 w-5 mr-2"></i>
                    Register as Admin
                </button>
            </div>
        </form>
    </div>
    <script>
        lucide.createIcons();
    </script>
</body>
</html> 