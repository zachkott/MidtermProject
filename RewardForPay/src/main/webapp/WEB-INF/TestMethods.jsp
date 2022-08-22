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

<h1>Pending Award Submissions</h1>
<c:choose>
		<c:when test="${!empty pendingPA}">
			<table class="table table-striped table-hover">
				<thead class ="table-dark">
					<tr>
						<th>Id</th>
						<th>Amount</th>
						<th>Issued</th>
						<th>Awardee</th>
						<th>Description</th>
						<th>Award Submitted By</th>
						<th>Update</th>						
					</tr>
				</thead>
				<tbody>				
				<c:forEach var="each" items="${pendingPA}">
				<tr>
				<td><a href="findAwardTest.do?paid=${each.id}">${each.id}</a></td>
				<td>${each.amount}</td>
				<td>${each.issued}</td>
				<td>${each.employee.firstName} ${each.employee.lastName}</td>
				<td>${each.issued}</td>
				<td>${each.description}</td>
				<td>${each.user.employee.firstName} ${each.user.employee.lastName}</td>
				<td>
				<form action="updateAward.do" method="get">
								<input type="hidden" value=${each.id } name="paid" /> <input
									 type="submit" value="Update" />
							</form>
							</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
		</c:when>
		<c:otherwise>
		</c:otherwise>
		</c:choose>
<h1>Pending Award Submissions</h1>
<c:choose>
		<c:when test="${!empty pendingPE}">
			<table class="table table-striped table-hover">
				<thead class ="table-dark">
					<tr>
						<th>Id</th>
						<th>Amount</th>
						<th>Issued</th>
						<th>Awardee</th>
						<th>Description</th>
						<th>Award Submitted By</th>
						<th>Update</th>						
					</tr>
				</thead>
				<tbody>				
				<c:forEach var="each" items="${pendingPE}">
				<tr>
				<td><a href="findEmployeeTest.do?paid=${each.id}">${each.id}</a></td>
				<td>${each.amount}</td>
				<td>${each.issued}</td>
				<td>${each.employee.firstName} ${each.employee.lastName}</td>
				<td>${each.issued}</td>
				<td>${each.description}</td>
				<td>${each.user.employee.firstName} ${each.user.employee.lastName}</td>
				<td>
				<form action="updateEmployee.do" method="get">
								<input type="hidden" value=${each.id } name="eid" /> <input
									 type="submit" value="Update" />
							</form>
							</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
		</c:when>
		<c:otherwise>
		</c:otherwise>
		</c:choose>
</body>
</html>