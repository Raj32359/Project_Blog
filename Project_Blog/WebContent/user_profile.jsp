<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="com.ayvan.entities.User, com.ayvan.entities.Message " %>
    <%@page errorPage="error.jsp" %>
    <% 
    response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
    User user = (User)session.getAttribute("currentUser");
    if(user == null) {
    	response.sendRedirect("login.jsp");
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>profile</title>
<link rel="stylesheet" type="text/css" href="styleSheet/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styleSheet/bootstrap.css">
<link rel="stylesheet" type="text/css" href="styleSheet/myStyle.css">
<link rel="stylesheet" type="text/css" href="styleSheet/simple-sidebar.css">
<link rel="stylesheet" 
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<jsp:include page="/commons/profile_navbar.jsp"></jsp:include>
<jsp:include page="/commons/sidebar_top.jsp"></jsp:include>
	
	<!-- USER PROFILE DETAILS STARTS HERE -->
	<div id="user-details">
		<main class="d-flex align-items-center" style="height: 70vh;">
			<div class="container-fluid text-justify ">
				<div class="card offset-md-3" style="width: 50%;">
					<div class="text-center mt-4">
						<img src="images/<%=user.getProfile()%>"
							style="width: 30%; border-radius: 50%;" class="card-img-top"
							alt="default.png">
					</div>
					<div class="card-body">
						<h3 class="card-title text-center display-5"><%=user.getUsername().toUpperCase()%></h3>
						<table class="table table-striped">
							<tbody>
								<tr>
									<th scope="row" width="50%">Email</th>
									<td width="50%"><%=user.getEmail()%></td>
								</tr>
								<tr>
									<th scope="row">Created Date</th>
									<td><%=user.getDateTime().toString()%></td>
								</tr>
							</tbody>
						</table>
						<button id="profile-btn-edit" class="btn btn-sm btn-primary btn-block">Edit</button>
					</div>
				</div>
			</div>
		</main>
	</div>
	<!-- USER PROFILE DETAILS ENDS HERE -->
	
	
	<!-- USER EDIT FORM STARTS HERE -->
<div id="user-edit" style="display:none;">
<main class="d-flex align-items-center" style="height: 70vh;">
			<div class="container-fluid text-justify ">
				<div class="card offset-md-3" style="width: 50%;">
					<div class="text-center mt-4">
						<img src="images/<%=user.getProfile()%>"
							style="width: 30%; border-radius: 50%;" class="card-img-top"
							alt="default.png">
					</div>
					<div class="card-body">
						<h3 class="card-title text-center display-5"><%=user.getUsername().toUpperCase()%></h3>
						
						
						<form action="EditServlet" method="post" enctype="multipart/form-data" >
						<table class="table table-striped">
							<tbody>
							<tr>
									<th scope="row" width="50%">User Name</th>
									<td width="50%"><input class="form-control" type="text" name="username" value="<%=user.getUsername()%>"></td>
								</tr>
								<tr>
									<th scope="row">Email</th>
									<td><input type="email" class="form-control" name="email" value="<%=user.getEmail()%>"></td>
								</tr>
								<tr>
									<th scope="row">Password</th>
									<td><input type="password" class="form-control" name="password" value="<%=user.getPassword()%>"></td>
								</tr>
								<tr>
									<th scope="row">Profile Pic</th>
									<td><input type="file" class="form-control" name="profile" value="<%=user.getProfile()%>" accept="image/*"></td>
								</tr>
								<tr>
									<th scope="row">Created Date</th>
									<td><%=user.getDateTime().toString()%></td>
								</tr>
								<tr>
									<td><button id="form-submit" type="reset" class="btn btn-block btn-sm btn-secondary">Reset</button></td>									
									<td><button id="form-submit" type="submit" class="btn btn-block btn-sm btn-primary">save</button></td>
								</tr>
							</tbody>
						</table>
						
						</form>
						<button id="profile-btn-back" class="btn btn-block btn-sm btn-primary">Back</button>
					</div>
				</div>
			</div>
		</main>
</div>
<%
						Message message = (Message)session.getAttribute("msg");
						if(message != null) {
							%>
						<div class="alert <%= message.getCssClass() %> text-center m-2" id="msg-alert" role="alert">
						<%= message.getContent() %>
						</div>

						<%
						session.removeAttribute("msg");
						}
						%>
<!-- USER EDIT FORM ENDS HERE -->

	<jsp:include page="/commons/sidebar_bottom.jsp"></jsp:include>
	<jsp:include page="/commons/footer.jsp"></jsp:include>
	<!-- javaScript tags -->
	<script src="javaScript/jquery-3.5.1.min.js"></script>
	<script src="javaScript/bootstrap.bundle.min.js"></script>
	<script>
$(document).ready(function(){
	var editStatus=false;
	$('#profile-btn-edit').click(function(){
		if(editStatus == false){
			$('#user-details').hide()			
			$('#user-edit').show();
			editStatus = true;
		}
		
	})
	
	$('#profile-btn-back').click(function(){
		if(editStatus == true) {
			$('#user-details').show()
			
			$('#user-edit').hide();
			editStatus = false;
			$(this).text("Back")
		}
		
	})
})

$("#msg-alert").show();
setTimeout(function() {
	$("#msg-alert").hide();
}, 2000);
</script>
</body>
</html>