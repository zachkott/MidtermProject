<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<link rel ="stylesheet" type ="text/css" href="CSS/homepage.css">


<nav class="navbar navbar-expand-lg bg-light" id="navbarBG">
<!-- role is coming from LoginController -->
	<c:if test="${role==2}">
		<div class="container-fluid">
    <a class="navbar-brand" href="home.do">
          <img src="https://cdn.pixabay.com/photo/2014/12/21/23/57/money-576443__340.png" alt="" width="30" height="24" class="d-inline-block align-text-top">
		Schrute Bucks
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home.do">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="account.do">Account</a>
        </li>
          <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Events
          </a>
           <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="eventsList.do?empId=${sessionScope.userinfo.id}">Join an Event</a></li>
            <li><a class="dropdown-item" href="joinedEvents.do?empId=${sessionScope.userinfo.id}">Registered Events</a></li>
            <li><a class="dropdown-item" href="createEvent.do">Create Event</a></li>
          </ul>
         <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Employee Controls
          </a>
           <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="wishlist.do">Wishlist</a></li>
            <li><a class="dropdown-item" href="allPrizes.do?id=0">Prizes</a></li>
            <li><a class="dropdown-item" href="claimedPrizes.do">Claimed Prizes</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="changeToAdmin.do">Switch to Admin Profile</a></li>          
          </ul>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            External Links
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="https://github.com/SkillDistillery/SD34/blob/main/sql1/images/ERDiagram.png"target="_blank">ER Diagram</a></li>
            <li><a class="dropdown-item" href="https://getbootstrap.com/docs/5.2/components/navbar/"target="_blank">BootStrap</a></li>
            <li><a class="dropdown-item" href="https://github.com/SkillDistillery/SD34/blob/main/SpringMVC/IntroSpringMVC/13_steps.md"target="_blank">13 Steps</a></li>
            <li><a class="dropdown-item" href="https://mvnrepository.com/"target="_blank">MVN Rep</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="https://us02web.zoom.us/j/89671861478?pwd=UkcyQ0VhYU0ycCtEbllYQm5veEhWUT09"target="_blank">GetSkilled</a></li>
            <li><a class="dropdown-item" href="https://us02web.zoom.us/j/81164088712?pwd=TWZ4SFdWeXppYmF2cUZ5MENoZzdDdz09"target="_blank">GetTAHelp</a></li>
          </ul>
        </li>
	<li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Settings
          </a>
          <ul class="dropdown-menu">
         	<li><a class="dropdown-item" href="updateUserForm.do?id=${sessionScope.userinfo.user.id}">Update User Info</a></li>
         	<li><a class="dropdown-item" href="updateEmployeeForm.do?id=${sessionScope.userinfo.id}">Update Employee Info</a></li>
         	<li><a class="dropdown-item" href="logout.do">Logout</a></li>
          </ul>
        </li>
                <li class="nav-item">
          <a class="nav-link" href="contact.do">Contact Us</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="logout.do">Logout</a>
        </li>
      </ul>
            <form class="d-flex" action="searchEmployee.do" method="get">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" type="text" name="keyword">
        <button class="btn btn-warning" type="submit">Search</button>
      </form>
    </div>
  </div>

	</c:if>

	<c:if test="${role==1}">
		<div class="container-fluid">
    <a class="navbar-brand" href="home.do">
          <img src="https://cdn.pixabay.com/photo/2014/12/21/23/57/money-576443__340.png" alt="" width="30" height="24" class="d-inline-block align-text-top">
		Schrute Bucks
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Events
          </a>
           <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="eventsList.do?empId=${sessionScope.userinfo.id}">Join an Event</a></li>
            <li><a class="dropdown-item" href="joinedEvents.do?empId=${sessionScope.userinfo.id}">Registered Events</a></li>
            <li><a class="dropdown-item" href="createEvent.do">Create Events</a></li>
          </ul>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Admin Controls
          </a>
           <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="adminAllUsers.do">Show All Users</a></li>
            <li><a class="dropdown-item" href="adminAllEmployees.do">Show All Employees</a></li>
            <li><a class="dropdown-item" href="allPrizes.do?id=0">Show All Prizes</a></li>
            <li><a class="dropdown-item" href="pendingList.do">Show All Requests</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="wishlist.do">Wishlist</a></li>
            <li><a class="dropdown-item" href="changeToEmployee.do">Switch to Employee Profile</a></li>
          </ul>
          
          	<li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            Settings
	          </a>
	          <ul class="dropdown-menu">
	         	<li><a class="dropdown-item" href="updateUserForm.do?id=${sessionScope.userinfo.user.id}">Update User Info</a></li>
	         	<li><a class="dropdown-item" href="updateEmployeeForm.do?id=${sessionScope.userinfo.id}">Update Employee Info</a></li>
	         	<li><a class="dropdown-item"href="logout.do">Logout</a></li>
	          </ul>
	        </li>
          
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            External Links
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="https://github.com/zachkott/MidtermProject/blob/main/DB/rewardforpay.png"target="_blank">ER Diagram</a></li>
            <li><a class="dropdown-item" href="https://getbootstrap.com/docs/5.2/components/navbar/"target="_blank">BootStrap</a></li>
            <li><a class="dropdown-item" href="https://github.com/SkillDistillery/SD34/blob/main/SpringMVC/IntroSpringMVC/13_steps.md"target="_blank">13 Steps</a></li>
            <li><a class="dropdown-item" href="https://mvnrepository.com/"target="_blank">MVN Rep</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="https://us02web.zoom.us/j/89671861478?pwd=UkcyQ0VhYU0ycCtEbllYQm5veEhWUT09"target="_blank">GetSkilled</a></li>
            <li><a class="dropdown-item" href="https://us02web.zoom.us/j/81164088712?pwd=TWZ4SFdWeXppYmF2cUZ5MENoZzdDdz09"target="_blank">GetTAHelp</a></li>
          
          </ul>
                          <li class="nav-item">
          <a class="nav-link" href="contact.do">Contact Us</a>
        </li>
                  <li class="nav-item">
          <a class="nav-link" href="logout.do">Logout</a>
        </li>

      </ul>
            <form class="d-flex" action="searchEmployee.do" method="get">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" type="text" name="keyword">
        <button class="btn btn-warning" type="submit">Search</button>
      </form>
    </div>
  </div>

	</c:if> 
	
	<c:if test="${role==3}">
		<div class="container-fluid">
    <a class="navbar-brand" href="home.do">
          <img src="https://cdn.pixabay.com/photo/2014/12/21/23/57/money-576443__340.png" alt="" width="30" height="24" class="d-inline-block align-text-top">
		Schrute Bucks
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home.do">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="account.do">Account</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="eventsList.do?empId=${sessionScope.userinfo.id}">Events</a>
        </li>
                        <li class="nav-item">
          <a class="nav-link" href="contact.do">Contact Us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="logout.do">Logout</a>
        </li>
      </ul>

    </div>
  </div>
    </c:if>
    
	<c:if test="${empty role}">
		<div class="container-fluid">
    <a class="navbar-brand" href="home.do">
          <img src="https://cdn.pixabay.com/photo/2014/12/21/23/57/money-576443__340.png" alt="" width="30" height="24" class="d-inline-block align-text-top">
		Schrute Bucks
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home.do">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="account.do">Account</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="login.do">Login</a>
        </li>
                        <li class="nav-item">
          <a class="nav-link" href="contact.do">Contact Us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="createUserAccountForm.do">Register</a>
        </li>
      </ul>

    </div>
  </div>
  
	</c:if>
		<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
</nav>

<body>
<c:if test="${ role == 1}">
<%@ include file="admin/adminHome.jsp"%>
<input type="hidden" id="username" value="${sessionScope.loggedInUser.username}">
<input type="hidden" name="userId" id="userId" value="${sessionScope.loggedInUser.id}"/>

</c:if>

</body>
