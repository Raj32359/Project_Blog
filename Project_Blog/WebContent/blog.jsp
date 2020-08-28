<%@page import="java.util.ArrayList"%>
<%@page import="com.ayvan.DBConnection.ConnectionUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@page import="com.ayvan.entities.User, com.ayvan.entities.Message,
      com.ayvan.dao.BlogDao, com.ayvan.entities.Categories " %>
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
<title> New Blog </title>
<link rel="stylesheet" type="text/css" href="styleSheet/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styleSheet/bootstrap.css">
<link rel="stylesheet" type="text/css" href="styleSheet/myStyle.css">
<link rel="stylesheet" type="text/css" href="styleSheet/simple-sidebar.css">
<link rel="stylesheet" 
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		 <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
  <script src='https://cdn.tiny.cloud/1/wv95msrxnkfz13jhcm50f2dvpwvys9jw49btz60c5pcr05a7/tinymce/5/tinymce.min.js' referrerpolicy="origin">
  </script>
  <script>
    tinymce.init({
      selector: '#mytextarea'
    });
  </script>
</head>
<body>
<jsp:include page="/commons/profile_navbar.jsp"></jsp:include>
<jsp:include page="/commons/sidebar_top.jsp"></jsp:include>
	<div id="user-details">
		<main class="d-flex align-items-center" style="height: 110vh;">
			<div class="container-fluid text-justify ">
				<div class="card">
				
					<div class="card-header">
					 <i class="fa fa-plus" aria-hidden="true"></i>
					  Add New Blog
					  </div>
					  
					<div class="card-body">
						<form action="AddBlog" method="post" id="blog-form" >
							<div class="form-group">
								<label for="title"><b>Title</b></label> <input
									type="text" name="title" class="form-control" id="title"
									 placeholder="Enter Title">								
							</div>
							<div class="form-group">
								<label for="category">Select Category:</label>
								 <select class="form-control" name="cid" id="category">
									<option selected="selected" disabled="disabled" > ---------- select category -------- </option>
									<% BlogDao dao = new BlogDao(ConnectionUtil.openConnection());
									ArrayList<Categories> list = dao.getAllCategories();
										for(Categories cat: list) {
										%>
									<option value="<%= cat.getId() %>" ><%= cat.getName() %></option>
									<% } %>
								</select>
							</div>
							<div class="form-group">
								<label for="content">Add Content
									</label>
								<textarea class="form-control" style="height:250px;" id="mytextarea" name="mytextarea"
									rows="3"></textarea>
							</div>
							<button type="reset" class="btn btn-secondary">Reset</button>
							<button type="submit" id="btn-post" class="btn btn-primary">Publish</button>
							
							
						<%
							Message message = (Message) session.getAttribute("msg");
							if (message != null) {
						%>
						<div class="alert <%=message.getCssClass()%> text-center m-2"
							id="msg-alert" role="alert">
							<%=message.getContent()%>
						</div>

						<%
							session.removeAttribute("msg");
						}
						%>
						</form>
						</div>
					<div class="card-footer text-muted">Have a good day </div>
				</div>
			</div>
		</main>
	</div>


	<jsp:include page="/commons/sidebar_bottom.jsp"></jsp:include>
	<jsp:include page="/commons/footer.jsp"></jsp:include>
	<!-- javaScript tags -->
	<script src="javaScript/jquery-3.5.1.min.js"></script>
	<script src="javaScript/bootstrap.bundle.min.js"></script>
	
	<script>	
	
	
		$('#blog-form').on('submit', function(event){
			event.preventDefault();
			let form=new FormData(this);
						
			$.ajax({
			url : "AddBlog",
			type : 'POST',
			data : form,
			 success: function(data, status, jqXHR) {
				console.log(data)
				
				$("#msg-alert").show();
				setTimeout(function() {
				$("#msg-alert").hide();
				}, 2000);
				
				if(data.trim() ==='done') {
					swal("Successfully Registered ! Redirecting to login page");
					$('#blog-form').each(function(){
					    this.reset();
					    
				}
				else {
				swal(data);
				}
				}
				},
			error:  function(jqXHR, status, errorThrown) {
				console.log(jqXHR)
				swal("Something went wrong ! Please try again ...");
			},
			 processData: false,
			 contentType: false,
			})
		});
			
	</script>
	
</body>
</html>