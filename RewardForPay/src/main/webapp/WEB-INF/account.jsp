<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reward For Pay</title>
</head>
<body>
<%@ include file="nav.jsp" %>
<h1>I'm the Account Page</h1>

 <c:choose>
   <c:when test="${! empty sessionScope.loggedInUser}">
   <h2>Welcome, ${sessionScope.userinfo.firstName} ${sessionScope.userinfo.lastName}</h2>
   <h2>Welcome, ${sessionScope.loggedInUser.username} ${sessionScope.loggedInUser.password}</h2>
   		<br>
   		<h1>Welcome to Reward For Pay</h1>
   						<h5>What would you like to do?</h5>
				<br>
<!-- 	<ul>
					<li><a href="machineSearch.do" class="title">Update information</a></li>
					<br>
					<li><a href="machineSearch.do" class="title"> Create an award</a></li>
					<br>
					<li><a href="addMaintenance.do" class="title"> Create an employee</a></li>
					<br>
					<li> <a href="updateMaintenance.do" class="title"> Update/Delete a Maintenance Project</a></li>
</ul>
   
    -->
   
   
   
   		
   		
   		
   		
   		

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
					<td  rowspan=2><img class="detail_img" src="https://nextdayanimations.com/wp-content/uploads/photo-gallery/imported_from_media_libray/beny-realistic-marker-NDA-branded%20(1).png?bwg=1550011023" title="Illustrated headshot"/></td>
					<td class="buffer"></td>
					<td class="text-wrap col-md-offset-1" id="employee_info">
						<h1><strong>${sessionScope.userinfo.firstName} ${sessionScope.userinfo.lastName}</strong></h1><br>
						<ul style="list-style-type: none">
							<li><strong>Salary: </strong>${sessionScope.userinfo.salary}</li>
							<li class="text-wrap"><strong>Address: </strong>${sessionScope.userinfo.address.street}</li>
							<li><strong>Department: </strong>${sessionScope.userinfo.department}</li>
							<li>Birthday: <h4>${sessionScope.userinfo.birthday}</h4></li>
							<li>Reward Balance: <h4>${sessionScope.rewardBalance}</h4></li> <!-- do the logic in controller and pass the attribute value -->
						</ul>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<form action="editEmployee.do" method="get"> <!-- update with controller mapping -->
							<input type="hidden" value="${sessionScope.userinfo.id}" name="id" /> 
							<input class="action_button" type="submit" value="Edit Profile" />
						</form>
					</td>
				</tr>
				</tbody>
				</table>

	</div>
	<div>
	
		<c:if test="${! empty sessionScope.prizes}"/>
	        <h3 class="card-title" style="text-align:center">Search Prizes By Tier: </h3>
	          <form action="allPrizes.do" method="get">
				<select name="category" id="dropdown" required>
						<option value="1">Tier 1 - Copper</option>
						<option value="2">Tier 2 - Silver</option>
						<option value="3">Tier 3 - Gold</option>
				</select>
				<input type="submit" value="See Prizes" />
			</form>
			<br>
			<a href="allPrizes.do?id=0">See all prizes</a>
	
	
<!-- If user doesn't have any points, display message on how to get involved -->	
	
	<hr class="my-5">

  <!--Carousel Wrapper-->
  <div id="multi-item-example" class="carousel slide carousel-multi-item" data-ride="carousel">
    <!--Controls-->
    <div class="controls-top">
      <a class="btn-floating" href="#multi-item-example" data-slide="prev"><i class="fa fa-chevron-left"></i></a>
      <a class="btn-floating" href="#multi-item-example" data-slide="next"><i class="fa fa-chevron-right"></i></a>
    </div>
    <!--/.Controls-->

    <!--Slides-->
    <div class="carousel-inner" role="listbox">

      <!--First slide-->

	<c:set var="count" value="3" scope="page" />

	<c:forEach var="prize" items="${sessionScope.prizes}" >
		<c:choose>
			<c:when test="${count %3 == 0}">
			      <div class="carousel-item active">
			        <div class="row">
			          <div class="col-md-4">
			            <div class="card mb-2">
			              <img class="card-img-top" src="${sessionScope.prize.image}"
			                   alt="Card image cap">
			              <div class="card-body">
			                <h4 class="card-title">${sessionScope.prize.name}</h4>
			                <p class="card-text">${sessionScope.prize.points}</p>
			                <a href="prizeInfo.do?id=${sessionScope.prize.id}" class="btn btn-primary">Details</a>
							<c:set var="count" value="${count + 1}" scope="page"/>
			              </div>
			            </div>
			          </div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
			          <div class="col-md-4 clearfix d-none d-md-block">
			            <div class="card mb-2">
			              <img class="card-img-top" src="${sessionScope.prize.image}"
			                   alt="Card image cap">
			              <div class="card-body">
			                <h4 class="card-title">${sessionScope.prize.name}</h4>
			                <p class="card-text">${sessionScope.prize.points}</p>
			                <a href="prizeInfo.do?id=${sessionScope.prize.id}" class="btn btn-primary">Details</a>
			                <c:set var="count" value="${count + 1}" scope="page"/>
			              </div>
			            </div>
			          </div>
			
			</c:otherwise>
		</c:choose>
	</c:forEach>

      <!--Second slide-->
      <div class="carousel-item">

        <div class="row">
          <div class="col-md-4">
            <div class="card mb-2">
              <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Horizontal/City/4-col/img%20(60).jpg"
                   alt="Card image cap">
              <div class="card-body">
                <h4 class="card-title">Card title</h4>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                  card's content.</p>
                <a class="btn btn-primary">Button</a>
              </div>
            </div>
          </div>

          <div class="col-md-4 clearfix d-none d-md-block">
            <div class="card mb-2">
              <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Horizontal/City/4-col/img%20(47).jpg"
                   alt="Card image cap">
              <div class="card-body">
                <h4 class="card-title">Card title</h4>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                  card's content.</p>
                <a class="btn btn-primary">Button</a>
              </div>
            </div>
          </div>

          <div class="col-md-4 clearfix d-none d-md-block">
            <div class="card mb-2">
              <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Horizontal/City/4-col/img%20(48).jpg"
                   alt="Card image cap">
              <div class="card-body">
                <h4 class="card-title">Card title</h4>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                  card's content.</p>
                <a class="btn btn-primary">Button</a>
              </div>
            </div>
          </div>
        </div>

      </div>
      <!--/.Second slide-->

     </div>
    <!--/.Slides-->

  </div>
  <!--/.Carousel Wrapper-->


</div>
	
	
 <a href="createPrize.do" class="btn btn-primary">Suggest a New Prize</a>
 <a href="createAward.do" class="btn btn-primary">Submit a Coworker for an Award</a>
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		

   </c:when>
   <c:otherwise>
     <h2>Not logged in.</h2>
     <a href="login.do">Please log in to access your account information.</a>
   </c:otherwise>
 </c:choose>
 		

</body>
</html>