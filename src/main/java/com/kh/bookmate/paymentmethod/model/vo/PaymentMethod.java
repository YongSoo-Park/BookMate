package com.kh.bookmate.paymentmethod.model.vo;

public class PaymentMethod {

	private String user_Id;
	private int mainPayment;
	public PaymentMethod() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PaymentMethod(String user_Id, int mainPayment) {
		super();
		this.user_Id = user_Id;
		this.mainPayment = mainPayment;
	}
	public String getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}
	public int getMainPayment() {
		return mainPayment;
	}
	public void setMainPayment(int mainPayment) {
		this.mainPayment = mainPayment;
	}
	@Override
	public String toString() {
		return "PaymentMethod [user_Id=" + user_Id + ", mainPayment=" + mainPayment + "]";
	}
	
	
	

	
}
