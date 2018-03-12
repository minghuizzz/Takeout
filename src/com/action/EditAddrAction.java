package com.action;

import java.util.Map;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.AddrService;
import com.bean.Address;


public class EditAddrAction extends ActionSupport{

	private AddrService addrService;
	public List<Address> addressList;
	private String result;
	private String delNum;
	

	public String getDelNum() {
		return delNum;
	}

	public void setDelNum(String delNum) {
		this.delNum = delNum;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public List<Address> getAddressList() {
		return addressList;
	}

	public void setAddressList(List<Address> addressList) {
		this.addressList = addressList;
	}

	public AddrService getAddrService() {
		return addrService;
	}

	public void setAddrService(AddrService addrService) {
		this.addrService = addrService;
	}
	
	public String deleteAddr(){
		Map<String, Object> session = ActionContext.getContext().getSession();
		Object userID = session.get("userID");//获取登录用户的ID
		addressList = addrService.getUserAddr(userID.toString());
		if(addrService.deleteAddr(addressList.get(Integer.parseInt(delNum)-1)))
			result = "true";
		
		return SUCCESS;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
