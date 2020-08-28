package com.ayvan.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ayvan.DBConnection.ConnectionUtil;
import com.ayvan.dao.BlogDao;
import com.ayvan.entities.Blog;
import com.ayvan.entities.Message;
import com.ayvan.entities.User;

@WebServlet("/AddBlog")
@MultipartConfig
public class AddBlog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AddBlog() {
        super();

    }
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter writer = response.getWriter();
		int id = Integer.parseInt(request.getParameter("cid"));
		String title = request.getParameter("title");
		String content =  request.getParameter("mytextarea");
		
		// getting user session
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("currentUser");
		
		String val = "Id " + id + " \n title "+title+ "\n content "+content+ "\n category "+user.getId();
		writer.println(val);
		System.out.println(val);
		Blog blog = new Blog(title, content, null, id, user.getId());
		BlogDao dao = new BlogDao(ConnectionUtil.openConnection());
		response.sendRedirect("blog.jsp");
		if(dao.saveBlog(blog) ){
			Message  msg = new Message("You have Successfully Published your Content", "success", "alert-success");
			session.setAttribute("msg", msg);
			System.out.println("Blog Data Inserted into database");
			writer.println("done");
			
		} else {
			System.out.println("Blog data not inserted into database");
			writer.println("error");
			Message  msg = new Message("Invalid Details. Please try again", "error", "alert-danger");
			session.setAttribute("msg", msg);
		}
		
	}

}
