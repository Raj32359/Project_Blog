<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
<link rel="stylesheet" type="text/css" href="../styleSheet/all.css" />
<link rel="stylesheet" type="text/css"
	href="../styleSheet/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="../styleSheet/MyStyleSheet.css" />
<link rel="shortcut icon" href="../favicon.ico">
</head>
<body>
	<main class="d-flex align-items-center" style="height: 100vh;">

		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card ">
						<div class="card-header text-center"> <i class="fa fa-user-plus" aria-hidden="true"></i> Registration </div>
						<div class="card-body">
							<form action="../Registration" method="post" >
							<div class="form-group">
								<input type="text" class="form-control"
										id="username" name="username" placeholder="User Name">
								</div>
								<div class="form-group">
								<input type="email" class="form-control" name="email" id="email"
										placeholder="Email"> 
								</div>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fa fa-mobile" aria-hidden="true"> </i>
										</div>
									</div>
									<input type="text" class="form-control"
										id="inlineFormInputGroup" name="mobile" placeholder="999 998 8888">
								</div>
								<div class="form-group">
								<input type="text" class="form-control" name="city" id="city"
										placeholder="Chennai"> 
								</div>
								<div class="form-group">
								<input type="password" class="form-control"
										id="password" name="password" placeholder="password">
								</div>
								<div class="form-group">
								<input type="password" class="form-control"
										id="Re-password" name="repassword" placeholder="Repeat password">
								</div>
								<div class="form-group form-check">
									<input type="checkbox" name="isChecked" class="form-check-input"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1"> I accept all the terms and conditions. </label>
								</div>
									<hr>
									<div class="form-group">
									<a href="login.jsp"> Already have an account ? sign-in here</a>
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