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
</head>
<body>
<jsp:include page="/commons/navbar.jsp"></jsp:include>

<jsp:include page="/commons/sidebar_top.jsp"></jsp:include>
<div class="container">
<div class="card" style="width:30rem" >
  <div class="card-header text-center">
    <i class="fa fa-plus-square" aria-hidden="true"></i> <strong> Add Category</strong>    
  </div>
  <div class="card-body">
   <form action="../AddCategory" method="post" >
  <div class="form-group">
    <label for="categoryTitle">Category Title</label>
    <input type="text" class="form-control" name="categoryTitle" id="categoryTitle" placeholder="ELECTRICALS">
  </div>
  <div class="form-group">
    <label for="categoryDescription">Category Description</label>
    <textarea class="form-control" name="categoryDescription" id="categoryDescription" style="min-height:150px" ></textarea>
  </div>
  <div class="form-group">
    <input type="submit" class="form-control btn btn-primary btn-block" value="Add Category" >
  </div>
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

</html>