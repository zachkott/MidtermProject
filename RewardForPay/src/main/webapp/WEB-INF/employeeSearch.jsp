<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reward For Pay</title>
<link rel ="stylesheet" type ="text/css" href="CSS/adminDashboard.css">

</head>
<body>
<%@ include file="nav.jsp" %>

<div class="container-fluid">
<div class="space">
<h1>Listed Employees found by search word:<c:out value="${keyword}"></c:out></h1>


<h1>Employee Search</h1>

 <table id="keywordEmp" class="table table-striped table-hover">
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
					<td><a href="viewEmployee.do?id=${employee.id}"><h3>${employee.id}</h3></a></td>
					<td><img class="detail_img"  src="${employee.employeePhoto}" title="Illustrated headshot"/></td>
					<td><h4>${employee.firstName}</h4></td>
					<td><h4>${employee.lastName}</h4></td>
					<td><h4>${employee.user.username}</h4></td>
					<td><h4>${employee.address.phone}</h4></td>
					<td><h4>${employee.description}</h4></td>
					<td><h4>${employee.department.name}</h4></td>
					<td><h4>${employee.department.description}</h4></td>
					
					
					
				</tr>
				
			</c:forEach>
		</tbody>
	</table>
</div>
</div>

</body>
</html>