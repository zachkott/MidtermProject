<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" type ="text/css" href="CSS/adminDashboard.css">

</head>
<body>
<%@ include file="../nav.jsp" %>
<div class ="container-fluid">
<div class ="space">
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
			<label for="street">Street:</label> 
			<input type="text" name="street" value="${employee.address.street}"required="true"> 
			<br>
			<label for="state">State:</label> 
			<input type="text" name="state" value="${employee.address.state}"required="true"> 
			<br>
			<label for="city">City:</label> 
			<input type="text" name="city" value="${employee.address.city}"required="true"> 
			<br>
			<label for="postalCode">Postal Code:</label> 
			<input type="text" name="postalCode" value="${employee.address.postalCode}"required="true"> 
			<br>
			<label for="phone">Phone:</label> 
			<input type="text" name="phone" value="${employee.address.phone}"required="true"> 
			<br>
			<label for="birthday">Birthday: </label> 
			<input type="date" name="date" value="${employee.birthday}" required> 
			<br>
			<input type = "hidden" name = "addressId" value ="${employee.address.id}">
			<br>

			<input class="btn btn-success" type="submit" value="Update Employee">



		</form>
</div>
</div>
</div>
</body>
</html>