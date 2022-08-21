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
			<label for="address">Street Address: </label> 
			<input type="text" name="address" required> 
			<br>
			<label for="city">City: </label> 
			<input type="text" name="city" required> 
			<br>
			<label for="state">State: </label> 
			<input type="text" name="state" required> 
			<br>
			<br>
			<label for="postalCode">State: </label> 
			<input type="text" name="postalCode" required> 
			<br>
			<br>
			<label for="phone">State: </label> 
			<input type="text" name="phone" required> 
			<br>
			<input class="btn btn-success" type="submit" value="Next">
		</form>
</div>
</body>
</html>