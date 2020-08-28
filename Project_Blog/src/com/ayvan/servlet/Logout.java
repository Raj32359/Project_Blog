package com.ayvan.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ayvan.entities.Message;

@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Logout() {
        super();
    }

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse respsonse) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("currentUser");
		
		Message msg = new Message("You are successfully logged out", "success", "alert-success");
		session.setAttribute("msg", msg);
		respsonse.sendRedirect("login.jsp");
	}


}
