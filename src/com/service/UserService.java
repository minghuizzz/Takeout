package com.service;

import com.bean.UsersDAO;
import com.bean.Users;
import java.util.List;


public class UserService{

	private UsersDAO userDao;

	public UsersDAO getUserDao(){
		return userDao;
	}
	public void setUserDao(UsersDAO userDao){
		this.userDao = userDao;
	}
	
	public void saveUser(Users user){//保存user
		this.userDao.save(user);
	}
	
	public void updateUser(Users user){
		this.userDao.attachDirty(user);
	}
	
	public boolean loginByUserName(String userName, String password){
		List<Users> listUserObj = this.userDao.findByUsername(userName);
		if(listUserObj.size() != 0){
			Users user = listUserObj.get(0);
			if(user.getPassword().equals(password)){
				user.setIsLogin(true);
				return true;
			}
			else
				return false;
		}
		else
			return false;
	}

	public boolean loginByPhoneNumber(String phoneNumber, String password){//phoneNumber作为userID
		List<Users> listUserObj = this.userDao.findByPhoneNumber(phoneNumber);
		if(listUserObj.size() != 0){
			Users user = listUserObj.get(0);
			if(user.getPassword().equals(password)){
				user.setIsLogin(true);
				return true;
			}
			else
				return false;
		}
		else
			return false;
	}
	

	public boolean userNameExsit(String userName){
		List<Users> listUserObj = this.userDao.findByUsername(userName);
		if(listUserObj.size() != 0)
			return true;
		else
			return false;
	}
	

	public boolean phoneNumberExsit(String phoneNumber){
		List<Users> listUserObj = this.userDao.findByPhoneNumber(phoneNumber);
		if(listUserObj.size() != 0)
			return true;
		else
			return false;
	}
	
	public Users findUserByUserName(String userName){
		List<Users> listUserObj = this.userDao.findByUsername(userName);
		if(listUserObj.size() != 0){
			Users user = listUserObj.get(0);
			return user;
		}
		else
			return null;
	}
}
