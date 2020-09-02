package com.ayvan.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.ayvan.dao.CategoryDao;
import com.ayvan.dao.ProductDao;
import com.ayvan.entities.Category;
import com.ayvan.entities.Product;
import com.ayvan.util.HibernateUtil;

@MultipartConfig
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RequestDispatcher requestDispatcher = null;

	public AddProduct() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.getRequestDispatcher("/admin/addproducts.jsp");
		String name = request.getParameter("productName");
		String desc = request.getParameter("productDescription");
		Part img = request.getPart("productImage");
		String imagename = img.getSubmittedFileName();
		Integer price = Integer.parseInt(request.getParameter("productPrice"));
		Integer disc = Integer.parseInt(request.getParameter("productDisc"));
		Integer qnty = Integer.parseInt(request.getParameter("productQuantity"));
		Integer catId = Integer.parseInt(request.getParameter("productCategory"));

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		out.println(

				"\n " + name +
				"\n " + desc +
				"\n " + imagename +
				"\n " + price +
				"\n " + disc +
				"\n " + qnty +
				"\n " + catId
				);
		response.sendRedirect("admin/addproducts.jsp");
		
		  Product product = new Product(); 
		  product.setProductName(name);
		  product.setProductDescription(desc);
		  product.setProductOffer(disc); 
		  product.setProductPics(imagename);
		  product.setProductPrice(price); 
		  product.setProductQuantity(qnty);
		  
		  CategoryDao dao = new CategoryDao(HibernateUtil.getSessionFactory());
		  Category category = dao.getCategoryById(catId);
		  product.setCategory(category); 
		 
		  
		  ProductDao productDao = new ProductDao(HibernateUtil.getSessionFactory());
		//  productDao.saveProduct(product);
		  
		  
		 String path = "/home/raj3009/eclipse-workspace/Jsp_Servlet_Parctice/Project_Shop/src/main/webapp/images"+File.separator+"products"+File.separator+img.getSubmittedFileName();
		 System.out.println(path);
		 
		 try {
			// uploading file into floder
			FileOutputStream Output = new FileOutputStream(path);
			InputStream in = img.getInputStream();
			byte[] data = new byte[in.available()];
			in.read(data);
			Output.write(data);
			Output.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
