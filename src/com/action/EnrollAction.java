package com.action;

import com.bean.Users;
import com.opensymphony.xwork2.ActionSupport;
import com.service.UserService;

public class EnrollAction extends ActionSupport{

	private UserService userService;
	public String enrollUserName;
	public String enrollPassword;
	public String confirm_password;
	public String phoneNumber;
	public String sex;
	
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	public UserService getUserService(){
		return userService;
	}
	public void setUserService(UserService userService){
		this.userService = userService;
	}
	
	public String getEnrollUserName() {
		return enrollUserName;
	}
	public void setEnrollUserName(String enrollUserName) {
		this.enrollUserName = enrollUserName;
	}
	
	public String getEnrollPassword() {
		return enrollPassword;
	}
	public void setEnrollPassword(String enrollPassword) {
		this.enrollPassword = enrollPassword;
	}
	
	public String getConfirm_password() {
		return confirm_password;
	}
	public void setConfirm_password(String confirm_password) {
		this.confirm_password = confirm_password;
	}
	
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	public String enroll(){
		if(this.userService.userNameExsit(enrollUserName)){
			addFieldError("userName","用户名已存在");
			return "error";
		}
		if(this.userService.phoneNumberExsit(phoneNumber)){
			addFieldError("phoneNumber","电话号码已存在");
			return "error";
		}
		
		Users user = new Users();
		if(sex == "man")
			user.setSex(true);
		else
			user.setSex(false);
		
		user.setUsername(enrollUserName);
		user.setPassword(enrollPassword);
		user.setIsLogin(true);
		user.setPhoneNumber(phoneNumber);
		userService.saveUser(user);
		
		return "success";
	}
	
}
