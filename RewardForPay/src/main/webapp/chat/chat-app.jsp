<!DOCTYPE html>
<html>
	<head>
		<title>Chat</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.js"></script>
		<link rel="stylesheet" href="chat.css" crossorigin="anonymous">
		<script type="text/javascript" src="websocket.js"></script>

		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.0/handlebars.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/list.js/1.1.1/list.min.js"></script>
		<!--    libs for stomp and sockjs-->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>


	</head>
	<body>
		<div class="container-fluid h-100">
		
			<div class="row justify-content-center h-100">
	
				<div class="col-md-4 col-xl-3 chat"><div class="card mb-sm-3 mb-md-0 contacts_card">
 					<div class="card-header">
					</div>  
					<div class="card-body contacts_body">
						<ui class="contacts"  id="usersList">

						</ui>
					</div>
					<div>
						<hr>
						<h6>My Group</h6>
						<ui class="contacts"  id="groupList">

						</ui>
				
					</div>
				</div>
				</div>
				<div class="col-md-8 col-xl-6 chat">
					<div class="card">
						<div class="card-header msg_head" id="formMessageHeader">
							<div class="d-flex bd-highlight">
								<div class="img_cont">
									<img src="${userinfo.employeePhoto}" class="rounded-circle user_img">
									<span class="online_icon"></span>
								</div>
								<div class="user_info">
									<span id="username"></span>
									<p></p>
								</div>
							</div>
						
						</div>
						<div class="card-body msg_card_body" id="formMessageBody">
							
						</div>
						<div class="card-footer">
							<div class="input-group" id="formSubmit">
								<div class="input-group-append">
									<span class="input-group-text attach_btn"><i class="fas fa-paperclip"></i></span>
								</div>
								<textarea id="message-to-send" name="message-to-send" class="form-control type_msg" placeholder="Type your message..."></textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>