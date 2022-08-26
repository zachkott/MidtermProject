<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" type ="text/css" href="CSS/adminDashboard.css">
<link rel ="stylesheet" type ="text/css" href="CSS/working.css">
 <link rel ="stylesheet" type ="text/css" href="CSS/homepage.css">

</head>
<body>
<%@ include file="../nav.jsp" %>



<div class ="container-fluid">
<div class ="space">
<h1>SCHRUTE BUCKS</h1>






<div class="container-fluid">

    <form action="adminUpdateEmployee.do" method="POST" class="well form-horizontal">
<fieldset>

<!-- Form Name -->
<legend><center><h2><b>Update Employee Details</b></h2></center></legend><br>

<!-- Text input-->
 <input type ="hidden" name ="id" value="${employee.id}">
<div class ="center">
<div class="form-group">
  <label class="col-md-4 control-label">First Name:</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input  name="firstName" value="${employee.firstName}" class="form-control"  type="text" required>
    </div>
  </div>
</div>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label" >Last Name:</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input name="lastName" value="${employee.lastName}" class="form-control"  type="text" required>
    </div>
  </div>
</div>

  <div class="form-group"> 
  <label class="col-md-4 control-label">Department:</label>
    <div class="col-md-4 selectContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
    <select name="depId" class="form-control selectpicker" required>
      <option value="${employee.department.name}">Select your Department</option>
				<option value=3>Engineering</option>
				<option value=4>Human Resources</option>
				<option value=5>Operations</option>
				<option value=6>Marketing</option>
				<option value=7>Maintenance</option>
				<option value=8>Technology</option>
				<option value=9>Guest</option>
				<option value=10>Customer Service</option>
    </select>
  </div>
</div>
</div>
  
<!-- Text input-->



<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label" >Street:</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input name="street" value="${employee.address.street}" class="form-control"  type="text" required>
    </div>
  </div>
</div>

<!-- Text input-->
       <div class="form-group">
  <label class="col-md-4 control-label">State:</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  <input name="state" value="${employee.address.state}" class="form-control"  type="text" required>
    </div>
  </div>
</div>
    <div class="form-group">
  <label class="col-md-4 control-label">City:</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  <input name="city" value="${employee.address.city}" class="form-control"  type="text" required>
    </div>
  </div>
</div>
 <div class="form-group">
  <label class="col-md-4 control-label">Postal Code:</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  <input name="postalCode" value="${employee.address.postalCode}" class="form-control"  type="text" required>
    </div>
  </div>
</div>
 <div class="form-group">
  <label class="col-md-4 control-label">Birthday:</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  <input name="date" value="${employee.birthday}" class="form-control"  type="date" required>
    </div>
  </div>
</div>
 <div class="form-group">
  <label class="col-md-4 control-label">Salary:</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  <input name="salary" value="${employee.salary}" class="form-control"  type="text" required>
    </div>
  </div>
</div>
<!-- Text input-->
       
<div class="form-group">
  <label class="col-md-4 control-label">Contact No.</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
  <input name="phone" value="${employee.address.phone}" class="form-control" type="text" required>
    </div>
  </div>
</div>
<br>
			<input type = "hidden" name = "addressId" value ="${employee.address.id}">
<br>

	<input class="btn btn-warning" type="submit" value="Update Employee">
	
	
	</div>
</fieldset>
</form>
</div>

</div>
</div>
</body>
</html>