 <%@page import="com.ayvan.entities.User" %>
    <%@page errorPage="error.jsp" %>
    <% 
    response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
    User user = (User)session.getAttribute("currentUser");
    if(user == null) {
    	response.sendRedirect("login.jsp");
    }
    %>

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
        <a class="nav-link" href="profile.jsp"> <i class="fa fa-home" aria-hidden="true"></i>
         Home </a>
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
<!-- javaScript tags -->
<script src="javaScript/jquery-3.5.1.min.js" ></script>
<script src="javaScript/bootstrap.bundle.min.js" ></script>
