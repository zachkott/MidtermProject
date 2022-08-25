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
<%@ include file="../nav.jsp" %>



<div class ="container-fluid">
<div class ="space">
<h1>Pending Award Submissions</h1>
<c:choose>
		<c:when test="${!empty pendingPA}">
			<table class="table table-striped table-hover">
				<thead class ="table-dark">
					<tr>
						<th>Id</th>
						<th>Amount</th>
						<th>Awardee</th>
						<th>Description</th>
						<th>Award Submitted By</th>
						<th>Status</th>
						<th>Update</th>						
					</tr>
				</thead>
				<tbody>				
				<c:forEach var="each" items="${pendingPA}">
				<tr>
				<td><a href="findAwardTest.do?paid=${each.id}">${each.id}</a></td>
				<td>${each.amount}</td>
				<td>${each.employee.firstName} ${each.employee.lastName}</td>
				<td>${each.description}</td>
				<td>${each.user.employee.firstName} ${each.user.employee.lastName}</td>
				<td>${each.status.name}</td>
				<td>
				<form action="updateAwardStatus.do" method="get">
				        <label for="statusId">Status ID:</label>
        <select name="statusId">
          <option value="1">Approved</option>
          <option value="2">Pending</option>
          <option value="3">Declined</option>
          <option value="4">Withdrawn</option>
        </select>
								<input type="hidden" value= "${each.id }" name="id" /> <input
									 type="submit" value="Update Status" />
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
<h1>Pending Employee Submissions</h1>
<c:choose>
		<c:when test="${!empty pendingPE}">
			<table class="table table-striped table-hover">
				<thead class ="table-dark">
					<tr>
						<th>Id</th>
						<th>Name</th>
						<th>Address</th>
						<th>Department</th>
						<th>Username</th>
						<th>Status</th>
						<th>Update</th>						
					</tr>
				</thead>
				<tbody>				
				<c:forEach var="each" items="${pendingPE}">
				<tr>
				<td><a href="findEmployeeTest.do?eid=${each.id}">${each.id}</a></td>
				<td>${each.firstName} ${each.lastName}</td>
				<td>${each.address.street}, ${each.address.city}, ${each.address.state}</td>
				<td>${each.department.name}</td>
				<td>${each.user.username}</td>
				<td>${each.requestStatus.name}</td>
				<td>
				<form action="updateEmployeeStatus.do" method="get">
				        <label for="statusId">Status ID:</label>
        <select name="statusId">
          <option value="1">Approved</option>
          <option value="2">Pending</option>
          <option value="3">Declined</option>
          <option value="4">Withdrawn</option>
        </select>
								<input type="hidden" value= "${each.id }" name="id" /> <input
									 type="submit" value="Update Status" />
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
		<h1>Pending Prize Submissions</h1>
<c:choose>
		<c:when test="${!empty pendingPP}">
			<table class="table table-striped table-hover">
				<thead class ="table-dark">
					<tr>
						<th>Id</th>
						<th>Name</th>
						<th>Description</th>
						<th>Tier</th>
						<th>Number of Points</th>
						<th>Status</th>
						<th>Update</th>						
					</tr>
				</thead>
				<tbody>				
				<c:forEach var="each" items="${pendingPP}">
				<tr>
				<td><a href="findRewardTest.do?rid=${each.id}">${each.id}</a></td>
				<td>${each.name}</td>
				<td>${each.description}</td>
				<td>${each.tier.name}</td>
				<td>${each.points}</td>
				<td>${each.status.name}</td>
				<td>
				<form action="updatePrizeStatus.do" method="get">
				        <label for="statusId">Status ID:</label>
        <select name="statusId">
          <option value="1">Approved</option>
          <option value="2">Pending</option>
          <option value="3">Declined</option>
          <option value="4">Withdrawn</option>
        </select>
        <input type="hidden" value= "${each.id }" name="id" /> <input
									 type="submit" value="Update Status" />
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
		
		</div>
		</div>
</body>
</html>

