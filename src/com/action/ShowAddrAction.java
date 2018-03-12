package com.action;

import java.util.Map;
import java.util.List;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;
import com.service.AddrService;
import com.bean.Address;

public class ShowAddrAction extends ActionSupport{

	private AddrService addrService;
	private List<Address> addressList;

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
	
	public String showAddr(){
		Map<String, Object> session = ActionContext.getContext().getSession();
		Object userID = session.get("userID");
		addressList = addrService.getUserAddr(userID.toString());
		return "success";
	}
}
