<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Team Stats</title>
</head>
<body>
    <h1>Boston Celtics Stats</h1>
    <form action="TeamStatsServlet" method="get">
        <input type="submit" value="Retrieve Stats">
    </form>
    <div id="stats">
        <table border="1">
            <tr>
                <th>Attribute</th>
                <th>Value</th>
            </tr>
            <tr>
                <td>PPG</td>
                <td><%= request.getAttribute("ppg") != null ? request.getAttribute("ppg") : "N/A" %></td>
            </tr>
            <tr>
                <td>APG</td>
                <td><%= request.getAttribute("apg") != null ? request.getAttribute("apg") : "N/A" %></td>
            </tr>
            <tr>
                <td>SPG</td>
                <td><%= request.getAttribute("spg") != null ? request.getAttribute("spg") : "N/A" %></td>
            </tr>
            <tr>
                <td>BPG</td>
                <td><%= request.getAttribute("bpg") != null ? request.getAttribute("bpg") : "N/A" %></td>
            </tr>
            <tr>
                <td>TOPG</td>
                <td><%= request.getAttribute("topg") != null ? request.getAttribute("topg") : "N/A" %></td>
            </tr>
            <tr>
                <td>FT%</td>
                <td><%= request.getAttribute("ft") != null ? request.getAttribute("ft") : "N/A" %></td>
            </tr>
            <tr>
                <td>3PT%</td>
                <td><%= request.getAttribute("threept") != null ? request.getAttribute("threept") : "N/A" %></td>
            </tr>
            <tr>
                <td>Games Played</td>
                <td><%= request.getAttribute("gamesPlayed") != null ? request.getAttribute("gamesPlayed") : "N/A" %></td>
            </tr>
            <tr>
                <td>Wins</td>
                <td><%= request.getAttribute("wins") != null ? request.getAttribute("wins") : "N/A" %></td>
            </tr>
            <tr>
                <td>Losses</td>
                <td><%= request.getAttribute("losses") != null ? request.getAttribute("losses") : "N/A" %></td>
            </tr>
            <tr>
                <td>Win%</td>
                <td><%= request.getAttribute("winPercentage") != null ? request.getAttribute("winPercentage") : "N/A" %></td>
            </tr>
        </table>
    </div>
</body>
</html>
