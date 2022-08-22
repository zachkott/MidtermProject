<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Prize</title>
</head>
<body>
<%@ include file="nav.jsp" %>

<h1>Create New Prize</h1>

<div class="form-row">
		<form action="createPrize.do" method="POST">
			<label for="name">Name of Prize: </label> 
			<input type="text" name="name" required> 
			<br>
			<label for="description">Description: </label> 
			<input type="text" name="description" required> 
			<br>
			<label for="points">Suggested Number of Points: </label> 
			<input type="number" name="points" required> 
			<br>
			<label for="image">Image URL: </label> 
			<input type="text" name="image" required> 
			<br>

			<input class="btn btn-success" type="submit" value="Submit">
		</form>
</div>
</body>
</html>