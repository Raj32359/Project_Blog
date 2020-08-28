<%@page import="com.ayvan.dao.LikeDao"%>
<%@page import="com.ayvan.entities.User"%>
<%@page import="com.ayvan.entities.Blog"%>
<%@page import="com.ayvan.DBConnection.ConnectionUtil"%>
<%@page import="com.ayvan.dao.BlogDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    int postId = Integer.parseInt(request.getParameter("blog_id"));
    BlogDao dao = new BlogDao(ConnectionUtil.openConnection());
  	Blog blog = dao.getBlogById(postId);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= blog.getTitle() %></title>
<link rel="stylesheet" type="text/css" href="styleSheet/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styleSheet/bootstrap.css">
<link rel="stylesheet" type="text/css" href="styleSheet/myStyle.css">
<link rel="stylesheet" type="text/css" href="styleSheet/simple-sidebar.css">
<link rel="stylesheet" 
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="styleSheet/sb-admin-2.min.css">
</head>
<body>
<div class="container" >
<div class="row">
<div class="col-md-10 offset-md-1" >
<div class="card text-center mt-5">
  <div class="card-header">
    <%= blog.getTitle().toUpperCase() %>
  </div>
  <div class="card-body">
    <h5 class="card-title">Special title treatment</h5>
    <p class="card-text"><%= blog.getContent() %></p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
  <div class="card-footer text-muted">
  <div class="row " >
  <div class="col-md-6 text-left" >
  <%
  LikeDao ld = new LikeDao(ConnectionUtil.openConnection());
  %>
  <a href="" onclick="doLike(<%= blog.getBid() %>, <%= blog.getUserId() %>)" class="btn btn-outline-dark m-2 btn-sm "><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> <span class="like-counter"> <%= ld.LikeCountOnPost(blog.getBid()) %> </span> </a>
 
  <a href="" class="btn btn-outline-dark m-2 btn-sm  "><i class="fa fa-commenting-o" aria-hidden="true"></i> 15 </a>
  </div>
  <div class="col-md-6 text-right mt-3" >
  
   Posted on :-  <%= blog.getDate().toLocaleString() %> </div>
    </div>
  </div>
</div>
</div>
</div>
</div>
</body>
<script type="text/javascript" src="javaScript/myScript.js"></script>
 <script src="javaScript/jquery-3.5.1.min.js" ></script>
</html>