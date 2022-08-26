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

	<div class="table-responsive">
			<table>
			<thead>
				<tr>
					<th class="col-7" colspan="2"></th>
					<th class="col-5" colspan="2"></th>
				</tr>
			</thead>
			<tbody>
				<tr> 
					<td rowspan="2" colspan="2"><img class="detail_img col-md-4" id="userImage" src="${employee.employeePhoto}" title="${employee.firstName} ${employee.lastName}"/></td>
					<td class="text-wrap col-md-offset-1 col-md-8" id="employee_info">
						<h2 id="name-head" class="left"><strong>${employee.firstName} ${employee.lastName}</strong></h2><br>
					</td>
				</tr>
				<tr>
					<td colspan="2" id="empDetails">
						<ul style="list-style-type: none">
						    <li id="userId" value="${employee.id}"><strong>Employee Id: </strong>${employee.id}</li>
							<li class="text-wrap"><strong>About ${employee.firstName}: </strong>${employee.description}</li>
							<li><strong>Department: </strong>${employee.department.name}</li>
							<li><strong>Department Description: </strong>${employee.department.description}</li>
							<li><strong>Birthday: </strong>${employee.birthday}</li>
						</ul>
					</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					 <td>
					 	<form action="createAward.do"><button class="action_button" type="submit">Submit Coworker for Award</button></form>
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
					   <div class="row row-cols-1 row-cols-md-4 g-${numOfPrizes}">
					<c:forEach var="item" items="${wishlist}">
					  <div class="col">
					    <div class="card h-100">
					      <a href="reward.do?id=${item.id}"><img class="card-img-top " src="${item.image}" alt="${item.name}"/></a>
					      <div class="card-body">
					        <h3 class="card-title2">${item.name}</h3>
					        <p class="card-text">Schrute Bucks: ${item.points}</p>
					        <p class="card-text">Prize Tier: ${item.tier.id}</p>
					      </div>
					    </div>
					  </div>
					</c:forEach>
				</div> 
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