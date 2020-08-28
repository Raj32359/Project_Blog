<%@page import="java.util.ArrayList"%>
<%@page import="com.ayvan.DBConnection.ConnectionUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@page import="com.ayvan.entities.User, com.ayvan.entities.Message,
       com.ayvan.dao.CategoryDao, com.ayvan.entities.Categories " %>
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
</style>

</head>
<body>
<jsp:include page="/commons/profile_navbar.jsp"></jsp:include>
<jsp:include page="/commons/sidebar_top.jsp"></jsp:include>
	<div id="user-details">
		<main class="d-flex align-items-center" style="height: 70vh;">
			<div class="container-fluid text-justify ">
				<div class="card" style="width:">
					<div class="card-header">
						<i class="fa fa-plus" aria-hidden="true"></i> Add Category
					</div>

					<div class="card-body">
						<form action="AddCategory" method="post" id="form">
							<div class="form-group">
								<label for="category">Add Category</label> <input type="text"
									name="category" class="form-control" id="category"
									placeholder="Add Category">
							</div>
							<div class="form-group">
								<label for="description">Add Description</label> <input
									type="text" name="description" class="form-control"
									id="description" placeholder="Add Description">
							</div>
							<div class="form-group">
								<button type="submit" id="sub-cat" class="btn btn-primary">
									Add</button>
							</div>
						</form>
					</div>
					<div class="card-footer text-muted">Have a good day</div>
				</div>
			</div>


			<div class="container-fluid text-justify">
				<div class="card text-center">
					<div class="card-header">
						<strong> Categories </strong>
					</div>
					<div class="card-body">
						<table class="table-scroll table small-first-col">

							<tbody class="body-half-screen">
								<tr>
								<% CategoryDao dao = new CategoryDao(ConnectionUtil.openConnection());
									ArrayList<Categories> list = dao.getAllCategories();
										for(Categories cat: list) {
										%>
									<td width="10%" > &#9830; </td>
									<td width="70%" ><%= cat.getName() %>  </td>
									<td width="20%" >
									<a href="${pageContext.request.contextPath}/AddCategory?action=DELETE&id=<%= cat.getId() %>"
									 class="btn btn-light btn-outline-danger">
											<i class="fa fa-trash-o" aria-hidden="true"></i>
										</a></td>
								</tr>
								<% } %>
							</tbody>
						</table>
					</div>
					<% int count = dao.categoryCount(); %>
					<div class="card-footer text-muted">Total Categories : <%= count %></div>
				</div>
			</div>

		</main>
	</div>

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
	<jsp:include page="/commons/sidebar_bottom.jsp"></jsp:include>
	<jsp:include page="/commons/footer.jsp"></jsp:include>
	<!-- javaScript tags -->
	<script src="javaScript/jquery-3.5.1.min.js"></script>
	<script src="javaScript/bootstrap.bundle.min.js"></script>
	<script>

	$("#msg-alert").show();
	setTimeout(function() {
		$("#msg-alert").hide();
	}, 2000);
	</script>
	
</body>
</html>