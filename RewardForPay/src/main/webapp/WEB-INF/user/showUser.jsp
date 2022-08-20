<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
</head>
<body>



</head>
<body>

	<h1>User Profile</h1>

	<div>
<c:choose>
<c:when test="${! empty user}">

		<h2>${user.username}</h2>
		<ul>

			<li> ID: ${user.id}</li>

		</ul>

			<form action="deleteUser.do" method="GET" name="id">
		<label for="deleteUser">ID: </label> <input type="text" name="id"
			value="${user.id}" placeholder="Delete by ID"> <input
			class="btn btn-danger" type="submit" value="Delete This Bud">
			<br>
		</form>
		
		<form action="updateUser.do" method="GET"name="id">
		<label for="updateUser"> ID:</label> <input type="text" name="id"
			value="${user.id}" placeholder="Update by ID"> <input
			class="btn btn-warning" type="submit" value="Update User Info">
	</form>
	
	<form action="home.do">
				<input class="btn btn-success" type="submit" value="Home">
			</form>
	
	</c:when>
	
	
	<c:otherwise>
	<h2>User Not Found</h2>
	</c:otherwise>
	</c:choose>
	</div>
</body>
</html>