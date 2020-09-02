<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="../styleSheet/all.css" />
<link rel="stylesheet" type="text/css"
	href="../styleSheet/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="../styleSheet/MyStyleSheet.css" />
<link rel="shortcut icon" href="../favicon.ico">
</head>
<body>
	<main class="d-flex align-items-center" style="height: 90vh;">

		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card ">
						<div class="card-header text-center"> <i class="fa fa-user-circle" aria-hidden="true"></i> Login </div>
						<div class="card-body">
							<form action="../Login" method="post" >
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" name="email" class="form-control" id="email"> 
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" name="password" class="form-control"
										id="password">
								</div>
								
									<hr>
									<div class="form-group" >
									<a href=""> Forgot Password ? </a><br>
									<a href="registration.jsp"> Don't you have an account ? Register here</a>
									</div>
								<button type="submit" class="btn btn-primary btn-block">Login</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>
<!-- script tags here -->
<script type="text/javascript" src="../javaScript/bootstrap.min.js"></script>
<script type="text/javascript" src="../javaScript/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../javaScript/bootstrap.js"></script>

</html>