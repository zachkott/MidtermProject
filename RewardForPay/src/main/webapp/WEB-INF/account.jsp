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
        
        window.location.href = "chat-app.jsp";

        let username = document.getElementById("username").value;
        let userId = document.getElementById("userId").value;
        let userImage = document.getElementById("userImage").src;
        
        localStorage.setItem("username", username);
        localStorage.setItem("userId", userId);
        localStorage.setItem("userImage", userImage);
        
        window.location.href = "chat-app.jsp";

}
</script>
<title>Reward For Pay</title>
<jsp:include page ="bootstrapHead.jsp" />
<link rel ="stylesheet" type ="text/css" href="CSS/adminDashboard.css">


</head>
<body>
<%@ include file="nav.jsp" %>

<div class="container-fluid">
<div class="account">
<h1>I'm the Account Page</h1>

<!-- CREATE A REDIRECT TO ADMIN DASHBOARD PAGE -->

 <c:choose>
   <c:when test="${! empty sessionScope.loggedInUser}">
   <a href="../chat/chat-app.jsp" onclick="validateForm()" >CHAT!!!</a>
   
   <h2>Welcome, ${sessionScope.userinfo.firstName} ${sessionScope.userinfo.lastName}</h2>
   		<br>
   		<h1>Welcome to Reward For Pay</h1>
   						<h5>What would you like to do?</h5>
				<br>

<!-- Main home page for a logged in user -->

<!-- Payroll dashboard, employee photo, and reward tier carousel: navbar has notifications for chat/requests
	reward carousel goes to rewards in their current tier
	page will diplay how to get reward points if user doesn't have any
	dropdown menu to view all tiers
	suggest a new reward
	submit coworker for award
-->
	<div class="table-responsive">
		<table>
			<tbody>
				<tr> <!-- Employee photo url move to database -->
					<td  rowspan=2><img width="40%" class="detail_img" id="userImage" src="${sessionScope.userinfo.employeePhoto}" title="Illustrated headshot"/></td>
					<td class="buffer"></td>
					<td class="text-wrap col-md-offset-1" id="employee_info">
						<h1><strong>${sessionScope.userinfo.firstName} ${sessionScope.userinfo.lastName}</strong></h1><br>
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
					<td></td>
					<td>
						<form action="updateUserForm.do"><input type ="hidden" name="id" value="${sessionScope.userinfo.user.id}"><button type="submit" class="btn btn-primary btn-sm">Update login info</button></form>
					
						<form action="updateEmployeeForm.do"> <!-- update with controller mapping -->
							<input type="hidden" value="${sessionScope.userinfo.id}" name="id" /> 
							<input class="action_button" type="submit" value="Edit Profile" />
						</form>
					</td>
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
	<c:choose>
	<c:when test="${empty claimed }">
	<td>
			<form action="createAward.do" method="POST">
				<input type="hidden" name="description" value="Initial Point Award"/>
				<input type="hidden" name="amount" value="100"/>
				<input type="hidden" id="username" value="${sessionScope.loggedInUser.id}">
				<input type="hidden" name="userId" id="userId" value="${sessionScope.loggedInUser.id}"/>
				<input type="hidden" name="empId" value="${sessionScope.userinfo.id}"/>
				<input class="btn btn-success" type="submit" value="Get My First 100 Pts!">
		</form>
	</td>
	</c:when>
	<c:otherwise></c:otherwise>
	</c:choose>
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
	</tr>
	</table>
	</div>
<!-- If user doesn't have any points, display message on how to get involved -->	
	
	
    
   

    <div class="row row-cols-1 row-cols-md-5 g-${numOfPrizes}">
					<c:forEach var="item" items="${prizes}">
					  <div class="col">
					    <div class="card h-100">
					      <a href="reward.do?id=${item.id}"><img class="card-img-top " src="${item.image}" alt="${item.name}"/></a>
					      <div class="card-body">
					        <h5 class="card-title">${item.name}</h5>
					        <p class="card-text">${item.points}, Tier ${item.tier.id}</p>
					      </div>
					    </div>
					  </div>
					</c:forEach>
				</div>
	
 <a href="createPrize.do" class="btn btn-primary">Suggest a New Prize</a>
 <a href="createAward.do" class="btn btn-primary">Submit a Coworker for an Award</a>
   		
   		
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