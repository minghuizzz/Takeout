package com.action;

import java.util.Map;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;

public class LogoutAction extends ActionSupport{
	public String logout(){
		Map<String,Object> session = ActionContext.getContext().getSession();
		session.remove("userName");
		session.remove("userID");
		session.remove("isLogin");
		return "success";
	}
}
