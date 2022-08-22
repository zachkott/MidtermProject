<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reward For Pay</title>
<jsp:include page="nav.jsp"/>
</head>
<body>
<%@ include file="nav.jsp" %>
<h1>I'm the Award Page</h1>


awards - all awards
<!-- Main page to display both a history of awards and the details for a single award, with history below -->

<h1>${success}</h1> <!-- Conditional messages based on Controller actions -->
<h1>${addMessage}</h1>
<h1>${addFail}</h1>


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
		<input type="hidden" value="${award.id}" name="id" /> 
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
				<c:forEach var="award" items="${awards}">
					<form action="award.do" method="get"> <!-- update with controller mapping -->
						<input type="hidden" value="${award.id}" name="awardId" /> 
						<input type="hidden" value="${sessionScope.userinfo.id}" name="empId" /> 
						<input class="action_button" type="submit" value="${award.employee.firstName} ${award.employee.lastName}, ${award.issued}" />
					</form>
				</c:forEach>
		</c:when>
		<c:otherwise>
			<h1>${continentFail}</h1>
		</c:otherwise>
	</c:choose>

</body>
</html>