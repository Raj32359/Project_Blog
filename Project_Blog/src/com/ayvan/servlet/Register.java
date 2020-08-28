package com.ayvan.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ayvan.DBConnection.ConnectionUtil;
import com.ayvan.dao.UserDao;
import com.ayvan.entities.User;

@WebServlet(urlPatterns = { "/Register" })
@MultipartConfig
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public Register() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String check = request.getParameter("check");
		if(check == null) {
			out.println("Please accept the terms and conditions.");
		} else {
			String name = request.getParameter("username");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			User user = new User(name,email,password);
			
			UserDao dao = new UserDao(ConnectionUtil.openConnection());
			if(dao.saveUser(user)) {
				// saved
				out.println("done");
			} else {
				out.println("error");
			}
		}
	}

}
