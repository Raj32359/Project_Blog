package com.ayvan.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.ayvan.entities.Product;

public class ProductDao {

	private SessionFactory sessionFactory;

	public ProductDao(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}
	
	public boolean saveProduct(Product product) {
		boolean flag = false;
		try {
			Session session = this.sessionFactory.openSession();
			session.beginTransaction();
			 session.save(product);
			session.getTransaction().commit();
			session.close();
			flag = true;
			
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}
		return flag;
		
	}
	
	public List<Product> getAllProducts() {
		
		
			Session session = this.sessionFactory.openSession();
			Query query = session.createQuery("From Product");
			List<Product> list = query.list();
		
		return list;
	}
	
	public List<Product> getAllProductById(int cid) {
		
		Session session = this.sessionFactory.openSession();
		Query query = session.createQuery("From Product as p WHERE p.category.categoryId =:id");
		query.setParameter("id", cid);
		List<Product> list = query.list();
		return list;
		
	}
}
