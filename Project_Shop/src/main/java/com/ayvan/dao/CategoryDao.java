package com.ayvan.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.ayvan.entities.Category;

public class CategoryDao {

	private SessionFactory sessionFactory;

	public CategoryDao(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}
	
	public int saveCategory(Category category) {
		int saveId = 0;
		try {
			Session session = this.sessionFactory.openSession();
			session.beginTransaction();
			saveId = (int) session.save(category);
			session.getTransaction().commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return saveId;
		
	}
	
	public List<Category> getCategories(){
		Session session = this.sessionFactory.openSession();
		Query query  = session.createQuery("From Category");
		List<Category> list = query.list();
		return list;
	}
	
	public Category getCategoryById(int catid) {
		Category cat = null;
		try {
			Session session = this.sessionFactory.openSession();
			cat = session.get(Category.class, catid);
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cat;
	}
}
