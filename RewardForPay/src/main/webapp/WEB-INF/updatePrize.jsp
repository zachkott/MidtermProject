<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Prize Details</title>
</head>
<body>
<%@ include file="nav.jsp" %>
<div class="container-fluid">
<div class="space">
	<table id="actions">
		<tr>
			<td rowspan=4><img class="form_img"
				src="${prize.image}"
				width=50% title="${prize.name}" /></td>
			<td colspan=3><h2><strong>Update Prize Info: </strong></h2></td>
		</tr>
		<tr>
			<td class="form_buffer"></td>
		
			<td align=left>
				<h4 class="head2">*All fields must have a value*</h4>
			    <form class="forms" action="updatePrize.do" method="POST">
			  		 <label for="name">Name of Prize: </label><br> 
						<input type="text" name="name" value="${prize.name}" required /> <br> 
					<label for="description">Description: </label><br> 
						<input type="text" name="description" value="${prize.description}" required /> <br> 
					<label for="image">Image URL: </label> <br> 
						<input type="text" name="image" value="${prize.image}" required> <br> 
					<label for="points">Number of Points: </label><br> 
						<input type="number" name="points" value="${prize.points}" step="any" required> <br> 
						<input type="hidden" value="${prize.id}" name="id"/>
					<br><input  class="action_button" type="submit" value="Update Prize" />
				</form>
			</td>
			<td class="form_buffer"></td>
	      </tr>
    </table>
</div>
</div>
</body>
</html>