<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Event</title>
<link rel ="stylesheet" type ="text/css" href="CSS/adminDashboard.css">

</head>
<body>
<%@ include file="nav.jsp" %>

<div class="container-fluid">
<div class="space">

<h1>Create an event:</h1>
		<div class="form-row">
			<form action="createEvent.do" method="POST">
			<!-- Might need to play with mapping for Employee -->
				<input type="hidden" name="empId" value="8"/>
				<br>
				<label for="description">Event Description </label> 
				<input type="text" name="description" value="EVENT:" required> 
				<br>
				<label for="amount">Suggested Number of Points: </label> 
				<input type="number" name="amount" required> 
				<br>
				<br>
				<label for="amount">Date of event: </label> 
				<input type="date" name="date" placeholder="YYYY-MM-DD" required> 
				<br>
				<input type="hidden" name="userId" value="8"/>
				<input class="btn btn-success" type="submit" value="Submit">
			</form>
		</div>
</div>
</div>
</body>
</html>