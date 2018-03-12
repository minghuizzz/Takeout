package com.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.bean.Address;
import com.bean.Cart_Order;
import com.bean.Food;
import com.bean.Orders;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.CartService;
import com.service.MenuService;

public class DeleteCartAction extends ActionSupport {
	private CartService cartService;
	private MenuService menuService;
	public String foodType;
	private static final long serialVersionUID = 0;
	private int orderNo;

	public CartService getCartService() {
		return cartService;
	}

	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public MenuService getMenuService() {
		return menuService;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}

	public String getFoodType() {
		return foodType;
	}

	public void setFoodType(String foodType) {
		this.foodType = foodType;
	}

	public String deleteOrder() {
		cartService.deleteOrder(orderNo);
		// 重新获取request
		Map<String, Object> session = ActionContext.getContext().getSession();
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest) ctx
				.get(ServletActionContext.HTTP_REQUEST);
		String userNo = session.get("userNo").toString();
		cartService.setCartList(userNo);
		List<Orders> cartList = cartService.getCartList();
		String userAddr;
		if (request.getAttribute("userAddr") != null) {
			userAddr = request.getAttribute("userAddr").toString();
		} else {
			Address addr = cartService.getDefaultAddress(userNo);
			userAddr = addr.getUserAddr();
		}
		List<Address> userAddrList = cartService.addrList(userNo);
		int totalPrice = cartService.totalPrice();
		String planSendTime = cartService.planSendTime();
		int[] priceList = cartService.priceList();
		String[] pictureList=cartService.pictureList();
		String[] picList = cartService.picList();

		// 将食品价格加到cartList中
		List<Cart_Order> new_CartList = new ArrayList<Cart_Order>();
		for (int i = 0; i < cartList.size(); i++) {
			Cart_Order co = new Cart_Order();
			co.setAddress(cartList.get(i).getAddress());
			co.setAmount(cartList.get(i).getAmount());
			co.setFoodName(cartList.get(i).getFoodName());
			co.setOrderNo(cartList.get(i).getOrderNo());
			co.setOrderTime(cartList.get(i).getOrderTime());
			co.setPay(cartList.get(i).getIsPay());
			co.setSendTime(cartList.get(i).getSendTime());
			co.setUserNo(cartList.get(i).getUserNo());
			co.setFoodPrice(priceList[i]);
			co.setFoodPicture(pictureList[i]);
			new_CartList.add(co);
		}

		request.setAttribute("cartList", new_CartList);
		request.setAttribute("userAddr", userAddr);
		request.setAttribute("userAddrList", userAddrList);
		request.setAttribute("totalPrice", totalPrice);
		request.setAttribute("planSendTime", planSendTime);
		request.setAttribute("priceList", priceList);
		request.setAttribute("picList", picList);
		request.setAttribute("pictureList", pictureList);

		List<Food> menuList = menuService.showMenu(foodType);
		request.setAttribute("foodType", foodType);
		request.setAttribute("menuList", menuList);

		return "success";
	}

}
