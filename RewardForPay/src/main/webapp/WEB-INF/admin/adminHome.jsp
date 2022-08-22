<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Inside Admin Home</h1>

<ul>
		<li><form action="adminAllUsers.do"><button type="submit" class="btn btn-danger btn-lg">See all Users </button></form></li><br>
		<li><form action="showAllEmployees.do"><button type="submit" class="btn btn-danger btn-lg">See all Employees </button></form></li><br>
		<li><form action="allPrizes.do"><button type="submit" class="btn btn-danger btn-lg">See all Prizes </button></form></li><br>
		<li><form action="pendingList.do"><button type="submit" class="btn btn-danger btn-lg">See all Requests </button></form></li><br>
		</ul>

</body>
</html>