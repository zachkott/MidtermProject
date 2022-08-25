<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pending Request</title>
<link rel ="stylesheet" type ="text/css" href="CSS/adminDashboard.css">

</head>
<body>
<%@ include file="nav.jsp" %>

<div class="container-fluid">
<div class="space">

<c:choose>
		<c:when test="${!empty events}">
<h1>Current Available Events</h1>
			<table class="table table-striped table-hover">
				<thead class ="table-dark">
					<tr>
						<th>Id</th>
						<th>Amount</th>
						<th>Description</th>
						<th>Event Date</th>
						<th>Join Event!</th>						
					</tr>
				</thead>
				<tbody>				
				<c:forEach var="each" items="${events}">
				<tr>
				<td><a href="findAwardTest.do?paid=${each.id}">${each.id}</a></td>
				<td>${each.amount}</td>
				<td>${each.description}</td>
				<td>${each.issued}</td>
				<td>
			<form action="createAward.do" method="POST">
				<input type="hidden" name="description" value="${each.description}"/>
				<input type="hidden" name="amount" value="${each.amount}"/>
				<input type="hidden" name="userId" value="${sessionScope.loggedInUser.id}"/>
				<input type="hidden" name="empId" value="${sessionScope.userinfo.id}"/>
				<input class="btn btn-success" type="submit" value="Join Event!">
		</form>
							</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
		</c:when>
		<c:otherwise>
		<h1>There are no more events available.</h1>
		</c:otherwise>
		</c:choose>
		</div>
		</div>
</body>
</html>

