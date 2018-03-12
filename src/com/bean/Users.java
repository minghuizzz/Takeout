package com.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Users entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "users", catalog = "takeout")
public class Users implements java.io.Serializable {

	// Fields

	private String userNo;
	private String password;
	private boolean sex;
	private String phoneNumber;
	private boolean isLogin;
	private String username;

	// Constructors

	/** default constructor */
	public Users() {
	}

	/** minimal constructor */
	public Users(String username) {
		this.username = username;
	}

	/** full constructor */
	public Users(String password, boolean sex, String phoneNumber,
			boolean isLogin, String username) {
		this.password = password;
		this.sex = sex;
		this.phoneNumber = phoneNumber;
		this.isLogin = isLogin;
		this.username = username;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "userNo", unique = true, nullable = false, length = 11)
	public String getUserNo() {
		return this.userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	@Column(name = "password", length = 16)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "sex")
	public boolean getSex() {
		return this.sex;
	}

	public void setSex(boolean sex) {
		this.sex = sex;
	}

	@Column(name = "phoneNumber", length = 11)
	public String getPhoneNumber() {
		return this.phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	@Column(name = "isLogin")
	public boolean getIsLogin() {
		return this.isLogin;
	}

	public void setIsLogin(boolean isLogin) {
		this.isLogin = isLogin;
	}

	@Column(name = "username", nullable = false, length = 20)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}