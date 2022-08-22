<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Results</title>
</head>
<body>

<h1>Inside User Results</h1>

<table class="table table-striped table-hover">
		<thead class="table-light">
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Status</th>
				
				
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${allUsers}">

				<tr>
					<td>${user.id}</td>
					<td><a href="findUser.do?userId=${user.id}">${user.username}</a></td>
					<td><a href="findUser.do?userId=${user.id}">${user.enabled}</a></td>
				
					
					
					
				</tr>
				
			</c:forEach>
		</tbody>
	</table>


</body>
</html>