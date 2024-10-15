<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NBA Player List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        h1 {
            color: #ff8c00; /* Orange color for the header */
            text-align: center;
            font-size: 2.5em;
            margin-bottom: 20px;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
        }
        ul {
            list-style-type: none;
            padding: 0;
            width: 100%;
            max-width: 400px;
        }
        li {
            background-color: #fff;
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            transition: transform 0.2s ease-in-out;
        }
        li:hover {
            transform: translateY(-2px);
        }
        a {
            text-decoration: none;
            color: #007bff;
            display: block;
            width: 100%;
        }
        a:hover {
            text-decoration: underline;
        }
        .error {
            color: red;
            text-align: center;
        }
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
                <li>
                    <a href="playerProfile?name=<%= URLEncoder.encode(playerName, "UTF-8") %>">
                        <%= playerName %>
                    </a>
                </li>
            <% } %>
        </ul>
    <% } else { %>
        <p class="error">No players found or the list is empty.</p>
    <% } %>
</body>
</html>