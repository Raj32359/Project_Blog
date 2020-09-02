package com.ayvan.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ayvan.dao.CategoryDao;
import com.ayvan.entities.Category;
import com.ayvan.util.HibernateUtil;


public class AddCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
   
    public AddCategory() {
        super();
        
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String Title = request.getParameter("categoryTitle");
		String Desc = request.getParameter("categoryDescription");
		response.setContentType("text/html");
		PrintWriter out =  response.getWriter();
		out.println(Title+" "+Desc);
		
		Category category = new Category();
		category.setCategoryName(Title);
		category.setCategoryDescription(Desc);
		CategoryDao dao = new CategoryDao(HibernateUtil.getSessionFactory());
		Integer catId = dao.saveCategory(category);
		out.print("category saved "+catId);
	}

}
