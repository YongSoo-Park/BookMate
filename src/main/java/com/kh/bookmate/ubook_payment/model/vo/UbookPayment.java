package com.kh.bookmate.ubook_payment.model.vo;

import java.util.Date;

public class UbookPayment {

	private int paymentNoUb;
	private String userIdUb;
	private String shippingNameUb;
	private String shippingPostCodeUb;
	private String shippingAddressUb;
	private String shippingAddressDetailUb;
	private String shippingPhoneUb;
	private String deliveryRequestUb;
	private Date payDateUb;
	private int totalCostUb;
	private String paymentMethodUb;
	private int totalPayCostUb;
	private int deliveryCostUb;
	
	public UbookPayment() {
		super();
		// TODO Auto-generated constructor stub
	}


	public UbookPayment(int paymentNoUb, String userIdUb, String shippingNameUb, String shippingAddressUb, String shippingPhoneUb,
			String deliveryRequestUb, Date payDateUb, int totalCostUb, String paymentMethodUb) {
		super();
		this.paymentNoUb = paymentNoUb;
		this.userIdUb = userIdUb;
		this.shippingNameUb = shippingNameUb;
		this.shippingAddressUb = shippingAddressUb;
		this.shippingPhoneUb = shippingPhoneUb;
		this.deliveryRequestUb = deliveryRequestUb;
		this.payDateUb = payDateUb;
		this.totalCostUb = totalCostUb;
		this.paymentMethodUb = paymentMethodUb;
	}

	public UbookPayment(String userIdUb, String shippingNameUb, String shippingAddressUb, String shippingPhoneUb, int totalCostUb,
			String paymentMethodUb) {
		super();
		this.userIdUb = userIdUb;
		this.shippingNameUb = shippingNameUb;
		this.shippingAddressUb = shippingAddressUb;
		this.shippingPhoneUb = shippingPhoneUb;
		this.totalCostUb = totalCostUb;
		this.paymentMethodUb = paymentMethodUb;
	}

	public UbookPayment(String userIdUb, String shippingNameUb,String shippingPostCodeUb, String shippingAddressUb, String shippingAddressDetailUb,String shippingPhoneUb,
			int totalCostUb) {
		super();
		this.userIdUb = userIdUb;
		this.shippingNameUb = shippingNameUb;
		this.shippingPostCodeUb = shippingPostCodeUb;
		this.shippingAddressUb = shippingAddressUb;
		this.shippingAddressDetailUb = shippingAddressDetailUb;
		this.shippingPhoneUb = shippingPhoneUb;
		this.totalCostUb = totalCostUb;
	}
	/*
	public UbookPayment(String userIdUb, String shippingNameUb, String shippingAddressUb, String shippingPhoneUb,
			String deliveryRequestUb, int totalCostUb, String paymentMethodUb) {
		super();
		this.userIdUb = userIdUb;
		this.shippingNameUb = shippingNameUb;
		this.shippingAddressUb = shippingAddressUb;
		this.shippingPhoneUb = shippingPhoneUb;
		this.deliveryRequestUb = deliveryRequestUb;
		this.totalCostUb = totalCostUb;
		this.paymentMethodUb = paymentMethodUb;
	}

	public UbookPayment(String userIdUb, String shippingNameUb, String shippingAddressUb, String shippingPhoneUb,
			String deliveryRequestUb, int totalCostUb, String paymentMethodUb) {
		super();
		this.userIdUb = userIdUb;
		this.shippingNameUb = shippingNameUb;
		this.shippingAddressUb = shippingAddressUb;
		this.shippingPhoneUb = shippingPhoneUb;
		this.deliveryRequestUb = deliveryRequestUb;
		this.totalCostUb = totalCostUb;
		this.paymentMethodUb = paymentMethodUb;
	}*/
	
	

	public UbookPayment(String userIdUb, String shippingNameUb, String shippingAddressUb,
			 String shippingPhoneUb, int totalCostUb) {
		super();
		this.userIdUb = userIdUb;
		this.shippingNameUb = shippingNameUb;
		this.shippingAddressUb = shippingAddressUb;
		this.shippingPhoneUb = shippingPhoneUb;
		this.totalCostUb = totalCostUb;
	}


	public int getPaymentNoUb() {
		return paymentNoUb;
	}


	public void setPaymentNoUb(int paymentNoUb) {
		this.paymentNoUb = paymentNoUb;
	}


	public String getUserIdUb() {
		return userIdUb;
	}


	public void setUserIdUb(String userIdUb) {
		this.userIdUb = userIdUb;
	}


	public String getShippingNameUb() {
		return shippingNameUb;
	}


	public void setShippingNameUb(String shippingNameUb) {
		this.shippingNameUb = shippingNameUb;
	}


	
	public String getShippingPostCodeUb() {
		return shippingPostCodeUb;
	}


	public void setShippingPostCodeUb(String shippingPostCodeUb) {
		this.shippingPostCodeUb = shippingPostCodeUb;
	}


	public String getShippingAddressDetailUb() {
		return shippingAddressDetailUb;
	}


	public void setShippingAddressDetailUb(String shippingAddressDetailUb) {
		this.shippingAddressDetailUb = shippingAddressDetailUb;
	}


	public String getShippingAddressUb() {
		return shippingAddressUb;
	}


	public void setShippingAddressUb(String shippingAddressUb) {
		this.shippingAddressUb = shippingAddressUb;
	}


	public String getShippingPhoneUb() {
		return shippingPhoneUb;
	}


	public void setShippingPhoneUb(String shippingPhoneUb) {
		this.shippingPhoneUb = shippingPhoneUb;
	}


	public String getDeliveryRequestUb() {
		return deliveryRequestUb;
	}


	public void setDeliveryRequestUb(String deliveryRequestUb) {
		this.deliveryRequestUb = deliveryRequestUb;
	}


	public Date getPayDateUb() {
		return payDateUb;
	}
	
	public Date getShipDate() {
		return payDateUb;
	}


	public void setPayDateUb(Date payDateUb) {
		this.payDateUb = payDateUb;
	}


	public int getTotalCostUb() {
		return totalCostUb;
	}


	public void setTotalCostUb(int totalCostUb) {
		this.totalCostUb = totalCostUb;
	}


	public String getPaymentMethodUb() {
		return paymentMethodUb;
	}


	public void setPaymentMethodUb(String paymentMethodUb) {
		this.paymentMethodUb = paymentMethodUb;
	}


	public int getTotalPayCostUb() {
		return totalPayCostUb;
	}


	public void setTotalPayCostUb(int totalPayCostUb) {
		this.totalPayCostUb = totalPayCostUb;
	}


	public int getDeliveryCostUb() {
		return deliveryCostUb;
	}


	public void setDeliveryCostUb(int deliveryCostUb) {
		this.deliveryCostUb = deliveryCostUb;
	}


	@Override
	public String toString() {
		return "UbookPayment [paymentNoUb=" + paymentNoUb + ", userIdUb=" + userIdUb + ", shippingNameUb="
				+ shippingNameUb + ", shippingPostCodeUb=" + shippingPostCodeUb + ", shippingAddressUb="
				+ shippingAddressUb + ", shippingAddressDetailUb=" + shippingAddressDetailUb + ", shippingPhoneUb="
				+ shippingPhoneUb + ", deliveryRequestUb=" + deliveryRequestUb + ", payDateUb=" + payDateUb
				+ ", totalCostUb=" + totalCostUb + ", paymentMethodUb=" + paymentMethodUb + ", totalPayCostUb="
				+ totalPayCostUb + ", deliveryCostUb=" + deliveryCostUb + "]";
	}




	
	
	
}
