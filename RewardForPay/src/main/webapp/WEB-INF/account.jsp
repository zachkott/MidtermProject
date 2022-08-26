<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function validateForm() {
        let username = document.getElementById("username").value;
        let userId = document.getElementById("userId").value;
        let userImage = document.getElementById("userImage").src;
        
        localStorage.setItem("username", username);
        localStorage.setItem("userId", userId);
        localStorage.setItem("userImage", userImage);
        
        //window.open("chat/chat-app.jsp", 'window', 'width=800, height=500, location=0, menubar=0');
        window.location.href("chat/chat-app.jsp");
}
</script>
<title>Reward For Pay</title>
<jsp:include page ="bootstrapHead.jsp" />
<link rel ="stylesheet" type ="text/css" href="CSS/adminDashboard.css">
<link rel ="stylesheet" type ="text/css" href="CSS/homepage.css">
</head>
<body>
<%@ include file="nav.jsp" %>
<input type="hidden" id="username" value="${sessionScope.loggedInUser.username}">
<input type="hidden" name="userId" id="userId" value="${sessionScope.loggedInUser.id}"/>

<div class="container-fluid">
<div class="account">

 <c:choose>
   <c:when test="${! empty sessionScope.loggedInUser}">

	<div class="table-responsive">
		<table>
			<thead>
				<tr>
					<th class="col-4" colspan="2"></th>
					<th class="col-8" colspan="2"></th>
				</tr>
			</thead>
			<tbody>
			<tr>
				<td colspan="3"><h1>Welcome to Reward For Pay</h1></td>
			</tr>
				<tr> 
					<td rowspan="2" colspan="2"><img class="detail_img col-md-4" id="userImage" src="${sessionScope.userinfo.employeePhoto}" title="${sessionScope.userinfo.firstName} ${sessionScope.userinfo.lastName}"/></td>
					<td class="text-wrap col-md-offset-1 col-md-8" id="employee_info">
						<h2><strong>${sessionScope.userinfo.firstName} ${sessionScope.userinfo.lastName}</strong></h2><br>
					</td>
					
					
				<c:if test="${role != 1}">
					<c:choose>
						<c:when test="${empty claimed }">
						<td>
								<form action="createAward.do" method="POST">
									<input type="hidden" name="description" value="Initial Point Award"/>
									<input type="hidden" name="amount" value="100"/>
									<input type="hidden" id="username" value="${sessionScope.loggedInUser.username}">
									<input type="hidden" name="userId" id="userId" value="${sessionScope.loggedInUser.id}"/>
									<input type="hidden" name="empId" value="${sessionScope.userinfo.id}"/>
									<input class="btn btn-success" type="submit" value="Get My First 100 Pts!">
							</form>
						</td>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
				</c:if>
				</tr>
				<tr>
					<td colspan="2">
						<ul style="list-style-type: none">
							<li><strong>Salary: </strong>${sessionScope.userinfo.salary}</li>
							<li class="text-wrap"><strong>Address: </strong>${sessionScope.userinfo.address.street}</li>
							<li><strong>Department: </strong>${sessionScope.userinfo.department.name}</li>
							<li>Birthday: <h4>${sessionScope.userinfo.birthday}</h4></li>
							<li>Reward Balance: <h4>${sessionScope.rewardBalance}</h4></li> <!-- do the logic in controller and pass the attribute value -->
						</ul>
					</td>
				</tr>
				<tr>
					<td>
					
						<form action="updateEmployeeForm.do"> 
							<input type="hidden" value="${sessionScope.userinfo.id}" name="id" /> 
							<input class="action_button" type="submit" value="Edit Profile" />
						</form>
					</td>
					<td>
						<form action="/chat/chat-app.jsp"><button type="submit" onclick="validateForm()" class="action_button">Chat with Friends</button></form>
						
					</td>
	<c:if test="${role != 1}">
					<td>
						<form action="createPrize.do"><button class="action_button" type="submit" >Suggest a New Prize</button></form>
					 </td>
					 <td>
					 	<form action="createAward.do"><button class="action_button" type="submit">Submit a Coworker for an Award</button></form>
					</td>
	</c:if>
				
				</tr>
				</tbody>
				</table>

	</div>
		<c:if test="${! empty sessionScope.prizes}">
	<div>
	
		<table>
		<tr>
			<td>
	        <h3 class="card-title" style="text-align:center">Search Prizes By Tier: </h3>
	          <form action="allPrizes.do" method="get">
				<select name="id" id="dropdown" required>
						<option value="1">Tier 1 - Copper</option>
						<option value="2">Tier 2 - Silver</option>
						<option value="3">Tier 3 - Gold</option>
				</select>
				<input type="submit" value="See Prizes" />
			</form>
			<br>
	</td>
	<td>
			<a href="allPrizes.do?id=0">See all prizes</a>
	</td> 
	
<c:if test="${role != 1}">
<c:choose>
	<c:when test="${empty claimedT }">
	<td>
			<form action="redeem.do?" method="GET">
			<input type="hidden" name="id" value="5"/>
				<input class="btn btn-success" type="submit" value="Claim a free company T-shirt!">
		</form>
	</td>
	</c:when>
	<c:otherwise></c:otherwise>
	</c:choose>
</c:if>
	</tr>
	</table>
	</div>
 </c:if>  		
   </c:when>
   <c:otherwise>
     <h2>Not logged in.</h2>
     <a href="login.do">Please log in to access your account information.</a>
   </c:otherwise>
 </c:choose>
</div>
</div>
</body>
</html>