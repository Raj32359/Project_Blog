<%@page import="com.ayvan.entities.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ayvan.dao.CategoryDao"%>
<%@page import="com.ayvan.entities.Blog"%>
<%@page import="java.util.List"%>
<%@page import="com.ayvan.DBConnection.ConnectionUtil"%>
<%@page import="com.ayvan.dao.BlogDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blog | List</title>
<link rel="stylesheet" type="text/css" href="styleSheet/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styleSheet/bootstrap.css">
<link rel="stylesheet" type="text/css" href="styleSheet/myStyle.css">
<link rel="stylesheet" type="text/css" href="styleSheet/simple-sidebar.css">
<link rel="stylesheet" 
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="styleSheet/sb-admin-2.min.css">
<style>
.post_blog{
 display: block;
 position:relative;
 width:100%;
 max-height: 90vh;
 overflow:scroll;
}
</style>
</head>
<body>
<div class="d-flex mt-2" id="wrapper">

    <!-- Sidebar -->
    <div class="bg-light border-right" id="sidebar-wrapper">
      <div class="sidebar-heading text-dark">Technnical Blog</div>
			<div class="list-group">
				<a href="#" onclick="getPost(0,this)" class="c-link list-group-item list-group-item-action active">
					All Posts </a>
					<%
					CategoryDao dao = new CategoryDao(ConnectionUtil.openConnection());
					ArrayList<Categories> list = dao.getAllCategories();
					for (Categories cat : list) {
					%>
				<a href="#"  onclick="getPost(<%= cat.getId() %>,this)"
					class="c-link list-group-item list-group-item-action d-flex justify-content-between align-items-center"><%= cat.getName() %>
					 <%
					 BlogDao dao_cat = new BlogDao(ConnectionUtil.openConnection());
					int count = dao_cat.getBlogCatCount(cat.getId());
					 %>
					 <span class="badge badge-primary badge-pill"><%= count %></span>
					</a>
					<% } %>
			
			</div>
		</div>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">

      <nav class="navbar navbar-expand-lg">
        <button class="btn btn-primary" id="menu-toggle">
        <i class="fa fa-align-justify" aria-hidden="true"></i>
        </button>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
      </nav>
      
      <h2 class="ml-2" >Post Title & content</h2>
      <div class="post_blog" >
      
     <div  id="post_blog">
     
     </div>
      
      </div>
      
      
      </div>
    <!-- /#page-content-wrapper -->
    
    
    <!-- Page Content starts here -->
    
    
    <!-- Page Content Ends here -->

  </div>
  
  <!-- /#wrapper -->
 <script src="javaScript/jquery-3.5.1.min.js" ></script>
<script src="javaScript/bootstrap.bundle.min.js" ></script>


	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});
	</script>
	
	<script>
	
	function getPost(blogId,temp) {
		$('.c-link').removeClass('active')
		$.ajax({
			url: "backide.jsp",
			data:{cid: blogId},
			success: function(data, status, jqXHR) { 
				console.log(data);
				$('#post_blog').html(data)				
				$(temp).addClass('active')
			}
		})
	}
	
	$(document).ready(function (e){
		let allBlogRef = $('.c-link')[0]
		getPost(0, allBlogRef)
	})
	
	</script>
	<script type="text/javascript" src="javaScript/myScript.js"></script>
</body>
</html>