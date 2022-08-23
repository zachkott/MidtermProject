<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../nav.jsp" %>

<h1>Inside Admin Home</h1>




<%-- <div class="row">
  <div class="col-4">
    <nav id="navbar-example3" class="h-100 flex-column align-items-stretch pe-4 border-end">
      <nav class="nav nav-pills flex-column">
        <a class="nav-link" href="#item-1">See All Users</a>
        
        <a class="nav-link" href="#item-2">See All Employees</a>
        <a class="nav-link" href="#item-3">See All Prizes</a>
         <a class="nav-link" href="#item-4">See All Requests</a>
        
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
				<th>Update User</th>
				<th>Change User Status</th>
				<th>Delete User</th>
				
				
				
				
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${allUsers}">

				<tr>
					<td>${user.id}</td>
					<td><a href="findUser.do?userId=${user.id}">${user.username}</a></td>
					<td><a href="findUser.do?userId=${user.id}">${user.password}</a></td>
					<td><c:choose><c:when test="${user.enabled == true}">Active</c:when><c:otherwise>Inactive</c:otherwise></c:choose></td>
					<td><form action="adminUpdateUserForm.do"><input type ="hidden" name="id" value="${user.id}"><button type="submit" class="btn btn-primary btn-sm">Update this User</button></form>
					<td><c:choose><c:when test="${user.enabled == true}">
					<form action="deactivateUser.do"><input type="hidden" name="userId" value="${user.id}"><button type="submit" class="btn btn-dark btn-sm">Disable this User</button></form>
							</c:when><c:otherwise>
					<form action="activateUser.do"><input type="hidden" name="userId" value="${user.id}"><button type="submit"class="btn btn-success btn-sm">Enable this User</button></form>
								</c:otherwise></c:choose></td>
					<td><form action="deleteUser.do"><input type ="hidden" name="id" value="${user.id}"><button type="submit" class="btn btn-danger btn-sm">Delete this User</button></form>
					
				</tr>
				
			</c:forEach>
		</tbody>
	</table></p>
      </div>
    
      <div id="item-2">
        <h4>See All Employees</h4>
        <p>...</p>
      </div>
      <div id="item-3">
        <h4>See All Prizes</h4>
        <p>...</p>
      </div>
     <div id="item-4">
        <h4>See All Requests</h4>
        <p>...</p>
      </div>
    </div>
  </div>
</div> --%>
















<ul>
		<li><form action="adminAllUsers.do"><button type="submit" class="btn btn-danger btn-lg">See all Users </button></form></li><br>
		<li><form action="adminAllEmployees.do"><button type="submit" class="btn btn-danger btn-lg">See all Employees </button></form></li><br>
		<li><form action="allPrizes.do"><input type="hidden" value="0" name="id">
			<button type="submit" class="btn btn-danger btn-lg">See all Prizes </button></form></li><br>
		<li><form action="pendingList.do"><button type="submit" class="btn btn-danger btn-lg">See all Requests </button></form></li><br>
		</ul>

</body>
</html>