<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Team List</title>
    <style>
        ul {
            list-style-type: disc;
            padding-left: 20px;
        }

        li {
            margin-bottom: 5px;
        }

        a {
            text-decoration: none;
            color: blue;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>NBA Team List</h1>
    <ul>
        <%
            List<String> teamNames = (List<String>) request.getAttribute("teamNames");
            if (teamNames != null) {
                for (String teamName : teamNames) {
        %>
            <li><a href="TeamServlet?team=<%= teamName %>"><%= teamName %></a></li>
        <%
                }
            } else {
        %>
            <li>No teams available</li>
        <%
            }
        %>
    </ul>
</body>
</html>