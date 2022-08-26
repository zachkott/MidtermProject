<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Employee</title>
<link rel ="stylesheet" type ="text/css" href="CSS/adminDashboard.css">

</head>
<body>
<%@ include file="../nav.jsp" %>

<div class="container-fluid">
<div class="space">



	<div>
<c:choose>
<c:when test="${! empty employee}">

		<h2>Employee Profile</h2>
		<ul>
			<li>Employee ID: ${employee.id}</li>
			<li>First Name: ${employee.firstName}</li>
			<li>Last Name: ${employee.lastName}</li>
			<li>Username: ${sessionScope.loggedInUser.username}</li>
			<li>Street: ${employee.address.street}</li>
			<li>State: ${employee.address.state}</li>
			<li>City: ${employee.address.city}</li>
			<li>Birthday: ${employee.birthday}</li>
			<li>Department: ${employee.department.name}</li>
			
			
			

		</ul>

		
		
		<form action="updateEmployeeForm.do" method="GET"name="id">
		 <input type="hidden" name="id"
			value="${employee.id}" placeholder="Update by ID"> <input
			class="btn btn-warning" type="submit" value="Update Employee Info">
	</form>
	
	<form action="account.do">
				<input class="btn btn-success" type="submit" value="Account">
			</form>
	
	</c:when>
	
	
	<c:otherwise>
	<h2>Employee Not Found</h2>
	</c:otherwise>
	</c:choose>
	</div>
</div>
</div>
</body>
</html>