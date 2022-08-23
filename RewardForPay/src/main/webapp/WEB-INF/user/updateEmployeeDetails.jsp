<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="../nav.jsp" %>
<h1>Inside User Update Employee</h1>


<div class="form-row">
		<form action="editEmployee.do" method="POST">
			<input type ="hidden" name ="id" value="${sessionScope.userinfo.id}">
			<label for="firstName">First Name:</label> 
			<input type="text" name="firstName" value="${sessionScope.userinfo.firstName}"required="true"> 
			<br>
			<label for="lastName">Last Name:</label> 
			<input type="text" name="lastName" value="${sessionScope.userinfo.lastName}"required="true"> 
			<br>
			<label for="salary">Salary:</label> 
			<input type="text" name="salary" value="${sessionScope.userinfo.salary}"required="true"> 
			<br>
			<label for="street">Street:</label> 
			<input type="text" name="street" value="${sessionScope.userinfo.address.street}"required="true"> 
			<br>
			<label for="state">State:</label> 
			<input type="text" name="state" value="${sessionScope.userinfo.address.state}"required="true"> 
			<br>
			<label for="city">City:</label> 
			<input type="text" name="city" value="${sessionScope.userinfo.address.city}"required="true"> 
			<br>
			<label for="postalCode">Postal Code:</label> 
			<input type="text" name="postalCode" value="${sessionScope.userinfo.address.postalCode}"required="true"> 
			<br>
			<label for="phone">Phone:</label> 
			<input type="text" name="phone" value="${sessionScope.userinfo.address.phone}"required="true"> 
			<br>
			<label for="birthday">Birthday: </label> 
			<input type="date" name="date" value="${sessionScope.userinfo.birthday}" required> 
			<br>
			<input type = "hidden" name = "addressId" value ="${sessionScope.userinfo.address.id}">
			<br>
			<input type = "hidden" name = "username" value ="${sessionScope.userinfo.user.username}">
			<br>

			<input class="btn btn-success" type="submit" value="Update Employee">



		</form>
</div>

</body>
</html>