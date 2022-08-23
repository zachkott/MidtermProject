<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create User</title>
</head>
<body>

<h1>Create New Account</h1>


<h1>Input Employee Details</h1>

<div class="form-row">
		<form action="createUser.do" method="POST">
			<label for="street">Street Address: </label> 
			<input type="text" name="street" required> 
			<br>
			<label for="city">City: </label> 
			<input type="text" name="city" required> 
			<br>
			<label for="state">State: </label> 
			<input type="text" name="state" required> 
			<br>
			<br>
			<label for="postalCode">Postal code: </label> 
			<input type="text" name="postalCode" required> 
			<br>
			<br>
			<label for="phone">Phone: </label> 
			<input type="text" name="phone" required> 
			<br>
			<label for="birthday">Birthday: </label> 
			<input type="date" name="date" placeholder="YYYY-MM-DD" required> 
			<br>



			


			<label for="firstName">Employee First Name: </label> 
			<input type="text" name="firstName" required> 
			<br>
			<label for="lastName">Employee Last Name: </label> 
			<input type="text" name="lastName" required> 
			<br>
			<label for="salary">Salary: </label> 
			<input type="number" name="salary" required> 
			<br>
			
     		<!--  <label for="birthday">Date of Birth</label>
      		<input type="date" class="form-control" name="birthday" placeholder="MM/DD/YYYY">
   			 <br> -->
		
			<!-- <input type="hidden" name="status" value="2"/> -->
			<%-- <input type="hidden" name="user" value="${sessionScope.loggedInUser.id}"/> --%>
			
		

			<label for="username">Username:</label> 
			<input type="text" name="username"required="true"> 
			<br>
			<label for="password">Password:</label> 
			<input type="text" name="password"required="true"> 
			<br>
			
		
			<br>
 

			<input class="btn btn-success" type="submit" value="Submit">



		</form>
</div>



<!-- <li class="nav-item">
        <form action="createUser.do" method="GET">
		<div class="form-group">
			<input class="btn btn-success" type="submit" value="Submit" />
		</div>
	</form> -->

</body>
</html>