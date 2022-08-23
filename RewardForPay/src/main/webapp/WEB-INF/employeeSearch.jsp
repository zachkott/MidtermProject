<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reward For Pay</title>
</head>
<body>
<%@ include file="nav.jsp" %>
<h1>Listed Employees found by search word:<c:out value="${keyword}"></c:out></h1>


<h1>Employee Search</h1>

 <table class="table table-striped table-hover">
		<thead class="table-light">
			<tr>
				<th>ID</th>
				<th>Employee Photo</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Username</th>
				<th>Work Phone</th>
				<th>Employee Slogan</th>
				<th>Department</th>
				<th>Department Slogan</th>
				
			
			</tr>
		</thead>
		<tbody>
			<c:forEach var="employee" items="${allEmployees}">

				<tr>
					<td><a href="findEmployee.do?employeeId=${employee.id}">${employee.id}</a></td>
					<td><img width="40%" class="detail_img" src="${sessionScope.userinfo.employeePhoto}" title="Illustrated headshot"/></td>
					<td>${employee.firstName}</td>
					<td>${employee.id}">${employee.lastName}</td>
					<td>${employee.id}">${employee.user.username}</td>
					<td><${employee.id}">${employee.address.phone}</td>
					<td>${employee.id}">${employee.description}</td>
					<td>${employee.id}">${employee.department.name}</td>
					<td>${employee.id}">${employee.department.description}</td>
					
					
					
				</tr>
				
			</c:forEach>
		</tbody>
	</table>


</body>
</html>