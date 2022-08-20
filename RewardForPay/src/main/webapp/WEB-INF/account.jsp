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
<h1>Im the Account Page</h1>

 <c:choose>
   <c:when test="${! empty sessionScope.loggedInUser}">
   <h2>Welcome, ${sessionScope.userinfo.firstName} ${sessionScope.userinfo.lastName}</h2>
   <h2>Welcome, ${sessionScope.loggedInUser.username} ${sessionScope.loggedInUser.password}</h2>
   		<br>

				<h5>What would you like to do?</h5>
				<br>
	<ul>
					<li><a href="machineSearch.do" class="title">Update information</a></li>
					<br>
					<li><a href="machineSearch.do" class="title"> Create an award</a></li>
					<br>
					<li><a href="addMaintenance.do" class="title"> Create an employee</a></li>
					<br>
					<li> <a href="updateMaintenance.do" class="title"> Update/Delete a Maintenance Project</a></li>
</ul>
   </c:when>
   <c:otherwise>
     <h2>Not logged in.</h2>
     <a href="login.do">Please log in to access your account information.</a>
   </c:otherwise>
 </c:choose>
 		

</body>
</html>