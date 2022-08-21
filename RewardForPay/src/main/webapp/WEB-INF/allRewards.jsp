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
<h1>Browse the full list of prizes below:</h1>

<!-- Lists all prizes by tier or a full list of all prizes -->

		<c:choose>
		<c:when test="${! empty prizes}">
		<h1>test</h1>
			<div class="row row-cols-1 row-cols-md-3 g-${numOfPrizes}">
				<c:forEach var="prize" items="${prizes}">
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
			<h1>${prizeError}</h1>
		</c:otherwise>
	</c:choose>

</body>
</html>