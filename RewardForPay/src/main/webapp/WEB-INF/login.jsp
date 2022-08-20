<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reward For Pay</title>
</head>
<body>
<%@ include file="nav.jsp" %>
<h1>This is the Login Page</h1>
<h2>Log In</h2>
<h1>${NotFound}</h1>
<form action="login.do" method="POST">
	<%-- Error messages --%>
	<input type="text" name="username">
	<input type="password" name="password"/>
	<input type="submit" value="Log In" > 


</body>
</html>