package com.action;

import java.net.URLDecoder;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.service.AddrService;
import com.bean.Address;

public class AddAddrAction extends ActionSupport{

	private AddrService addrService;
	private String completeAddr;
	private String result;
	
	public String getCompleteAddr() {
		return completeAddr;
	}
	public void setCompleteAddr(String completeAddr) {
		this.completeAddr = completeAddr;
	}
	
	public AddrService getAddrService() {
		return addrService;
	}
	public void setAddrService(AddrService addrService) {
		this.addrService = addrService;
	}
	
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
	
	public String addAddrInfo(){
		Address addr = new Address();
		Map<String, Object> session = ActionContext.getContext().getSession();
		String userID = session.get("userID").toString();
		addr.setAddrNo(2);
		addr.setUserAddr(completeAddr);
		addr.setUserNo(userID);
		addrService.saveAddr(addr);
		result="true";
		
		return "success";
	}
	
}
