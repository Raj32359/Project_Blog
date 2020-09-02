package com.ayvan.dao;




import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.ayvan.entities.Users;

public class UserDao {

	
	private SessionFactory factory;
	

	public UserDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	public Users getUserByEmailAndPassWord(String email, String password) {
		Users user = null;
		
		try(Session session = this.factory.openSession()) {
			String HQL= "FROM Users WHERE userEmail =:mail AND password =:pswd";
			System.out.println(email+ " "+password);
			Query query = session.createQuery(HQL);
			query.setParameter("mail", email);
			query.setParameter("pswd", password);
			user = (Users)query.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}

}
