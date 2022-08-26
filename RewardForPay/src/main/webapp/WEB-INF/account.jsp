<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function validateForm() {

        let username = document.getElementById("userId").value;
        let userId = document.getElementById("userId").value;
        let userImage = document.getElementById("userImage").src;


        localStorage.setItem("username", username);
        localStorage.setItem("userId", userId);
        localStorage.setItem("userImage", userImage);

        window.open("chat/chat-app.jsp", 'window', 'width=800, height=500, location=0, menubar=0');
}
</script>
<title>Reward For Pay</title>
<jsp:include page ="bootstrapHead.jsp" />
<link rel ="stylesheet" type ="text/css" href="CSS/adminDashboard.css">
<link rel ="stylesheet" type ="text/css" href="CSS/homepage.css">

</head>
<body>
<%@ include file="nav.jsp" %>

<div class="container-fluid">
<div class="account">
 <c:choose>
   <c:when test="${! empty sessionScope.loggedInUser}">

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
				<td colspan="3"><h1 class="left">Welcome to Schrute Bucks</h1></td>
				<br>
			</tr>
				<tr> 
					<td rowspan="2" colspan="2"><img class="detail_img col-md-4" id="userImage" src="${sessionScope.userinfo.employeePhoto}" title="${sessionScope.userinfo.firstName} ${sessionScope.userinfo.lastName}"/></td>
					<td class="text-wrap col-md-offset-1 col-md-8" id="employee_info">
						<h2 id="name-head" class="left"><strong>${sessionScope.userinfo.firstName} ${sessionScope.userinfo.lastName}</strong></h2><br>
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
									<input class="action_button2" type="submit" value="Get My First 100 Pts!">
							</form>
						</td>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
				</c:if>
				</tr>
				<tr>
					<td colspan="2" id="empDetails">
						<ul style="list-style-type: none">
						    <li id="userId" value="${sessionScope.loggedInUser.id}"><strong>Employee Id: </strong>${sessionScope.loggedInUser.id}</li>
							<li><strong>Salary: </strong>${sessionScope.userinfo.salary}</li>
							<li class="text-wrap"><strong>Address: </strong>${sessionScope.userinfo.address.street}</li>
							<li><strong>Department: </strong>${userinfo.department.name}</li>
							<li><strong>Birthday: </strong>${sessionScope.userinfo.birthday}</li>
							<li><strong>Reward Balance: </strong>${rewardBalance}</li> <!-- do the logic in controller and pass the attribute value -->
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
						<form action="account.do"><button type="submit" onclick="validateForm()" class="action_button">Chat with Friends</button></form>
						
					</td>
	<c:if test="${role != 1}">
					<td>
						<form action="createPrize.do"><button class="action_button" type="submit" >Suggest a New Prize</button></form>
					 </td>
					 <td>
					 	<form action="createAward.do"><button class="action_button" type="submit">Submit Coworker for Award</button></form>
					</td>
	</c:if>
				
				</tr>
				</tbody>
				</table>

	</div>
	<div>
	
		<table>
			<thead>
				<tr>
					<th class="col-9" colspan="2"></th>
					<th class="col-3"></th>
				</tr>
			</thead>
			<tbody>
			<br>
			<tr>
			<td>
	        <h3 class="card-title" id="tier" style="text-align:center">Search Prizes By Tier: </h3>
	          <form action="allPrizes.do" method="get">
				<select name="id" id="dropdown" required>
						<option value="1">Tier 1 - Copper</option>
						<option value="2">Tier 2 - Silver</option>
						<option value="3">Tier 3 - Gold</option>
				</select>
				<input type="submit" class="action_button" value="See Prizes" />
			</form>
			<br>
			</td>
			<td>
			<a href="allPrizes.do?id=0"><h3>See all prizes</h3></a>
			</td> 
	
			<c:if test="${role != 1}">
			<c:choose>
				<c:when test="${empty claimedT }">
				<td>
						<form action="redeem.do?" method="GET">
						<input type="hidden" name="id" value="5"/>
							<input class="action_button2" type="submit" value="Claim a free company T-shirt!">
					</form>
				</td>
				</c:when>
				<c:otherwise></c:otherwise>
				</c:choose>
			</c:if>
				</tr>
				</tbody>
			</table>
	</div>
	<c:choose>
	<c:when test="${! empty sessionScope.wishlist}">
	
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
 				<form action="wishlist.do"><button class="action_button" type="submit" >See Wishlist</button></form>
 			</c:otherwise>
 			</c:choose>  		
					<br><br>
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
