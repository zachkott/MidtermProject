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



<div class="container-fluid">
<div class="account">
<h1>Browse the full list of prizes below:</h1>

<!-- Lists all prizes by tier or a full list of all prizes -->
		<c:choose>
			<c:when test="${! empty record}">
				
				<div class="row row-cols-1 row-cols-md-5 g-${numOfPrizes}">
					<c:forEach var="prize" items="${record}">
					  <div class="col">
					    <div class="card h-100">
					      <a href="reward.do?id=${prize.id}"><img class="card-img-top " src="${prize.image}" alt="${prize.name}"/></a>
					      <div class="card-body">
					        <h5 class="card-title">${prize.name}</h5>
					        <p class="card-text">${prize.points}, Tier ${prize.tier.id}</p>
					      </div>
					    </div>
					  </div>
					</c:forEach>
				</div>
			</c:when>
			<c:otherwise>
				<h1>You do not have any claimed prizes yet. <a href="eventsList.do?empId=${sessionScope.userinfo.id}">Start earning points!</a></h1>
			</c:otherwise>
		</c:choose>
</div>
</div>
		
</body>
</html>