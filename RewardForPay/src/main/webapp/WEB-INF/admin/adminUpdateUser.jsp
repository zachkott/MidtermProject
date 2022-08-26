<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel ="stylesheet" type ="text/css" href="CSS/homepage.css">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel ="stylesheet" type ="text/css" href="CSS/working.css">
 
 <style>
form i {
	margin-left: -30px;
	cursor: pointer;
}
</style>

</head>
<body>
<%@ include file="../nav.jsp" %>


<div class ="container-fluid">
<div class ="space">
<h1>SCHRUTE BUCKS</h1>


    <form action="adminUpdateUser.do" method="POST" class="well form-horizontal">
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
  <i class="bi bi-eye-slash" id="togglePassword"></i>
    </div>
  </div>
</div>
<br>

<input class="btn btn-warning" type="submit" value="Update User">
</fieldset>
</form>

</div>
</div>

<%-- <div class ="container-fluid">
<div class ="space">
<h1>Inside Admin Update User</h1>

<div class="form-row">
		<form action="adminUpdateUser.do" method="POST">
			<input type ="hidden" name ="id" value="${user.id}">
			<label for="username">Username:</label> 
			<input type="text" name="username" value="${user.username}"required="true"> 
			<br>
			<label for="password">Password:</label> 
			<input type="text" name="password" value="${user.password}"required="true"> 
			<br>
		
			<br>

			<input class="btn btn-success" type="submit" value="Update User">



		</form>
</div> --%>
<script>
        const togglePassword = document
            .querySelector('#togglePassword');
  
        const password = document.querySelector('#password');
  
        togglePassword.addEventListener('click', () => {
  
            // Toggle the type attribute using
            // getAttribure() method
            const type = password
                .getAttribute('type') === 'password' ?
                'text' : 'password';
                  
            password.setAttribute('type', type);
  
            // Toggle the eye and bi-eye icon
            this.classList.toggle('bi-eye');
        });
    </script>

</body>
</html>