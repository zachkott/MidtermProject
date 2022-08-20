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
<h1>Welcome to Reward For Pay</h1>
${SMOKETEST}


<!-- Test for create user-->
<li class="nav-item">
        <form action="createUserAccountForm.do">
		<div class="form-group">
			<input class="btn btn-success" type="submit" value="Create New Account" />
		</div>
	</form>

</body>
</html>