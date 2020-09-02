package com.ayvan.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ayvan.dao.UserDao;
import com.ayvan.entities.Users;
import com.ayvan.util.HibernateUtil;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RequestDispatcher dispatcher = null;
	public Login() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		UserDao dao = new UserDao(HibernateUtil.getSessionFactory());
		Users user = dao.getUserByEmailAndPassWord(email, password);
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("CurrentUser", user);
		System.out.println(user);
		response.sendRedirect("index.jsp");
}}
