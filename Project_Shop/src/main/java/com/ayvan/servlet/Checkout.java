package com.ayvan.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Checkout() {
        super();
     
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String val  = request.getParameter("totalPrice");
		PrintWriter out = response.getWriter();
		out.println(val);
		request.setAttribute("totalPrice", val);
	 	request.getRequestDispatcher("payment.jsp").forward(request, response);
	}
	
}
