package com.ayvan.entities;

import java.sql.Timestamp;

public class User {
	
	private int id;
	private String username;
	private String email;
	private String password;	
	private Timestamp dateTime;
	private String profile;
	
	public User(int id, String username, String email, String password, Timestamp dateTime) {
		super();
		this.id = id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.dateTime = dateTime;
	}
	
	public User(String username, String email, String password) {
		super();
		this.username = username;
		this.email = email;
		this.password = password;		
	}
	
	public User(String username, String email, String password, Timestamp dateTime, String profile) {
		super();
		this.username = username;
		this.email = email;
		this.password = password;
		this.dateTime = dateTime;
		this.profile = profile;
	}

	public User() {
	}
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Timestamp getDateTime() {
		return dateTime;
	}

	public void setDateTime(Timestamp dateTime) {
		this.dateTime = dateTime;
	}
	
	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", email=" + email + ", password=" + password
				+ ", dateTime=" + dateTime + ", profile=" + profile + "]";
	}

	

}
