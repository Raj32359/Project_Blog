<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.ayvan.entities.User" %>
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
<title>Profile Page</title>
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
<!-- start of navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="index.jsp">
    <img src="images/bootstrap-solid.svg" width="30" height="30" alt="img">
    Technical Blog
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent" style="position: absolute; right: 20px;">
    <ul class="navbar-nav " style="position:relative; right: 20px;">
      <li class="nav-item active">
        <a class="nav-link" href="profile.jsp"> <i class="fa fa-home" aria-hidden="true"></i> Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"> <i class="fa fa-book" aria-hidden="true"></i>
         Learn</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <i class="fa fa-tasks" aria-hidden="true"></i>
         Projects
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
     
       <li class="nav-item">
        <a class="nav-link" href="#" ><i class="fa fa-cog" ></i> Settings </a>
      </li>
       <li class="nav-item">
       <img class="card-img-top" src="images/<%=user.getProfile()%>" alt="profile" style="width:30px; height:30px; border-radius: 50%;" >
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <label for="" class=" btn btn-md text-white bg-primary" ><%= user.getEmail() %></label>
      <!-- <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button> -->
    </form>
  </div>
  
</nav>
<!-- End of navbar -->

<!-- starts Side bar -->
<div class="d-flex mt-2" id="wrapper">

    <!-- Sidebar -->
    <div class="bg-light border-right" id="sidebar-wrapper">
      <div class="sidebar-heading">Technnical Blog</div>
      <div class="list-group list-group-flush">
        <a href="blog.jsp" class="list-group-item list-group-item-action bg-light"> <i class="fa fa-rss-square" aria-hidden="true"></i>
         Create New Blog</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Shortcuts</a>
        <a href="overview.jsp" class="list-group-item list-group-item-action bg-light"> <i class="fa fa-eye" aria-hidden="true"></i>
         Overview</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Events</a>
        <a href="user_profile.jsp" class="list-group-item list-group-item-action bg-light">
        <i class="fa fa-user" aria-hidden="true"></i>
        Edit Profile</a>
        <a href="addcategory.jsp" class="list-group-item list-group-item-action bg-light"> <i class="fa fa-plus-circle" aria-hidden="true"></i>
         Add Categories</a>
        <a href="Logout" class="list-group-item list-group-item-action bg-light">
         <i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a>
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

			<div class="alert alert-success m-2 text-center" id="paint" role="alert">
			Welcome <%= user.getUsername() %> 
			</div>

			<div class="container-fluid text-justify">
			          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
            <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fa fa-download fa-sm text-white-50"></i> Generate Report</a>
          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Total Articles</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"> 40,000</div>
                    </div>
                    <div class="col-auto">
                      <i class="fa fa-files-o text-primary fa-2x"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Total Views</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">215</div>
                    </div>
                    <div class="col-auto">
                      <i class="fa fa-eye text-success fa-2x"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks</div>
                      <div class="row no-gutters align-items-center">
                        <div class="col-auto">
                          <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                        </div>
                        <div class="col">
                          <div class="progress progress-sm mr-2">
                            <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fa fa-clipboard text-info fa-2x"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Messages Received</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                    </div>
                    <div class="col-auto ">
                      <i class="fa fa-comments  fa-2x text-warning"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

		</div>
	</div>
    <!-- /#page-content-wrapper -->

  </div>
  <!-- /#wrapper -->

<!-- End side bar -->

<!-- javaScript tags -->
<script src="javaScript/jquery-3.5.1.min.js" ></script>
<script src="javaScript/bootstrap.bundle.min.js" ></script>
<script src="javaScript/sb-admin-2.min.js" ></script>
 <script>
    $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
    });
    
 
		$("#paint").show();
		setTimeout(function() {
			$("#paint").hide();
		}, 2000);
		
	</script>
</body>
</html>