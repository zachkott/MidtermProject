<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reward For Pay</title>
</head>
<body>
<%@ include file="nav.jsp" %>
<c:choose>
	<c:when test="${! empty Failed}">
	${ Failed}
	</c:when>
					<c:otherwise>
	<table id="actions">
		<tr>
			<td rowspan=4><img class="form_img" src="${prize.image}"
				width=50% title="Site image" /></td>
			<td colspan=3><h2>
					<strong>${redeemed}</strong>
				</h2></td>
				<td colspan=3><h3>Shipping: ${userinfo.address.street}</h3>
				</td>
		</tr>
		<tr>

			<td align=left><c:if test="${! empty prize}">
					<td colspan=3 class="text-wrap col-md-offset-1" id="site_info">
						<h1>
							<strong>${prize.name}</strong>
						</h1>
						<br>
						<ul style="list-style-type: none">
							<li class="text-wrap"><strong>Description: </strong>${prize.description}</li>
							<li><strong>Tier: </strong>${prize.tier.name}</li>
							<li>Number of Points: <h4>${prize.points}</h4></li>
						</ul>
					</td>
				</c:if>
		</tr>
		<tr class="action_items .justify-content-end">
			<td class="buffer"></td>

			<td class="buffer"></td>
			<td class="buffer"></td>
			<td class="buffer"></td>
		</tr>
	</table>
	</c:otherwise>
</c:choose>	
</body>
</html>