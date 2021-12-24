package com.kh.bookmate.ubook_cart.model.vo;

import java.util.List;


public class UbookCart {
	
	private int cartNo;
	private int cartUbNo;
	private String cartUserId;
	private int cartCount;
	
	private List<UbookCart> cartList;
	
	public UbookCart() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getCartUbNo() {
		return cartUbNo;
	}

	public void setCartUbNo(int cartUbNo) {
		this.cartUbNo = cartUbNo;
	}

	public String getCartUserId() {
		return cartUserId;
	}

	public void setCartUserId(String cartUserId) {
		this.cartUserId = cartUserId;
	}

	public int getCartCount() {
		return cartCount;
	}

	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}

	public List<UbookCart> getCartList() {
		return cartList;
	}

	public void setCartList(List<UbookCart> cartList) {
		this.cartList = cartList;
	}

	
	public UbookCart(int cartNo, int cartUbNo, String cartUserId, int cartCount) {
		super();
		this.cartNo = cartNo;
		this.cartUbNo = cartUbNo;
		this.cartUserId = cartUserId;
		this.cartCount = cartCount;
	}
	
	public UbookCart(int cartUbNo, String cartUserId, int cartCount) {
		super();
		this.cartUbNo = cartUbNo;
		this.cartUserId = cartUserId;
		this.cartCount = cartCount;
	}

	public UbookCart(List<UbookCart> cartList) {
		super();
		this.cartList = cartList;
	}

	public UbookCart(int cartNo, int cartUbNo, int cartCount) {
		super();
		this.cartNo = cartNo;
		this.cartUbNo = cartUbNo;
		this.cartCount = cartCount;
	}

	@Override
	public String toString() {
		return "UbookCart [cartNo=" + cartNo + ", cartUbNo=" + cartUbNo + ", cartUserId=" + cartUserId + ", cartCount="
				+ cartCount + ", cartList=" + cartList + "]";
	}

	
}
