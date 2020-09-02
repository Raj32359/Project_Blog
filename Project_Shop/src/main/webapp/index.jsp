<%@page import="com.ayvan.helper.Helper"%>
<%@page import="com.ayvan.entities.Category"%>
<%@page import="com.ayvan.dao.CategoryDao"%>
<%@page import="com.ayvan.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.ayvan.dao.ProductDao"%>
<%@page import="com.ayvan.util.HibernateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" type="text/css" href="styleSheet/all.css"/>
<link rel="stylesheet" type="text/css" href="styleSheet/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="styleSheet/MyStyleSheet.css"/>
<link rel="shortcut icon" href="favicon.ico">

<script type="text/javascript" src="javaScript/jquery-3.5.1.min.js" ></script>
<script type="text/javascript" src="javaScript/MyScript.js" > </script>
<style type="text/css">
.list-group-item.active, .btn-primary {
background-color: #212121;
border-color: #424242;
}
</style>
</head>
<body>
<jsp:include page="commons/navbar.jsp"></jsp:include>
<jsp:include page="commons/carousel_top.jsp"></jsp:include>

 <div  class="carousel-inner" >
    <div class="carousel-item active">
      <img src="images/3547.jpg" class="img-fluid d-block w-100" alt="image-1">
      <div class="carousel-caption d-none d-md-block">
        <h5>First slide label</h5>
        <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="images/7947.jpg" class="img-fluid d-block w-100" alt="image-2">
      <div class="carousel-caption d-none d-md-block">
        <h5>Second slide label</h5>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="images/1913647.jpg" class="img-fluid d-block w-100" alt="image-3">
      <div class="carousel-caption d-none d-md-block">
        <h5>Third slide label</h5>
        <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
      </div>
    </div>
</div>
<jsp:include page="commons/carousel_bottom.jsp"></jsp:include>

<div class="container-fluid mt-3" >

<div class="row" >
<%
String str = request.getParameter("category");

ProductDao dao = new ProductDao(HibernateUtil.getSessionFactory());
List<Product> list =dao.getAllProducts();
if(str == null || str.trim().equals("all")){
	list = dao.getAllProducts();
} else {
	int cid = Integer.parseInt(str.trim());
	list = dao.getAllProductById(cid);
}
CategoryDao CatDao = new CategoryDao(HibernateUtil.getSessionFactory());
List<Category> CatList = CatDao.getCategories(); 

%>
			<div class="col-md-2">
				<div class="list-group">
					<a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
						All Categories </a>
					<%
						for (Category c : CatList) {
					%>
					<a href="index.jsp?category=<%= c.getCategoryId() %>" class="list-group-item list-group-item-action"><%= c.getCategoryName()%></a>
					<%
						}
					%>
				</div>

			</div>


			<div class="col-md-10">
				<div class="card-columns">
				<%
				for(Product product:list) {
				%>
				<div class="card"style="height:500px;">
				<div class="container text-center">
			  	<img src="images/products/<%= product.getProductPics() %>" style=" max-width:200px;  width: auto; height: 200px; " class="card-img-top mt-2 mx-2" alt="<%= product.getProductPics() %>">
			  	</div>
			  	<div class="card-body text-justify">
			  	<div style="height: 50px;" >
			    <h5 class="card-title"><%= product.getProductName() %></h5>
			    </div>
			    <div style="height: 137px;" >
			    <p class="card-text"> <%= Helper.get10Words(product.getProductDescription()) %> </p>
			    </div>
				</div>
				
				<div class="card-footer text-muted">
				<div class="row text-center">
				
				<div class="col" >				
				<button class="btn btn-dark btn-block "
				 onclick="addToCart(<%= product.getProductId() %>, '<%= product.getProductName() %>', <%= product.getProductPrice() %>)"> Add Cart </button>
				</div>
				
				<div class="col" >
				<button class="btn btn-outline-dark btn-block"> &#8377; <%= product.getProductPrice() %> </button>
				</div>
				</div>				
				</div>
				
				</div>
				<% } %>
				</div>
				<%
				if(list.size() == 0)
					
				{
					out.println("<h2 class='text-center mt-5' > No Products on this Category. </h2><br/> <h3 class='text-center mt-5' > Available Soon.... </h3>");
				}
				%>
			</div>
			
			
			
		</div>

</div>

</body>
<!-- script tags here -->
<script type="text/javascript" src="javaScript/bootstrap.min.js" ></script>
<script type="text/javascript" src="javaScript/jquery-3.5.1.min.js" ></script>
<script type="text/javascript" src="javaScript/bootstrap.js" ></script>


</html>