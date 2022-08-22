<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Employee</title>
</head>
<body>

<h1>Input Employee Details</h1>

<div class="form-row">
<!-- Not complete yet!-->
		<form action="createEmployee.do" method="POST">
			<label for="firstName">Employee First Name: </label> 
			<input type="text" name="firstName" required> 
			<br>
			<label for="lastName">Employee Last Name: </label> 
			<input type="text" name="lastName" required> 
			<br>
			<label for="salary">Salary: </label> 
			<input type="number" name="salary" required> 
			<br>
			<label for="firstName">Employee First Name: </label> 
			<input type="text" name="firstName" required> 
			<br>
			<label for="lastName">Employee Last Name: </label> 
			<input type="text" name="lastName" required> 
			<br>
			<label for="salary">Salary: </label> 
			<input type="number" name="salary" required> 
			<br>
			<input type="hidden" name="status" value="2"/>
			<input type="hidden" name="user" value="${sessionScope.loggedInUser.id}"/>
			<input class="btn btn-success" type="submit" value="Submit">
		</form>
</div>
</body>
</html>