<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Submit Award</title>
</head>
<body>
<%@ include file="nav.jsp" %>

<h1>Submit a Coworker for an Award</h1>
		<div class="form-row">
			<form action="createAward.do" method="POST">
			<!-- Might need to play with mapping for Employee -->
				<label for="empId">Employee ID: </label> 
				<input type="text" name="empId" required> 
				<br>
				<label for="description">Award Justification: </label> 
				<input type="text" name="description" required> 
				<br>
				<label for="amount">Suggested Number of Points: </label> 
				<input type="number" name="amount" required> 
				<br>
				<input type="hidden" name="userId" value="${sessionScope.loggedInUser.id}"/>
				<input class="btn btn-success" type="submit" value="Submit">
			</form>
		</div>

</body>
</html>