<%@page import="com.ayvan.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.ayvan.util.HibernateUtil"%>
<%@page import="com.ayvan.dao.ProductDao"%>
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
<div class="card">
  <div class="card-header text-center">
    <i class="fas fa-layer-group"></i> <strong> Stock Exchange</strong>    
  </div>
  <% 
  ProductDao dao = new ProductDao(HibernateUtil.getSessionFactory());
  List<Product> list = dao.getAllProducts();
  %>
  <div class="card-body text-center">
 
  <h3 class="text-mute">Products count : <%= list.size() %></h3>
  
  </div>
  <div class="card-footer text-muted text-center ">
 <p id="demo"></p>
    </div>
    </div>
    </div>
    <jsp:include page="/commons/sidebar_bottom.jsp"></jsp:include>
</body>
</html>