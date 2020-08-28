package com.ayvan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {
	Connection connection;
	
	public LikeDao(Connection connection) {
		super();
		this.connection = connection;
	}



	public boolean insertLike(int blog_id, int user_id) {
		boolean flag = false;
		try {
			String sql = "INSERT into like_table(blog_id, user_id) VALUES(?, ?)";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, blog_id);
			statement.setInt(2, user_id);
			statement.executeUpdate();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public int LikeCountOnPost(int blog_id) {
		int count = 0;
		try {
			String sql = "SELECT COUNT(*) FROM like_table WHERE blog_id=?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, blog_id);
			ResultSet result = statement.executeQuery();
			if(result.next()) {
				count = result.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public boolean isLikedByUser(int blog_id, int user_id) {
		boolean flag = false;
		try {
			String sql = "SELECT * FROM like_table WHERE blog_id=? and user_id=?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, blog_id);
			statement.setInt(2, user_id);
			ResultSet query = statement.executeQuery();
			if(query.next()) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public boolean deleteLike(int blog_id, int user_id) {
		boolean flag = false;
		try {
			String sql = "DELETE * FROM like_table WHERE blog_id=? and user_id=?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, blog_id);
			statement.setInt(2, user_id);
			statement.executeUpdate();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}
