<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="nav.jsp"%>



	<h1>Inside Wishlist</h1>

	<div class="container-fluid">
		<table class="table table-striped table-hover">

			<c:choose>
				<c:when test="${! empty wishlist }">
					<c:forEach items="${wishlist}" var="prize">
						<tr>
							<td><a href="reward.do?id=${prize.id}">${prize.name}</a></td>
							<td><a href="reward.do?id=${prize.id}">${prize.points}</a></td>
							<td><img class="card-img-top " src="${prize.image}"></td>
<%-- 							<td><a href="getPrize.do?id=${prize.id}">${prize.image}</a></td>
 --%>							<td><a href="reward.do?id=${prize.id}">${prize.description}</a></td>



							<td><form action="removeFromWishlist.do">
									<input type="hidden" name="prizeId" value="${prize.id}" />
									<button type="submit" class="btn btn-danger">Remove
										From Wishlist</button>
								</form></td>
					</c:forEach>
				</c:when>

			</c:choose>
			</tr>
		</table>
	</div>


</body>
</html>