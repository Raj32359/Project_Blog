<%@page import="com.ayvan.entities.Blog"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ayvan.DBConnection.ConnectionUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@page import="com.ayvan.entities.User, com.ayvan.entities.Message,
      com.ayvan.dao.BlogDao, com.ayvan.entities.Categories, com.ayvan.dao.CategoryDao" %>
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
<title> Blog | Overview </title>
<link rel="stylesheet" type="text/css" href="styleSheet/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styleSheet/bootstrap.css">
<link rel="stylesheet" type="text/css" href="styleSheet/myStyle.css">
<link rel="stylesheet" type="text/css" href="styleSheet/simple-sidebar.css">
<link rel="stylesheet" 
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>		
.table-scroll{
  /*width:100%; */
  display: block;
  empty-cells: show;
  
  /* Decoration */
  border-spacing: 0;
  
}

.table-scroll thead{
  background-color: #f1f1f1;  
  position:relative;
  display: block;
  width:100%;
  overflow-y: scroll;
}

.table-scroll tbody{
  /* Position */
  display: block; position:relative;
  width:100%; overflow-y:scroll;
  
 
}

.table-scroll tr{
  width: 100%;
  display:flex;
}

.table-scroll td,.table-scroll th{
 
  flex-grow:2;
  display: block;
  padding: 5px;
  text-align:center;
}

/* Other options */

.table-scroll.small-first-col td:first-child,
.table-scroll.small-first-col th:first-child{
  flex-basis:20%;
  flex-grow:1;
}

.table-scroll tbody tr:nth-child(2n){
  background-color: rgba(130,130,170,0.1);
}

.body-half-screen{
  max-height: 50vh;
}

.small-col{flex-basis:10%;}

.catlist {
background-color: #f1f1f1;  
  position:relative;
  display: block;
  width:100%;
  overflow-y: scroll;
  max-height: 50vh;
}
</style>


  
</head>
<body>
<jsp:include page="/commons/profile_navbar.jsp"></jsp:include>
<jsp:include page="/commons/sidebar_top.jsp"></jsp:include>
	<div id="user-details">
		<main class="d-flex align-items-center" style="height: 100vh;">		
			<div class="container-fluid text-justify">
				<div class="card text-center">
					<div class="card-header">
						<strong> Categories </strong>
					</div>
					<div class="card-body">
					<div class="catlist">
								<div class="list-group">
									<a href="#"
										class="list-group-item list-group-item-action active"> All
										Posts </a>
									<%
										CategoryDao dao = new CategoryDao(ConnectionUtil.openConnection());
									ArrayList<Categories> list = dao.getAllCategories();
									for (Categories cat : list) {
									%>
									<a href="#" class="list-group-item list-group-item-action"><%=cat.getName()%></a>
									<% } %>
								</div>
							
						</div>
					</div>
					<%
						int count1 = dao.categoryCount();
					%>
					<div class="card-footer text-muted">Total Categories : <%= count1 %></div>
				</div>
			</div>
		
			<div class="container-fluid text-justify">
				<div class="card text-center">
					<div class="card-header">
						<strong> Content Titles </strong>
					</div>
					<div class="card-body">
						<table class="table-scroll table small-first-col">

							<tbody class="body-half-screen">
								<tr class="text-justify">
								<% BlogDao dao1 = new BlogDao(ConnectionUtil.openConnection());
									List<Blog> list1 = dao1.getAllBlogs();
										for(Blog log: list1) {
										%>
									<td width="10%"> 
									<i class="fa fa-plus-square-o fa-2x" aria-hidden="true"></i> </td>
									<td width="45%" class="text-justify" ><%= log.getTitle().toUpperCase() %>  </td>
									<td width="20%">  <small><%= log.getDate().toString() %> </small> </td>
									<td width="10%"><i class="fa fa-thumbs-up" ></i>100 </td>
									<td width="10%"><i class="fa fa-thumbs-down"></i> 500</td>
									<td width="10%"><i class="fa fa-comments"></i>105</td>
								</tr>
								<% } %>
							</tbody>
						</table>
					</div>
					<% Blog blog = new Blog();
					int count = dao1.getBlogCount(); %>
					<div class="card-footer text-muted">Total Posts : <%= count %></div>
				</div>
			</div>
		
		</main>
	</div>


	<jsp:include page="/commons/sidebar_bottom.jsp"></jsp:include>
	<jsp:include page="/commons/footer.jsp"></jsp:include>
	<!-- javaScript tags -->
	<script src="javaScript/jquery-3.5.1.min.js"></script>
	<script src="javaScript/bootstrap.bundle.min.js"></script>