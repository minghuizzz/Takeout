package com.bean;

import java.util.Date;

public class Cart_Order {
	private Integer orderNo;
	private Integer amount;
	private Date orderTime;
	private Date sendTime;
	private boolean isPay;
	private String address;
	private String foodName;
	private String userNo;
	private String foodPicture;
	private int foodPrice;
	
	/** default constructor */
	public Cart_Order() {
	}

	/** full constructor */
	public Cart_Order(Integer amount, Date orderTime, Date sendTime, boolean isPay,
			String address, String foodName, String userNo,String foodPicture,int foodPrice) {
		this.amount = amount;
		this.orderTime = orderTime;
		this.sendTime = sendTime;
		this.isPay = isPay;
		this.address = address;
		this.foodName = foodName;
		this.userNo = userNo;
		this.foodPrice=foodPrice;
		this.foodPicture=foodPicture;
	}

	public Integer getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	public boolean isPay() {
		return isPay;
	}

	public void setPay(boolean isPay) {
		this.isPay = isPay;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getFoodPicture() {
		return foodPicture;
	}

	public void setFoodPicture(String foodPicture) {
		this.foodPicture = foodPicture;
	}

	public int getFoodPrice() {
		return foodPrice;
	}

	public void setFoodPrice(int foodPrice) {
		this.foodPrice = foodPrice;
	}
}
