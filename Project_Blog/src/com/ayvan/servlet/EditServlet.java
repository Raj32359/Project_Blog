package com.ayvan.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.ayvan.DBConnection.ConnectionUtil;
import com.ayvan.dao.UserDao;
import com.ayvan.entities.Message;
import com.ayvan.entities.User;
import com.ayvan.profile.ProfileConfig;

@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public EditServlet() {
        super();
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter writer = response.getWriter();
		
		//fetching the data form the form
		String name = request.getParameter("username");
		String email = request.getParameter("email");
		String password =  request.getParameter("password");
		Part part = request.getPart("profile");
		String profilename = part.getSubmittedFileName();
		
		//get the user from the session
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("currentUser");
		user.setUsername(name);
		user.setEmail(email);
		user.setPassword(password);
		String oldFile = user.getProfile();
		user.setProfile(profilename);
		
		// Update the data in the database
		UserDao dao = new UserDao(ConnectionUtil.openConnection());
		boolean val = dao.updateUser(user);
		if(val) {
			writer.println(name+" "+email+" "+password+" "+profilename);
			System.out.println("Data updated succesfully.");
			String path = request.getRealPath("/")+"images"+File.separator+user.getProfile();
			response.sendRedirect("user_profile.jsp");
			
			
			// deleting old file
			String oldpath = request.getRealPath("/")+"images"+File.separator+oldFile;
			if(!oldpath.equals("default.png") ) {
			ProfileConfig.deleteFile(oldpath);
			}
			if(ProfileConfig.saveFile(part.getInputStream(), path)) {
				System.out.println("profile pic updated.");
				Message  msg = new Message("Successfuly updated your profile", "success", "alert-success");
				session.setAttribute("msg", msg);
			} else {
				System.out.println("profile pic not update");
				Message  msg = new Message("Something went wrong. Please try again", "error", "alert-danger");
				session.setAttribute("msg", msg);
			}
		} else {
			writer.println("Data not updated into database");
			Message  msg = new Message("Error caused in entered details. Please try again", "error", "alert-danger");
			session.setAttribute("msg", msg);
		}
	}

}
