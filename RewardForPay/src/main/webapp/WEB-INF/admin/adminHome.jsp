<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" type ="text/css" href="CSS/adminDashboard.css">
</head>
<body>
	

	


<div style="display:inline-block; height:30px">
</div>

	<div class="navigation">

		<ul>
		
			<li class="list active">
				<b></b>
				<b></b>
				<a href="home.do">
			 	  <span class="icon"><ion-icon 
			 	  name="home-outline"></ion-icon></span> 
			 	  <span class="title">Home</span>
				</a>
			</li>
		
			<li class="list">
				<b></b>
				<b></b>
				<a href="account.do">
			 	  <span class="icon"><ion-icon 
			 	  name="person-circle-outline"></ion-icon></span> 
			 	  <span class="title">Account</span>
				</a>
			</li>
			<li class="list">
				<b></b>
				<b></b>
				<a href="adminAllUsers.do">
			 	  <span class="icon"><ion-icon 
			 	  name="people-circle-outline"></ion-icon></span> 
			 	  <span class="title">Users</span>
				</a>
			</li>
			<li class="list">
				<b></b>
				<b></b>
				<a href="adminAllEmployees.do">
			 	  <span class="icon"><ion-icon 
			 	  name="people-outline"></ion-icon></span> 
			 	  <span class="title">Employees</span>
				</a>
			</li>
			<li class="list">
				<b></b>
				<b></b>
				<a href="allPrizes.do?id=0">
			 	  <span class="icon"><ion-icon
			 	   name="gift-outline"></ion-icon></span> 
			 	  <span class="title">Prizes</span>
				</a>
			</li>
			<li class="list">
				<b></b>
				<b></b>
				<a href="pendingList.do">
			 	  <span class="icon"><ion-icon 
			 	  name="albums-outline"></ion-icon></span> 
			 	  <span class="title">Requests</span>
				</a>
			</li>
			<li class="list">
				<b></b>
				<b></b>
				<a href="account.do" onclick="validateForm()">

			 	  <span class="icon"><ion-icon 
			 	  name="chatbubbles-outline"></ion-icon></span> 
			 	  <span class="title">Chat</span>
				</a>
			</li>
		
				<li class="list">
				<b></b>
				<b></b>
				<a href="changeToEmployee.do">
				<span class="icon"><ion-icon
				 name="finger-print-outline"></ion-icon></span>
			 	  <span class="title">Switch</span>
				</a>
			</li>
				<li class="list">
				<b></b>
				<b></b>
				<a href="logout.do">
				<span class="icon"><ion-icon name="log-out-outline"></ion-icon></span>
			 	  <span class="title">Logout</span>
				</a>
			</li>
		</ul>
	</div>


<div class="toggle">
<ion-icon name="menu-outline" class="open"></ion-icon>
<ion-icon name="close-outline" class="close"></ion-icon>


</div>



	<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>


<script>
let menuToggle = document.querySelector('.toggle');
let navigation = document.querySelector('.navigation')
menuToggle.onclick = function(){
	menuToggle.classList.toggle('active');
	navigation.classList.toggle('active');
}

</script>

<script>
let list = document.querySelectorAll('.list');
for (let i=0; i<list.length; i++){
	list[i].onmouseover = function(){
		let j = 0;
		while(j < list.length){
			list[j++].className= 'list';
		}
		list[i].className = 'list active';
	}
}

</script>

</body>
</html>