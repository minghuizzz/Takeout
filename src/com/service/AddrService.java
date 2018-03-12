package com.service;

import com.bean.AddressDAO;
import com.bean.Address;
import java.util.List;


public class AddrService {

	private AddressDAO addrDao;
	
	public AddressDAO getAddrDao(){
		return addrDao;
	}
	public void setAddrDao(AddressDAO addrDao){
		this.addrDao = addrDao;
	}
	
	public void saveAddr(Address addr){//保存地址到数据库
		this.addrDao.save(addr);
	}
	
	public void updateAddr(Address addr){
		this.addrDao.attachDirty(addr);
	}
	
	public Boolean deleteAddr(Address addr){
		this.addrDao.delete(addr);
		return true;
	}
	
	public List<Address> getUserAddr(String userNo){
		List<Address> listAddr = this.addrDao.findByUserNo(userNo);
		if(listAddr.size() != 0)
			return listAddr;
		else
			return null;
	}
}
