<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Prize</title>
<link rel ="stylesheet" type ="text/css" href="CSS/adminDashboard.css">

</head>
<body>
<%@ include file="nav.jsp" %>


<div class="container-fluid">
<div class="space">


  <form action="createPrize.do" method="POST" class="well form-horizontal">
<fieldset>
<!-- Form Name -->
<legend><center><h2><b>Suggest Schrute Reward</b></h2></center></legend><br>

<!-- Text input-->
 

<div class="form-group">
  <label class="col-md-4 control-label">Reward Name:</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input  name="name"   class="form-control"  type="text" required>
    </div>
  </div>
</div>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label" >Description:</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input type="text" name="description"  class="form-control"   required>
 
    </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" >Schrute Bucks:</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input type="number" name="points"  class="form-control"   required>
 
    </div>
  </div>
</div>


<div class="form-group">
  <label class="col-md-4 control-label" >Image URL:</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input type="text" name="image"  class="form-control"   required>
 
    </div>
  </div>
</div>
<br>

<input class="btn btn-warning" type="submit" value="Submit Suggestion">
</fieldset>
</form>




<!-- <h1>Create New Prize</h1>

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
</div> -->

</div>
</div>
</body>
</html>