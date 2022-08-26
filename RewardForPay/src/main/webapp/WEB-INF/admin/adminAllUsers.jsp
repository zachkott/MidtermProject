<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin User List</title>
<link rel ="stylesheet" type ="text/css" href="CSS/adminDashboard.css">

</head>
<body>
<%@ include file="../nav.jsp" %>

<div class="container-fluid">
<div class="space">
<h1>User Results</h1>


<table class="table table-striped table-hover">
		<thead class="table-light">
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Password</th>
				<th>Status</th>
				<th>Update User</th>
				<th>Change User Status</th>
			
				
				
				
				
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${allUsers}">

				<tr>
					<td>${user.id}</td>
					<td><a href="findUser.do?userId=${user.id}">${user.username}</a></td>
					<td><a href="findUser.do?userId=${user.id}">${user.password}</a></td>
					<td><c:choose><c:when test="${user.enabled == true}">Active</c:when><c:otherwise>Inactive</c:otherwise></c:choose></td>
					<td><form action="adminUpdateUserForm.do"><input type ="hidden" name="id" value="${user.id}"><button type="submit" class="btn btn-warning btn-sm">Update this User</button></form>
					<td><c:choose><c:when test="${user.enabled == true}">
					<form action="deactivateUser.do"><input type="hidden" name="userId" value="${user.id}"><button type="submit" class="btn btn-dark btn-sm">Disable this User</button></form>
							</c:when><c:otherwise>
					<form action="activateUser.do"><input type="hidden" name="userId" value="${user.id}"><button type="submit"class="btn btn-success btn-sm">Enable this User</button></form>
								</c:otherwise></c:choose></td>
					
					
				</tr>
				
			</c:forEach>
		</tbody>
	</table>
</div>
</div>

</body>
</html>