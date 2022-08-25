<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" type ="text/css" href="CSS/adminDashboard.css">

</head>
<body>
<%@ include file="../nav.jsp" %>

<div class="container-fluid">
<div class="space">

<h1>Settings</h1>
<ul>
<li class ="links">
<form action="updateUserForm.do">
<input type ="hidden" name="id" value="${sessionScope.userinfo.user.id}">
<button type="submit" class="btn btn-success btn-sm">Update Login Credentials</button></form></li>

<li>
<form action="updateEmployeeForm.do" method="POST">
<input type ="hidden" name ="id" value="${sessionScope.userinfo.id}">
<button type="submit" class="btn btn-success btn-sm">Update Employee Profile</button></form></li>

</ul>

</div>
</div>
</body>
</html>