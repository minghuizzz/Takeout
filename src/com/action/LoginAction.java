package com.action;

import java.util.Map;
import com.bean.Users;
import com.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;

public class LoginAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userName;
	private String password;
	private UserService userService;
	
	public String getUserName(){
		return userName;
	}
	public void setUserName(String userName){
		this.userName = userName;
	}
	
	public String getPassword(){
		return password;
	}
	public void setPassword(String password){
		this.password = password;
	}
	
	public UserService getUserService(){
		return userService;
	}
	public void setUserService(UserService userService){
		this.userService = userService;
	}
	
	public String login(){
		//Boolean[] isLogin = {false};
		//Integer[] userID = {0};
		if(this.userService.loginByPhoneNumber(userName, password) 
				|| this.userService.loginByUserName(userName, password)){//使用电话号码或者用户名登录
			Users user = userService.findUserByUserName(userName);
			Map<String,Object> session = ActionContext.getContext().getSession();
			session.put("userName", user.getUsername());
			session.put("password", user.getPassword());
			session.put("userNo", user.getUserNo());
			session.put("userID", user.getUserNo());
			session.put("isLogin", true);
			return "success";
		}
		else{
			addFieldError("userName","用户名或密码不正确");
			return "error";//暂定
		}
	}
}
