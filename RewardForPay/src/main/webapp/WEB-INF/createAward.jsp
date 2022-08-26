<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Submit Award</title>
<link rel ="stylesheet" type ="text/css" href="CSS/adminDashboard.css">
<link rel ="stylesheet" type ="text/css" href="CSS/working.css">
 <link rel ="stylesheet" type ="text/css" href="CSS/homepage.css">

</head>
<body>
<%@ include file="nav.jsp" %>



<div class="container-fluid">
<div class="space">


  <form action="createAward.do" method="POST" class="well form-horizontal">
<fieldset>
<!-- Form Name -->
<legend><center><h2><b>Submit a Coworker for an Award</b></h2></center></legend><br>

<!-- Text input-->
 
<div class="center">
<div class="form-group">
  <label class="col-md-4 control-label">Employee ID:</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input  name="empId"   class="form-control"  type="text" required>
    </div>
  </div>
</div>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label" >Award Justification:</label> 
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
  <input type="hidden" name="userId" value="${sessionScope.loggedInUser.id}"/>
 
    </div>
  </div>
</div>



<br>

<input class="btn btn-warning" type="submit" value="Submit">
</div>
</fieldset>
</form>


<%-- <div class="container-fluid">
<div class="space">


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
		</div> --%>
</div>
</div>
</body>
</html>