package com.ayvan.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ayvan.DBConnection.ConnectionUtil;
import com.ayvan.dao.CategoryDao;
import com.ayvan.entities.Categories;

@WebServlet("/AddCategory")
public class AddCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AddCategory() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		switch (action) {
		
			
		case "DELETE":
			deleteCategory(request, response);
			break;

		default:
			deleteCategory(request, response);
			break;
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter writer = response.getWriter();
		
		String add = request.getParameter("category");
		String desc = request.getParameter("description");
		response.sendRedirect("addcategory.jsp");
		System.out.println(add+" "+desc);
		writer.println(add+" "+desc);
		Categories categories = new Categories(add, desc);
		CategoryDao dao = new CategoryDao(ConnectionUtil.openConnection());
		if(dao.saveCategory(categories)) {
			writer.println("categories are saved");
		} else {
			writer.print("categories are not inserted");
		}
		
	}


	
	
	protected void deleteCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		 Categories categories = new Categories(id);
		 categories.setId(id);
		 CategoryDao dao = new CategoryDao(ConnectionUtil.openConnection());
		 dao.deleteCategory(categories);
		 if(dao.deleteCategory(categories)) {
			 System.out.println("Deleted....."+id);
			 System.out.println("Dao link available "+dao);
			 System.out.println("categories link available "+categories);
			 response.sendRedirect("addcategory.jsp");
		 } else {
			 System.out.println("Not deleted....");
		 }
	}

	
}
