<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create User</title>
</head>
<body>

<h1>Create New Account</h1>

<div class="form-row">
		<form action="createUser.do" method="POST">
			<label for="username">Username:</label> 
			<input type="text" name="username"required="true"> 
			<br>
			<label for="password">Password:</label> 
			<input type="text" name="password"required="true"> 
			<br>
			<label for="employee">Employee Id:</label> 
			<input type="number" name="employee"required="true"> 
			<br>


			<input class="btn btn-success" type="submit" value="Submit">



		</form>
</div>



<!-- <li class="nav-item">
        <form action="createUser.do" method="GET">
		<div class="form-group">
			<input class="btn btn-success" type="submit" value="Submit" />
		</div>
	</form> -->

</body>
</html>