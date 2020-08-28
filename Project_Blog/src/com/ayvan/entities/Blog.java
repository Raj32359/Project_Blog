package com.ayvan.entities;

import java.sql.Timestamp;

public class Blog {
	
	private int bid;
	private String title;
	private String content;
	private Timestamp date;
	private int cid;
	private int userId;
	
	public Blog() {
		
	}

	public Blog(int bid, String title, String content, Timestamp date, int cid, int userId) {
		super();
		this.bid = bid;
		this.title = title;
		this.content = content;
		this.date = date;
		this.cid = cid;
		this.userId = userId;
	}

	public Blog(String title, String content, Timestamp date, int cid, int userId) {
		super();
		this.title = title;
		this.content = content;
		this.date = date;
		this.cid = cid;
		this.userId = userId;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
	

}
