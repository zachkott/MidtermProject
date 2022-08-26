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
<div class ="container-fluid">
<div class ="space">
<h1>SCHRUTE REWARDS</h1>
<c:choose>
	<c:when test="${! empty prize}">
	<h2>
					<strong>${redeemed}  ${userinfo.address.street}</strong>
				</h2>
	<div class="table-responsive">
		<table>
			<tbody>
				<tr>
					<td  rowspan=3><img class="detail_img" src="${prize.image}" title="${prize.name}"/></td>
					<td class="buffer"></td>
					<td colspan=3 class="text-wrap col-md-offset-1" id="prize_info">
						<h1><strong>${prize.name}</strong></h1><br>
						<ul style="list-style-type: none">
							<li class="text-wrap"><strong>Description: </strong>${prize.description}</li>
							<li><strong>Tier: </strong>${prize.tier.name}</li>
							<li>Number of Points: <h4>${prize.points}</h4></li>
						</ul>
					</td>
				</tr>
		       <tr>
		       	  <td></td>
			   </tr>
			</tbody>
		</table>
	</div>
	</c:when>
	<c:otherwise>
		<h2>${ Failed}</h2>
	</c:otherwise>
	</c:choose>
</div>
</div>
</body>
</html>