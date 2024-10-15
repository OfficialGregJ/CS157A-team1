<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.Player" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Player Profile</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0 auto; max-width: 800px; padding: 20px; }
        h1 { color: #333; }
        .profile-info { background-color: #f0f0f0; padding: 20px; border-radius: 5px; }
        .profile-info p { margin: 10px 0; }
    </style>
</head>
<body>
    <% Player player = (Player) request.getAttribute("player"); %>
    <h1>Player Profile: <%= player.getName() %></h1>
    <div class="profile-info">
        <p><strong>Team:</strong> <%= player.getTeam() %></p>
        <p><strong>Position:</strong> <%= player.getPosition() %></p>
        <p><strong>Age:</strong> <%= player.getAge() %></p>
        <p><strong>Height:</strong> <%= player.getHeight() %></p>
        <p><strong>Weight:</strong> <%= player.getWeight() %></p>
        <p><strong>College:</strong> <%= player.getCollege() %></p>
        <p><strong>Years in NBA:</strong> <%= player.getYearInNBA() %></p>
    </div>
</body>
</html>