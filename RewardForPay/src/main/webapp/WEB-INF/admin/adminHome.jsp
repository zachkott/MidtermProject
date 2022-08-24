<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../nav.jsp"%>

	<h1>Inside Admin Home</h1>




	<%-- <div class="row">
  <div class="col-4">
    <nav id="navbar-example3" class="h-100 flex-column align-items-stretch pe-4 border-end">
      <nav class="nav nav-pills flex-column">
        <a class="nav-link" href="adminDashboardAllUsers.do">See All Users</a>
        
        <a class="nav-link" href="adminDashboardAllEmployees.do">See All Employees</a>
        <a class="nav-link" href="#">See All Prizes</a>
         <a class="nav-link" href="pendingList.do">See All Requests</a>
        
      </nav>
    </nav>
  </div>

  <div class="col-8">
    <div data-bs-spy="scroll" data-bs-target="#navbar-example3" data-bs-smooth-scroll="true" class="scrollspy-example-2" tabindex="0">
      <div id="item-1">
        <h4>See All Users</h4>
        <p><table class="table table-striped table-hover">
		<thead class="table-light">
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Password</th>
				<th>Status</th>
				
					
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${allUsers}">

				<tr>
					<td>${user.id}</td>
					<td><a href="findUser.do?userId=${user.id}">${user.username}</a></td>
					<td><a href="findUser.do?userId=${user.id}">${user.password}</a></td>
					<td><c:choose><c:when test="${user.enabled == true}">Active</c:when><c:otherwise>Inactive</c:otherwise></c:choose></td>
					
				</tr>
				
			</c:forEach>
		</tbody>
	</table></p>
      </div>
    
      <div id="item-2">
        <h4>See All Employees</h4>
        <table class="table table-striped table-hover">
		<thead class="table-light">
			<tr>
				<th>ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Username</th>
				<th>Address</th>
				<th>Phone</th>
				<th>Birthday</th>
				<th>Department</th>
				
				
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="employee" items="${allEmployees}">

				<tr>
					<td>${employee.id}</td>
					<td><a href="findEmployee.do?employeeId=${employee.id}">${employee.firstName}</a></td>
					<td><a href="findEmployee.do?employeeId=${employee.id}">${employee.lastName}</a></td>
					<td><a href="findEmployee.do?employeeId=${employee.id}">${employee.user.username}</a></td>
					<td><a href="findEmployee.do?employeeId=${employee.id}">${employee.address.street}, ${employee.address.state}, ${employee.address.city}</a></td>
					<td><a href="findEmployee.do?employeeId=${employee.id}">${employee.address.phone}</a></td>
					<td><a href="findEmployee.do?employeeId=${employee.id}">${employee.birthday}</a></td>
					<td><a href="findEmployee.do?employeeId=${employee.id}">${employee.department.name}</a></td>
					
					
				</tr>
				
			</c:forEach>
		</tbody>
	</table>

      </div>
      <div id="item-3">
        <h4>See All Prizes</h4>
        <p><div class="row row-cols-1 row-cols-md-5 g-${numOfPrizes}">
					<c:forEach var="prize" items="${prizes}">
					  <div class="col">
					    <div class="card h-100">
					      <a href="reward.do?id=${prize.id}"><img class="card-img-top " src="${prize.image}" alt="${prize.name}"/></a>
					      <div class="card-body">
					        <h5 class="card-title">${prize.name}</h5>
					        <p class="card-text">${prize.points}, Tier ${prize.tier.id}</p>
					      </div>
					    </div>
					  </div>
					</c:forEach>
				</div></p>
      </div>
     <div id="item-4">
        <h4>See All Requests</h4>
        <p>...</p>
      </div>
    </div>
  </div>
</div> 
 --%>






	


			<ul>
				<li><form action="adminAllUsers.do">
						<button type="submit" class="btn btn-danger btn-lg">See
							all Users</button>
					</form></li>
				<br>
				<li><form action="adminAllEmployees.do">
						<button type="submit" class="btn btn-danger btn-lg">See
							all Employees</button>
					</form></li>
				<br>
				<li><form action="allPrizes.do">
						<input type="hidden" value="0" name="id">
						<button type="submit" class="btn btn-danger btn-lg">See
							all Prizes</button>
					</form></li>
				<br>
				<li><form action="pendingList.do">
						<button type="submit" class="btn btn-danger btn-lg">See
							all Requests</button>
					</form></li>
				<br>
			</ul>
</body>
</html>