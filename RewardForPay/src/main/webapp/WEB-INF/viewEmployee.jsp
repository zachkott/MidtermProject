<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>
<title>Reward For Pay</title>
<jsp:include page ="bootstrapHead.jsp" />
<link rel ="stylesheet" type ="text/css" href="CSS/adminDashboard.css">
<link rel ="stylesheet" type ="text/css" href="CSS/homepage.css">
</head>
<body>
<%@ include file="nav.jsp" %>

<div class="container-fluid">
<div class="account">
<h1>Employee Information</h1>

<!-- CREATE A REDIRECT TO ADMIN DASHBOARD PAGE -->
	<div class="table-responsive">
		<table>
			<tbody>
				<tr> <!-- Employee photo url move to database -->
					<td  rowspan=2><img width="40%" class="detail_img" id="userImage" src="${employee.employeePhoto}" title="Illustrated headshot"/></td>
					<td class="buffer"></td>
					<td class="text-wrap col-md-offset-1" id="employee_info">
						<h1><strong>${employee.firstName} ${employee.lastName}</strong></h1><br>
						<h1><strong>${employee.description}</strong></h1><br>
						<ul style="list-style-type: none">
							<li><strong>Department: </strong>${employee.department.name}</li>
							<li><strong>Department Description: </strong>${employee.department.description}</li>
						</ul>
					</td>
				</tr>
				</tbody>
				</table>

	</div>
	<c:choose>
		<c:when test="${!empty joined}">
<h1>Their Events</h1>
			<table class="table table-striped table-hover">
				<thead class ="table-dark">
					<tr>
						<th>Id</th>
						<th>Amount</th>
						<th>Description</th>
						<th>Event Date </th>
					</tr>
				</thead>
				<tbody>				
				<c:forEach var="each" items="${joined}">
				<tr>
				<td><a href="findAwardTest.do?paid=${each.id}">${each.id}</a></td>
				<td>${each.amount}</td>
				<td>${each.description}</td>
				<td>${each.issued}</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
		</c:when>
		<c:otherwise>
		<h1>They haven't joined any events.</h1>
		</c:otherwise>
		</c:choose>
		<table class="table table-striped table-hover">

			<c:choose>
				<c:when test="${! empty wishlist }">
					<c:forEach items="${wishlist}" var="prize">
						<tr>
							<td><a href="reward.do?id=${prize.id}">${prize.name}</a></td>
							<td><a href="reward.do?id=${prize.id}">${prize.points}</a></td>
							<td><img class="card-img-top " src="${prize.image}"></td>
							<td><a href="reward.do?id=${prize.id}">${prize.description}</a></td>

					</c:forEach>
				</c:when>
				<c:otherwise>
					<h1>Their wishlist is empty :(</h1>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</div>
</body>
</html>