package com.action;

import java.util.Map;

import com.bean.Users;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.UserService;

public class ModifyUserInfoAction extends ActionSupport{

	private UserService userService;
	private String userName;
	private String phoneNumber;
	private String oldPassword;
	private String newPassword;
	private String confirmNewPassword;
	
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	public String getOldPassword() {
		return oldPassword;
	}
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
	
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	
	public String getConfirmNewPassword() {
		return confirmNewPassword;
	}
	public void setConfirmNewPassword(String confirmNewPassword) {
		this.confirmNewPassword = confirmNewPassword;
	}
	
	@SuppressWarnings("unchecked")
	public String modifyUserInfo(){
		Map<String,Object> session = ActionContext.getContext().getSession();
		Map<String, String> request = (Map<String,String>)ActionContext.getContext().get("request");//可能出错
		request.put("userName", userName);
		if(!userService.loginByUserName((String)session.get("userName"), oldPassword)){
			addFieldError("userName","用户名或密码不正确");
			return "error";
		}
		Users user = userService.findUserByUserName(userName);
		user.setUsername(userName);
		session.put("userName", userName);
		user.setPassword(newPassword);//使用js验证密码是否相等
		user.setPhoneNumber(phoneNumber);
		userService.updateUser(user);
		return "success";
	}
}
