<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Employee List</title>
<link rel ="stylesheet" type ="text/css" href="CSS/adminDashboard.css">

</head>
<body>
<%@ include file="../nav.jsp" %>


<div class ="container-fluid">
<div class ="space">
<h1>Employees</h1>
 <table class="table table-striped table-hover">
		<thead class="table-light">
			<tr>
				<th>ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Username</th>
				<th>Salary</th>
				<th>Address</th>
				<th>Phone</th>
				<th>Birthday</th>
				<th>Department</th>
				 <th>Update Employee </th> 
				 <th>Delete Employee </th> 
				
				
				
				
				
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="employee" items="${allEmployees}">

				<tr>
					<td>${employee.id}</td>
					<td><a href="findEmployee.do?employeeId=${employee.id}">${employee.firstName}</a></td>
					<td><a href="findEmployee.do?employeeId=${employee.id}">${employee.lastName}</a></td>
					<td><a href="findEmployee.do?employeeId=${employee.id}">${employee.user.username}</a></td>
					<td><a href="findEmployee.do?employeeId=${employee.id}">${employee.salary}</a></td>
					<td><a href="findEmployee.do?employeeId=${employee.id}">${employee.address.street}, ${employee.address.state}, ${employee.address.city}</a></td>
					<td><a href="findEmployee.do?employeeId=${employee.id}">${employee.address.phone}</a></td>
					<td><a href="findEmployee.do?employeeId=${employee.id}">${employee.birthday}</a></td>
					<td><a href="findEmployee.do?employeeId=${employee.id}">${employee.department.name}</a></td>
					<td><form action="adminUpdateEmployeeForm.do"><input type ="hidden" name="id" value="${employee.id}"><button type="submit" class="btn btn-warning btn-sm">Update this Employee</button></form>
					<td><form action="adminDeleteEmployeeForm.do"><input type ="hidden" name="id" value="${employee.id}"><button type="submit" class="btn btn-danger btn-sm">Delete this Employee</button></form>
					
					
					
				</tr>
				
			</c:forEach>
		</tbody>
	</table>
	</div>
	</div>

</body>
</html>