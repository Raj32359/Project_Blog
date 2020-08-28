<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sorry ! Something went Wrong</title>
<link rel="stylesheet" type="text/css" href="styleSheet/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styleSheet/bootstrap.css">
<link rel="stylesheet" type="text/css" href="styleSheet/myStyle.css">
<link rel="stylesheet" type="text/css" href="styleSheet/simple-sidebar.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
<main class="d-flex align-items-center" style="height: 100vh;">
	<div class="container text-center">
		<img alt="error" src="images/error.png" class="img-fluid" style="width:200ox; height:200px;">
		<h3 class="display-4">Sorry ! Something went wrong ...</h3>
		<%= exception%>
		<a href="index.jsp"	class="btn bg-primary btn-lg text-white mt-3">Home</a>
	</div>
	</main>
</body>
</html>