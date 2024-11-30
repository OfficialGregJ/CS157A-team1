<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Team Details</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<!-- Include the header -->
<jsp:include page="header.jsp" />

<body class="bg-gray-100 min-h-screen">
    <!-- Main Content -->
    <div class="flex items-center justify-center min-h-[calc(100vh-64px)] p-4">
        <div class="bg-white rounded-lg shadow-md p-6 w-full max-w-md">
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
            <%
                } else {
            %>
                <p class="text-center text-gray-500 italic">Team details not found.</p>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>
