




<%@page import="java.io.Writer"%>
<%@page import="com.ayvan.entities.Blog"%>
<%@page import="java.util.List"%>
<%@page import="com.ayvan.DBConnection.ConnectionUtil"%>
<%@page import="com.ayvan.dao.BlogDao"%>
<div class="list-group">

<% 

BlogDao dao = new BlogDao(ConnectionUtil.openConnection());
int blogId = Integer.parseInt(request.getParameter("cid"));
List<Blog> list = null;
if(blogId==0){
 list = dao.getAllBlogs();
} else {
	list = dao.getPostById(blogId);
}
if(list.size() == 0) {
	out.print("<h3 class='display-3 text-center' > Being update soon.. </h3>");
	return;
}
for (Blog blog: list) {
%>
<div class="mt-3" >
  <a href="#" class="list-group-item list-group-item-action">
    <div class="d-flex w-100 justify-content-between">
      <h5 class="mb-1"><%= blog.getTitle() %></h5>
      <small><%= blog.getDate().toLocaleString() %></small>
    </div>
    <p class="mb-1"><%= blog.getContent() %> </p>
   <!--  <small>Donec id elit non mi porta.</small> -->
  </a>
  <div class="bg-primary text-right" > 
  <a href="" class="btn btn-outline-light m-2 btn-sm "><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 10 </a>
  <a href="" class="btn btn-outline-light m-2 btn-sm "><i class="fa fa-commenting-o" aria-hidden="true"></i> 15 </a>
  <a href="show_post.jsp?blog_id=<%= blog.getBid() %>" class="btn btn-outline-light m-2 btn-sm " >Read more...</a>
  </div>
  </div>
  <%} %>
</div>