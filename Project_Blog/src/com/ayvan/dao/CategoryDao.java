package com.ayvan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.ayvan.entities.Categories;

public class CategoryDao {
	
	private Connection connection;

	public CategoryDao(Connection connection) {
		this.connection = connection;
	}
	
	public boolean saveCategory(Categories categories) {
		boolean flag = false;
		
		try {
			String sql = "INSERT INTO category(category_name, category_desc) VALUES(?, ?)";
			PreparedStatement statement = this.connection.prepareStatement(sql);
			statement.setString(1, categories.getName());
			statement.setString(2, categories.getDesc());
			statement.executeUpdate();
			flag = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}

	public ArrayList<Categories> getAllCategories() {
		ArrayList<Categories> list = new ArrayList<>();
		try {
			String sql = "SELECT * FROM category";
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet result = statement.executeQuery();
			while(result.next()) {
				int cid = result.getInt("cid");
				String name = result.getString("category_name");
				String desc = result.getString("category_desc");
				Categories cat = new Categories(cid,name,desc);
				list.add(cat);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}

	public boolean deleteCategory(Categories categories) {
		boolean flag = false;
		try {
			String sql = "DELETE FROM category WHERE cid=?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, categories.getId());
			System.out.println("Id Recieved form servlet"+categories.getId());
			statement.executeUpdate();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public int categoryCount() {
		int count = 0;
		try {
			String sql = "SELECT COUNT(*) FROM category";
			PreparedStatement statement = connection.prepareStatement(sql);			
			ResultSet resultSet = statement.executeQuery();
			if(resultSet.next()) {
				count = resultSet.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
}
