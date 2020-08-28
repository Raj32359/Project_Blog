package com.ayvan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ayvan.entities.User;

public class UserDao {

	private Connection connection;

	public UserDao(Connection connection) {
		this.connection = connection;
	}
	
	public boolean saveUser(User user) {
		boolean flag = false;

		try {
			String sql = "INSERT INTO Register(username,email,password) VALUES(?,?,?);";
			PreparedStatement pstmt = this.connection.prepareStatement(sql);
			
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.executeUpdate();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public User getUserByEmailAndPassword(String email, String password) {
		User user = null;
		
		try {
			String sql =  "SELECT * FROM user WHERE email=? and password=?";
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1,email);
			pstmt.setString(2, password);
			ResultSet resultSet = pstmt.executeQuery();
			
			if(resultSet.next()) {
				user = new User();
				
				//extracting from database
				String name = resultSet.getString("username");
				
				// assigning he values to the variables
				user.setUsername(name);
				
				user.setId(resultSet.getInt("id"));
				user.setEmail(resultSet.getString("email"));
				user.setPassword(resultSet.getString("password"));
				user.setDateTime(resultSet.getTimestamp("regdate"));
				user.setProfile(resultSet.getString("profile"));
				
				System.out.println(user.getId()+" "+user.getEmail()+" "+user.getPassword()+" "+user.getDateTime()+" "+user.getUsername());
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
		
	}
	
	
	public boolean updateUser(User user) {
		boolean flag = false;
		
		try {
			String sql = "UPDATE user SET username =?, email=?, password=?, profile=? WHERE id=?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, user.getUsername());
			statement.setString(2, user.getEmail());
			statement.setString(3, user.getPassword());
			statement.setString(4, user.getProfile());
			statement.setInt(5, user.getId());
			statement.executeUpdate();
			flag =true;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
}
