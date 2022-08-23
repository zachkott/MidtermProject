<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">


<nav class="navbar navbar-expand-lg bg-light">
<c:choose>
		<c:when test="${role==1}">
<div class="container-fluid">
    <a class="navbar-brand" href="home.do">
          <img src="https://cdn.pixabay.com/photo/2014/12/21/23/57/money-576443__340.png" alt="" width="30" height="24" class="d-inline-block align-text-top">
		Reward For Pay
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
          <a class="nav-link" href="forum.do">Forum</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="reward.do">Rewards</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="login.do">Login</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="logout.do">Logout</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="adminHome.do">Admin Test</a>
        </li>
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
            <li><a class="dropdown-item" href="pendingList.do">Testing</a></li>
            <li><a class="dropdown-item" href="DanielTest.do">DTesting</a></li>
          </ul>
        </li>

      </ul>
            <form class="d-flex" action="searchAll.do" method="get">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" type="text" name="keyword">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>

		</c:when>
		<c:otherwise>
		<div class="container-fluid">
    <a class="navbar-brand" href="home.do">
          <img src="https://cdn.pixabay.com/photo/2014/12/21/23/57/money-576443__340.png" alt="" width="30" height="24" class="d-inline-block align-text-top">
		Reward For Pay
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
          <a class="nav-link" href="forum.do">Forum</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="reward.do">Rewards</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="login.do">Login</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="logout.do">Logout</a>
        </li>
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

      </ul>
            <form class="d-flex" action="searchAll.do" method="get">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" type="text" name="keyword">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>

		
		</c:otherwise>
		</c:choose>
		<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
</nav>

