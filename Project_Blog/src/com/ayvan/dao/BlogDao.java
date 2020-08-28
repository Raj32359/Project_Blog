package com.ayvan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.ayvan.entities.Blog;
import com.ayvan.entities.Categories;

public class BlogDao {

	private Connection connection;

	public BlogDao(Connection connection) {
		super();
		this.connection = connection;
	}
	
	public boolean saveBlog(Blog blog) {
		boolean flag = false;
		try {
			String sql = "INSERT INTO blog(blog_title, blog_content,cid, userId) VALUES(?,?,?,?)";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, blog.getTitle());
			statement.setString(2, blog.getContent());
			statement.setInt(3, blog.getCid());
			statement.setInt(4, blog.getUserId());
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
	
	public List<Blog> getAllBlogs() {
		List<Blog> list = new ArrayList<>();
		try {
			String sql = "SELECT * FROM blog";
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet result = statement.executeQuery();
			while(result.next()) {
				int bid = result.getInt("blog_id");
				String title = result.getString("blog_title");
				String content = result.getString("blog_content");
				Timestamp date = result.getTimestamp("blog_date");
				int ccid = result.getInt("cid");
				int uid = result.getInt("userId");
				Blog blog = new Blog(bid, title, content, date, ccid, uid);
				list.add(blog);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	public List<Blog> getPostById(int catId) {
		List<Blog> list = new ArrayList<>();
		try {
			String sql = "SELECT * FROM blog WHERE cid=?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, catId);
			ResultSet result = statement.executeQuery();
			while(result.next()) {
				int bid = result.getInt("blog_id");
				String title = result.getString("blog_title");
				String content = result.getString("blog_content");
				Timestamp date = result.getTimestamp("blog_date");
				int uid = result.getInt("userId");
				Blog blog = new Blog(bid, title, content, date, catId, uid);
				list.add(blog);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Blog getBlogById(int blogId) {
		Blog blog = null;
		try {
			String sql = "SELECT * FROM blog WHERE blog_id=?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, blogId);
			ResultSet result = statement.executeQuery();
			if(result.next()) {
				int bid = result.getInt("blog_id");
				String title = result.getString("blog_title");
				String content = result.getString("blog_content");
				Timestamp date = result.getTimestamp("blog_date");
				int uid = result.getInt("userId");
				blog = new Blog(bid, title, content, date, blogId, uid);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return blog;
	}
	
	public int getBlogCount() {
		int count = 0;
		try {
			String sql = "SELECT COUNT(*) FROM blog ";
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet result = statement.executeQuery();
			if(result.next()) {
				count = result.getInt(1);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public int getBlogCatCount(int cid) {
		int count = 0;
		try {
			String sql = "SELECT COUNT(*) FROM blog WHERE cid=? ";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, cid);
			ResultSet result = statement.executeQuery();
			if(result.next()) {
				count = result.getInt(1);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
}
