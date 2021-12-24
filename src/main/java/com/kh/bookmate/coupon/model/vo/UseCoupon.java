package com.kh.bookmate.coupon.model.vo;

public class UseCoupon {

	private String user_Id;
	private String couponCode;
	
	public UseCoupon() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UseCoupon(String user_Id, String couponCode) {
		super();
		this.user_Id = user_Id;
		this.couponCode = couponCode;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public String getCouponCode() {
		return couponCode;
	}

	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}

	@Override
	public String toString() {
		return "UseCoupon [user_Id=" + user_Id + ", couponCode=" + couponCode + "]";
	}


	
	
	
}
