package com.ayvan.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "customer")
public class Users implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer userId;
	private String userName;
	@Column(unique = true)
	private String userEmail;
	private String mobile;
	private String password;	
	private String city;
	
	public Users() {
		// TODO Auto-generated constructor stub
	}

	public Users(Integer userId, String userName, String userEmail, String mobile, String password, String city) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userEmail = userEmail;
		this.mobile = mobile;
		this.password = password;
		this.city = city;
	}

	public Users(String userName, String userEmail, String mobile, String password, String city) {
		super();
		this.userName = userName;
		this.userEmail = userEmail;
		this.mobile = mobile;
		this.password = password;
		this.city = city;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Override
	public String toString() {
		return "Users [userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", mobile=" + mobile
				+ ", password=" + password + ", city=" + city + "]";
	}
	
	
	
	
}
