<%@page import="com.ayvan.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.ayvan.util.HibernateUtil"%>
<%@page import="com.ayvan.dao.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop | Add Category</title>

<link rel="stylesheet" type="text/css" href="../styleSheet/all.css"/>
<link rel="stylesheet" type="text/css" href="../styleSheet/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="../styleSheet/MyStyleSheet.css"/>
<link rel="stylesheet" type="text/css" href="../styleSheet/simple-sidebar.css">
<link rel="stylesheet" type="text/css" href="../styleSheet/sb-admin-2.min.css">
<link rel="stylesheet" type="text/css" href="../styleSheet/v4-shims.css">
<link rel="shortcut icon" href="../favicon.ico">
<script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
</head>
<body>
<jsp:include page="/commons/navbar.jsp"></jsp:include>

<jsp:include page="/commons/sidebar_top.jsp"></jsp:include>
<div class="container">
<div class="card" style="width: 30rem;" >
  <div class="card-header text-center">
    <i class="fa fa-plus-square" aria-hidden="true"></i> <strong> Add Products</strong>    
  </div>
  <div class="card-body">
   <form action="../AddProduct" method="post" enctype='multipart/form-data' >
 
  <div class="form-group">
    <label for="productName">Product Title</label>
    <input type="text" class="form-control" name="productName" id="productName" placeholder="Inspiron 380">
  </div>
  <div class="form-group">
    <label for="categoryDescription">Product Description</label>
    <textarea class="form-control" name="productDescription" id="" rows="3"></textarea>
  </div>
   <div class="form-group">
    <label for="categoryTitle">Product Profile</label>
    <input type="file"  class="form-control" name="productImage"  id="productImage" accept=".png, .jpg, .jpeg" placeholder="select file to insert">
  </div>
   <div class="form-group">
    <label for="categoryTitle">Product price</label>
    <input type="text" class="form-control"  name="productPrice" id="productPrice" placeholder="250 /- ">
  </div>
   <div class="form-group">
    <label for="categoryTitle">Product offer</label>
    <input type="text" class="form-control" name="productDisc" id="productDisc" placeholder="10% discount">
  </div>
   <div class="form-group">
    <label for="categoryTitle">Product Quantity</label>
    <input type="text" class="form-control" name="productQuantity" id="productQuantity" placeholder="5">
  </div>
  
  <%
  CategoryDao dao = new CategoryDao(HibernateUtil.getSessionFactory());
    		List<Category> list = dao.getCategories();
    		
  
  %>
   <div class="form-group">
    <label for="categoryTitle">Product Category</label>
    <select name="productCategory" class="form-control" >
    <%
    for(Category cat: list){
    %>
    <option value= "<%= cat.getCategoryId() %>" > <%= cat.getCategoryName() %> </option>
    <%} %>
    </select>
  </div>
  <button type="submit" class="btn btn-primary btn-block" >Add Products</button>
</form>
  </div>
  <div class="card-footer text-muted text-center ">
 <p id="demo"></p>
    </div>
    </div>
    </div>
    <jsp:include page="/commons/sidebar_bottom.jsp"></jsp:include>
</body>
<script>
var d = new Date();
var year = d.getFullYear();
var monthName = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
var months = monthName[d.getMonth()];
var day = d.getDate();
document.getElementById("demo").innerHTML = day+" - "+months+" - "+year;
</script>
<script>
      tinymce.init({
        selector: '#mytextarea'
      });
    </script>

</html>