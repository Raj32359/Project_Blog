package com.ayvan.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ayvan.DBConnection.ConnectionUtil;
import com.ayvan.dao.LikeDao;

@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public LikeServlet() {
        super();
    }

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operation = request.getParameter("operation");
		int bid = Integer.parseInt(request.getParameter("bid"));
		int uid = Integer.parseInt(request.getParameter("uid"));
		PrintWriter out = response.getWriter();
		out.println("Data from the server");
		out.println(operation);
		out.println(bid);
		out.println(uid);
		LikeDao dao = new LikeDao(ConnectionUtil.openConnection());
		if(operation.equals("like")) {
			boolean b = dao.insertLike(bid, uid);
			out.println(b);
			System.out.println(b);			
		}
	}



}
