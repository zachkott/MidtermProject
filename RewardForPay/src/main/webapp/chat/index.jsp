<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->
	<link rel="stylesheet" href="css/index.css" crossorigin="anonymous">
	<script type="text/javascript" src="js/index.js"></script>
    <!------ Include the above in your HEAD tag ---------->
</head>
<body>

<div class="container">
	<div class="login-container">
            <div id="output"></div>
            <div class="avatar"></div>
            <div class="form-box">
                <form name="myForm" action=""  onsubmit="validateForm()">
                    <h3 id="username">${sessionScope.loggedInUser.username}"</h3>
                    <h3 id="userId">${sessionScope.loggedInUser.id}"</h3>
                    <button class="btn btn-info btn-block login" type="submit">Login
                </form>
            </div>
     </div>
        
</div>
</body>
</html>