<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" type ="text/css" href="CSS/adminDashboard.css">

</head>
<body>

<div class ="container-fluid">
<div class ="space">
<h1>Inside Admin Delete Employee</h1>


		<form action="deleteEmployee.do" method="GET" name="id">
		
		
		
		
			<h2>${employee.firstName},${employee.lastName}  </h2>
		<ul>

			<li> ID: ${employee.id}</li>
			<li> ID: ${employee.salary}</li>
			<li> ID: ${employee.address.street}</li>
			<li> ID: ${employee.address.state}</li>
			<li> ID: ${employee.address.city}</li>
			<li> ID: ${employee.address.phone}</li>
			<li> ID: ${employee.department.name}</li>
		</ul>
		
		
		
		
		
		
		
		
		<label for="deleteEmployee">ID: </label> <input type="text" name="id"
			value="${employee.id}" placeholder="Delete by ID"> <input
			class="btn btn-danger" type="submit" value="Delete This Employee">
			<br>
		</form>
</div>
</div>
</body>
</html>