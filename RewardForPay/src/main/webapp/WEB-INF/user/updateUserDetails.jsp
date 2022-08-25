<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update User Details</title>
<link rel ="stylesheet" type ="text/css" href="CSS/adminDashboard.css">

</head>
<body>
<%@ include file="../nav.jsp" %>

<div class="container-fluid">
<div class="space">
<div class="form-row">
		<form action="updateUser.do" method="POST">
			<input type ="hidden" name ="id" value="${user.id}">
			<label for="username">Username:</label> 
			<input type="text" name="username" value="${user.username}"required="true"> 
			<br>
			<label for="password">Password:</label> 
			<input type="text" name="password" value="${user.password}"required="true"> 
			<br>
		
			<br>

			<input class="btn btn-success" type="submit" value="Update Login">



		</form>
</div>
</div>
</div>
</body>
</html>