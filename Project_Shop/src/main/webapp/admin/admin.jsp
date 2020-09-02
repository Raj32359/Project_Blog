<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin panel</title>
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
<div id="page-content-wrapper">

 			<div class="alert alert-success m-2 text-center" id="paint" role="alert">
			Welcome <% //=user.getUsername() %> 
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
<jsp:include page="/commons/sidebar_bottom.jsp"></jsp:include>


</body>
<!-- script tags here -->
<script type="text/javascript" src="../javaScript/bootstrap.min.js" ></script>
<script type="text/javascript" src="../javaScript/jquery-3.5.1.min.js" ></script>
<script type="text/javascript" src="../javaScript/bootstrap.js" ></script>
<script src="../javaScript/sb-admin-2.min.js" ></script>



</html>