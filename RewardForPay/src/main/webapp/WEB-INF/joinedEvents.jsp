<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pending Request</title>
</head>
<body>
<%@ include file="nav.jsp" %>

<c:choose>
		<c:when test="${!empty joined}">
<h1>Current Joined Events</h1>
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
		<h1>You haven't joined any events. <a href="eventsList.do?empId=${sessionScope.userinfo.id}">Get involved!</a></h1>
		</c:otherwise>
		</c:choose>
</body>
</html>

