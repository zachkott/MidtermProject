<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reward For Pay</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">


<style>
form i {
	margin-left: -30px;
	cursor: pointer;
}
</style>


</head>
<body>
	<%@ include file="nav.jsp"%>
	<h1>This is the Login Page</h1>
	<h2>Log In</h2>
	<h1>${NotFound}</h1>
	<form action="login.do" method="POST">
		<%-- Error messages --%>
		<input type="text" name="username"> <br>
		<!-- Add ability to show password -->
		<!-- 	<input type="password" name="password"  id ="myPassword"/>
 -->
		<input type="password" name="password" id="password" /> <i
			class="bi bi-eye-slash" id="togglePassword"></i> <br> <input
			type="submit" value="Log In">
	</form>
	
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