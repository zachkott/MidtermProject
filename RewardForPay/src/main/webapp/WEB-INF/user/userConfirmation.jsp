<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Confirmation</title>
</head>
<body>

<h1>User Created Test Page</h1>

<body>
<c:choose>
		<c:when test="${createdUser}">
			<h1>Created User!</h1>
		
			
			<li>ID: ${user.id}</li>
			<li>Username: ${user.username}</li>
			<li>Password: ${user.password}</li>
			
			
			
			
			<form action="deleteUser.do" method="GET" name="id">
		<label for="deleteUser">ID: </label> <input type="text" name="id"
			value="${user.id}" placeholder="Delete by ID"> <input
			class="btn btn-danger" type="submit" value="Delete This User">
			<br>
		</form>
		
		<form action="updateUserForm.do" method="GET"name="id">
		<label for="updateUser"> ID:</label> <input type="text" name="id"
			value="${user.id}" placeholder="Update by ID"> <input
			class="btn btn-warning" type="submit" value="Update User Info">
	</form>
	
	<form action="home.do">
				<input class="btn btn-success" type="submit" value="Home">
			</form>

		</c:when>
		<c:otherwise>
			<h3>Unable to Create User </h3>
			<form action="home.do">
			<input class="btn btn-success" type="submit" value="Home">
			
			</form>
		</c:otherwise>


	</c:choose>

</body>
</html>