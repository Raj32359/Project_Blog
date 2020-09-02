<%@page import="com.ayvan.entities.Users"%>
<%
Users user1 = (Users)session.getAttribute("CurrentUser");
%>

<nav class="navbar navbar-expand-lg navbar-light bg-white">
  <a class="navbar-brand" href="#"> <i class="fab fa-accusoft"></i> Shopping Cart</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown
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
       <a class="nav-link" href="#" data-toggle="modal" data-target="#cart" ><i class="fas fa-cart-plus" style="font-size: 20px;">
       <span class="badge badge-info cart-items " style="position: relative; left: -10px; top:-10px; font-size: 10px;">0</span>
       </i>
       </a>
      </li>
      
      <%
      
      if(user1 != null) {
    	  %>
    	 <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <%= user1.getUserName() %>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
        <form action="Logout" method="post">
          <input type="submit" class="dropdown-item btn btn-secondary" value="Logout">
         </form>
        </div>
      </li>
    	  <%
      } else {
    	  
    	  %>
    	  <li class="nav-item">
        <a class="nav-link" href="Reg_login/login.jsp"> <i class="fa fa-user-circle" aria-hidden="true"></i>
         Login</a>
      </li>
    	  <%
      }
      
      %>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
<jsp:include page="cartModel.jsp"></jsp:include>

<script type="text/javascript" src="javaScript/jquery-3.5.1.min.js" ></script>