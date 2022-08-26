<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update User Details</title>
<link rel ="stylesheet" type ="text/css" href="CSS/adminDashboard.css">

<link rel ="stylesheet" type ="text/css" href="CSS/working.css">
<link rel ="stylesheet" type ="text/css" href="CSS/homepage.css">

<!-- <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous"> -->
</head>
<body>
<%@ include file="../nav.jsp" %>

<h1>SCHRUTE BUCKS</h1>
<div class ="container-fluid">
<div class ="center">


    <form action="updateUser.do" method="POST" class="well form-horizontal">
<fieldset>
<!-- Form Name -->
<legend><center><h2><b>Update Login Credentials</b></h2></center></legend><br>

<!-- Text input-->
 
<input type ="hidden" name ="id" value="${user.id}">
<div class="form-group">
  <label class="col-md-4 control-label">Username:</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input  name="username"  value="${user.username}" class="form-control"  type="text" required>
    </div>
  </div>
</div>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label" >Password:</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input type="password" name="password" value="${user.password}" class="form-control"   required>
 
    </div>
  </div>
</div>
<br>

<input class="btn btn-warning" type="submit" value="Update User">
</fieldset>
</form>

</div>
</div>

<%-- <div class="container-fluid">
<div class="space">
<div class="form-row">
		<form action="updateUser.do" method="POST">
			<input type ="hidden" name ="id" value="${user.id}">
			<label for="username">Username:</label> 
			<input type="text" name="username" value="${user.username}"required="true"> 
			<br>
			<label for="password">Password:</label> 
			<input type="text" name="password" value="${user.password}"required="true"> 
			<br>
		
			<br>

			<input class="btn btn-success" type="submit" value="Update Login">



		</form>
</div>
</div>
</div> --%>
</body>
</html>