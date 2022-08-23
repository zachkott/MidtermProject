<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../nav.jsp" %>

<h1>Inside Admin Update Employee</h1>


<div class="form-row">
		<form action="adminUpdateEmployee.do" method="POST">
			<input type ="hidden" name ="id" value="${employee.id}">
			<label for="firstName">First Name:</label> 
			<input type="text" name="firstName" value="${employee.firstName}"required="true"> 
			<br>
			<label for="lastName">Last Name:</label> 
			<input type="text" name="lastName" value="${employee.lastName}"required="true"> 
			<br>
			<label for="salary">Salary:</label> 
			<input type="text" name="salary" value="${employee.salary}"required="true"> 
			<br>
		
			<br>

			<input class="btn btn-success" type="submit" value="Update Employee">



		</form>
</div>

</body>
</html>