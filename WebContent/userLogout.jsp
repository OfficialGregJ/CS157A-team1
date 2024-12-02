<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Logout</title>
</head>
<body>
<% 
    // Invalidate the session to log out the user
    session.invalidate();
    // Redirect to homepage or login page
    response.sendRedirect("/DeepDrive/");
%>

</body>
</html>