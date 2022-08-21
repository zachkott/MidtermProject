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
		<form action="createEmployee.do" method="POST">
			<label for="employee">Employee ID: </label> 
			<input type="text" name="employee" required> 
			<br>
			<label for="description">Award Justification: </label> 
			<input type="text" name="description" required> 
			<br>
			<label for="amount">Suggested Number of Points: </label> 
			<input type="number" name="amount" required> 
			<br>
			<input type="hidden" name="status" value="2"/>
			<input type="hidden" name="user" value="${sessionScope.loggedInUser.id}"/>
			<input class="btn btn-success" type="submit" value="Submit">
		</form>
</div>
</body>
</html>