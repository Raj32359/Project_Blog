package com.ayvan.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ayvan.DBConnection.ConnectionUtil;
import com.ayvan.dao.UserDao;
import com.ayvan.entities.Message;
import com.ayvan.entities.User;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Login() {
        super();
    }

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		PrintWriter writer = response.getWriter();
		
		String userEmail = request.getParameter("email");
		String userPassword =  request.getParameter("password");
		
		UserDao userDao = new UserDao(ConnectionUtil.openConnection());
		
		User user01 = userDao.getUserByEmailAndPassword(userEmail, userPassword);
		
		if(user01 == null) {
			Message  msg = new Message("Invalid Details. Please try again", "error", "alert-danger");
			HttpSession sesen = request.getSession();
			sesen.setAttribute("msg", msg);
			response.sendRedirect("login.jsp");
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("currentUser", user01);
			response.sendRedirect("profile.jsp");
		}
	}


}
