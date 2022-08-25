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
<h1>I'm the Award Page</h1>


<!-- Main page to display both a history of awards and the details for a single award, with history below -->
<div class="container-fluid">
<div class="space">
<h1>${success}</h1> <!-- Conditional messages based on Controller actions -->
	
<c:if test="${newAwardId != 0 }">	<h1>${addMessage}</h1> </c:if>
<c:if test="${newAwardId == 0}"><h1>${addFail}</h1></c:if>


<c:choose>
<c:when test="${! empty award}">
	<h2>Award Details</h2>
	<ul style="list-style-type: none">
		<li><strong>Awardee: </strong>${award.employee.firstName} ${award.employee.lastName}</li>
		<li><strong>Date Submitted: </strong>${award.issued}</li>
		<li><strong>Reason for Award: </strong>${award.description}</li>
		<li><strong>Number of Points: </strong>${award.amount}</li>
		<li><strong>Request Status: </strong>${award.status.name}</li>
		<li><strong>Submitted By: </strong>${award.user.employee.firstName} ${award.user.employee.lastName}</li>
	</ul>
	
	<form action="withdrawAward.do" method="get"> <!-- update with controller mapping -->
		<input type="hidden" value="${award.id}" name="awardId" /> 
		<input type="hidden" value="${sessionScope.userinfo.id}" name="empId" /> 
		<input class="action_button" type="submit" value="Withdraw Award" />
	</form>
</c:when>
<c:otherwise>
	<h2>${awardNotFound}</h2>
</c:otherwise>
</c:choose>


	<c:choose>
		<c:when test="${! empty awards}">
					<ol>
				<c:forEach var="awarded" items="${awards}">
						<li><form action="award.do" method="get"> <!-- update with controller mapping -->
								<strong>${awarded.employee.firstName} ${awarded.employee.lastName},</strong> ${awarded.issued}, ${awarded.status.name}
								<input type="hidden" value="${awarded.id}" name="awardId" /> 
								<input type="hidden" value="${sessionScope.userinfo.id}" name="empId" /> 
							<input class="action_button" type="submit" value="View Award Details" />
						</form></li>
				</c:forEach>
					</ol>
		</c:when>
		<c:otherwise>
			<h1>${awardNotFound}</h1>
		</c:otherwise>
	</c:choose>
</div>
</div>
</body>
</html>