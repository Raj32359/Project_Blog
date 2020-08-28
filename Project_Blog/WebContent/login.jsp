<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.ayvan.entities.Message" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Technical Blog | Login</title>
<link rel="stylesheet" type="text/css" href="styleSheet/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styleSheet/bootstrap.css">
<link rel="stylesheet" type="text/css" href="styleSheet/myStyle.css">
<link rel="stylesheet" type="text/css" href="styleSheet/simple-sidebar.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<jsp:include page="/commons/header.jsp"></jsp:include>
	<main class="d-flex align-items-center" style="height: 83vh;">

		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header text-center">
							<i class="fa fa-user-circle-o"></i>
							<strong>Login here</strong>
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

						<div class="card-body">
							<form action="Login" method="POST">
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" name="email" required="required" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter email">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" name="password" required="required" class="form-control"
										id="exampleInputPassword1" placeholder="Password">
								</div>
								<button type="submit" class="btn btn-block btn-primary">Login</button>
								
								<p><a href=""> Forgot password ?</a></p>
								<p><a href="register.jsp">Don't you have an account ? Create an account</a></p>
							</form>
						</div>

						<div class="card-footer text-muted text-center">
						<b><div id="clock"></div></b>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="/commons/footer.jsp"></jsp:include>
</body>

<!-- javaScript tags -->
<script src="javaScript/jquery-3.5.1.min.js" ></script>
<script src="javaScript/bootstrap.bundle.min.js" ></script>

<script>
$("#msg-alert").show();
setTimeout(function() {
	$("#msg-alert").hide();
}, 2000);

function currentTime() {
	  var date = new Date(); /* creating object of Date class */
	  var ddd = date.getDate();
	  var mnth = date.getMonth();
	  var yr = date.getFullYear();
	  var days = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
	  var dy = days[date.getDay() ];
	  var hour = date.getHours();
	  var min = date.getMinutes();
	  var sec = date.getSeconds();
	  var midday = "AM";
	  midday = (hour >= 12) ? "PM" : "AM";
	  hour = updateTime(hour);
	  
	  min = updateTime(min);
	  sec = updateTime(sec);
	  document.getElementById("clock").innerText = dy+", "+ddd+"-"+mnth+"-"+yr+" | "+hour + " : " + min + " : " + sec +" "+midday;/* adding time to the div */
	  var t = setTimeout(function(){ currentTime() }, 1000); /* setting timer */
	  
	 
	}

	function updateTime(k) {
	  if (k < 10) {
	    return "0" + k;
	  }
	  else {
	    return k;
	  }
	}

	currentTime();

</script>

</html>