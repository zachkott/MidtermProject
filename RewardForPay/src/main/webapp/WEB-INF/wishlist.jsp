<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wishlist</title>
<link rel ="stylesheet" type ="text/css" href="CSS/homepage.css">
</head>
<body>
	<%@ include file="nav.jsp"%>



	<h1>Wishlist</h1>

	<div class="container-fluid">
		<table class="table table-striped table-hover">

			<c:choose>
				<c:when test="${! empty wishlist }">
					<div class="row row-cols-1 row-cols-md-4 g-${numOfPrizes}">
					<c:forEach var="prize" items="${wishlist}">
					  <div class="col">
					    <div class="card h-100">
					      <a href="reward.do?id=${prize.id}"><img class="card-img-top " src="${prize.image}" alt="${prize.name}"/></a>
					      <div class="card-body">
					        <h5 class="card-title">${prize.name}</h5>
					        <p class="card-text">Schrute Bucks: ${prize.points}</p>
					        <p class="card-text">Prize Tier ${prize.tier.id}</p>
					        <p class="card-text"><a class="btn btn-xs btn-warning" href="removeFromWishlist.do?prizeId=${prize.id}"> Remove </a>
					      </div>
					    </div>
					  </div>
					</c:forEach>
				</div>
					
	
				</c:when>
				<c:otherwise>
					<h1>Your wishlist is empty :(</h1>
				</c:otherwise>
			</c:choose>
			<!-- </tr> -->
		</table>
	</div>


</body>
</html>