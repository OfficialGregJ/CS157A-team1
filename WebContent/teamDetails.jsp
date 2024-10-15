<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Team Details</title>
</head>
<body>
    <h1>Team Details</h1>
    <%
        String teamName = (String) request.getAttribute("teamName");
        String city = (String) request.getAttribute("city");
        String stadium = (String) request.getAttribute("stadium");

        if (teamName != null) {
    %>
        <h2><%= teamName %></h2>
        <p><strong>City:</strong> <%= city %></p>
        <p><strong>Stadium:</strong> <%= stadium %></p>
    <%
        } else {
    %>
        <p>Team details not found.</p>
    <%
        }
    %>
</body>
</html>
