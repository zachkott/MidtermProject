<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
<link rel ="stylesheet" type ="text/css" href="CSS/adminDashboard.css">

</head>
<body>
<%@ include file="../nav.jsp" %>


</head>
<body>

<div class="container-fluid">
<div class="space">

	<h1>User Profile</h1>

	<div>
<c:choose>
<c:when test="${! empty user}">

		<h2>${user.username}</h2>
		<ul>

			<li> ID: ${user.id}</li>
			<li>Username: ${user.username}</li>
			<li>Password: ${user.password}</li>
			
		</ul>

		
		
		<form action="adminUpdateUserForm.do" method="GET"name="id">
		<label for="updateUser"></label> <input type="hidden" name="id"
			value="${user.id}" placeholder="Update by ID"> <input
			class="btn btn-warning" type="submit" value="Update User Info">
	</form>
	
	<form action="account.do">
				<input class="btn btn-success" type="submit" value="Account">
			</form>
	
	</c:when>
	
	
	<c:otherwise>
	<h2>User Not Found</h2>
	</c:otherwise>
	</c:choose>
	</div>
	
	</div>
	</div>
</body>
</html>