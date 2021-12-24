package com.kh.bookmate.coupon.model.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Coupon {
	
	private String couponCode;
	private int couponPoint;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date couponStartDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date couponEndDate;
	
	public Coupon() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Coupon(String couponCode, int couponPoint, Date couponStartDate, Date couponEndDate) {
		super();
		this.couponCode = couponCode;
		this.couponPoint = couponPoint;
		this.couponStartDate = couponStartDate;
		this.couponEndDate = couponEndDate;
	}

	public Coupon(String couponCode2, String user_Id) {
		// TODO Auto-generated constructor stub
	}

	public String getCouponCode() {
		return couponCode;
	}

	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}

	public int getCouponPoint() {
		return couponPoint;
	}

	public void setCouponPoint(int couponPoint) {
		this.couponPoint = couponPoint;
	}

	public Date getCouponStartDate() {
		return couponStartDate;
	}

	public void setCouponStartDate(Date couponStartDate) {
		this.couponStartDate = couponStartDate;
	}

	public Date getCouponEndDate() {
		return couponEndDate;
	}

	public void setCouponEndDate(Date couponEndDate) {
		this.couponEndDate = couponEndDate;
	}

	@Override
	public String toString() {
		return "Coupon [couponCode=" + couponCode + ", couponPoint=" + couponPoint + ", couponStartDate="
				+ couponStartDate + ", couponEndDate=" + couponEndDate + "]";
	}

	
}
