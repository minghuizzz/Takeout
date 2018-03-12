package com.service;

import java.util.List;

import com.bean.Food;
import com.bean.FoodDAO;

public class MenuService {
	private FoodDAO foodDAO;
	public FoodDAO getFoodDAO(){
		return foodDAO;
	}
	public void setFoodDAO(FoodDAO foodDAO){
		this.foodDAO=foodDAO;
	}
	public List<Food> showMenu(String foodType){
		List<Food> menuList=foodDAO.findByFoodType(foodType);
		return menuList;
	}
}
