package com.ayvan.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import com.ayvan.entities.Users;
import com.ayvan.util.HibernateUtil;


@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	RequestDispatcher dispatcher = null;

    public Registration() {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String check = request.getParameter("isChecked");
		
		
		if(check == null ) {
			out.println("Please accept the terms and conditions.");
		}
		else {
			String name = request.getParameter("username");
			String email =  request.getParameter("email");
			String mobile = request.getParameter("mobile");
			String password = request.getParameter("password");
			String repassword = request.getParameter("repassword");
			String city = request.getParameter("city");
			Users user = null;
			if(password.equals(repassword)) {
				user = new Users(name, email, mobile, password, city);		
			} else {
			out.println("Password does not matching");
			}
			String val = "\n User name : "+name+ "\n Email : "+email + "\n Mobile : "+mobile+ "\n Password : "+password+ " \n Repeat password : "
			+ repassword+ "\n checked : "+check;
			out.print(val);
			try(Session session = HibernateUtil.getSessionFactory().openSession()) {
				session.beginTransaction();
			int id = (int)session.save(user);
				session.getTransaction().commit();
				out.println("customer saved successfully");
				out.println("user Id : "+id);
			//	response.sendRedirect("Reg_login/login.jsp");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			}
		
		}
	}


