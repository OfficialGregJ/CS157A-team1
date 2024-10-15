<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NBA Player List</title>
<style>

</style>
</head>
<body>
	<h1>NBA Player List</h1>

	<%
    @SuppressWarnings("unchecked")
    List<String> playerNames = (List<String>) request.getAttribute("playerNames");
    if (playerNames != null && !playerNames.isEmpty()) {
    %>
	<ul>
		<% for (String playerName : playerNames) { %>
		<li><a href="playerProfile?name=<%= java.net.URLEncoder.encode(playerName, "UTF-8") %>"><%= playerName %></a></li>
		<% } %>
	</ul>
	<% } else { %>
	<p>No players found.</p>
	<% } %>
</body>
</html>