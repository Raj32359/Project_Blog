<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<main class="d-flex align-items-center" style="height: 100vh;">

		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header text-center">
							<i class="fa fa-user-circle-o"></i>
							<strong>Register here</strong>
						</div>

						<div class="card-body">
							<form action="Register" method="POST" id="reg-form">
							<div class="form-group">
									<label for="username">User Name</label> <input
										type="text" name="username" class="form-control" id="username"
										aria-describedby="emailHelp" placeholder="Enter Username">
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" name="email" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter email">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" name="password" class="form-control"
										id="exampleInputPassword1" placeholder="Password">
								</div>

								<div class="form-group form-check">
									<input type="checkbox" name="check" class="form-check-input"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1"> Agree Terms and Conditions. </label>
								</div>
								
								<div class="container text-center mb-3 text-success" id="loader" style="display:none;" >
								<span class="fa fa-spinner fa-spin fa-3x" ></span>
								</div>

								<button type="submit" class="btn btn-block btn-primary">Login</button>
								
								<p><a href=""> Forgot password ?</a></p>
								<p><a id="submit-btn" href="login.jsp">Do you have an account ? Sign In here</a></p>
							</form>
						</div>

						<div class="card-footer text-muted">2 days ago</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="/commons/footer.jsp"></jsp:include>
	<script type="text/javascript" src="javaScript/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="javaScript/bootstrap.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
	$(document).ready(function(){
		console.log("loaded.....")
		$('#reg-form').on('submit', function(event){
			event.preventDefault();
			let form=new FormData(this);
			$('#submit-btn').hide();
			$('#loader').show();
			
			$.ajax({
			url : "Register",
			type : 'POST',
			data : form,
			 success: function(data, status, jqXHR) {
				console.log(data)
				$('#submit-btn').show();
				$('#loader').hide();
				
				if(data.trim() ==='done') {
					swal("Successfully Registered ! Redirecting to login page")
					.then((value) => {
					  window.location = "login.jsp"
					});
				}
				else {
				swal(data);
				}
			},
			error:  function(jqXHR, status, errorThrown) {
				console.log(jqXHR)
				$('#submit-btn').show();
				$('#loader').hide();
				swal("Something went wrong ! Please try again ...");
			},
			 processData: false,
			 contentType: false,
			});
		});
	});
	</script>
</body>
</html>