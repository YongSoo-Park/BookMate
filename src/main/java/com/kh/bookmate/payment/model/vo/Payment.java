package com.kh.bookmate.payment.model.vo;

import java.util.Date;

public class Payment {

	private int paymentNo;
	private String user_Id;
	private String shippingName;
	private String shippingPostCode;
	private String shippingAddress;
	private String shippingAddressDetail;
	private String shippingPhone;
	private String deliveryRequest;
	private Date payDate;
	private int usePoint;
	private int totalCost;
	private String paymentMethod;
	private int totalGetPoint;
	private int totalPayCost;
	private int deliveryCost;
	
	private int paymentDetailNo;
	private int getPoint;
	
	
	
	
	public int getGetPoint() {
		return getPoint;
	}

	public void setGetPoint(int getPoint) {
		this.getPoint = getPoint;
	}

	public int getPaymentDetailNo() {
		return paymentDetailNo;
	}

	public void setPaymentDetailNo(int paymentDetailNo) {
		this.paymentDetailNo = paymentDetailNo;
	}

	public Payment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Payment(int paymentNo, String user_Id, String shippingName, String shippingAddress, String shippingPhone,
			String deliveryRequest, Date payDate, int usePoint, int totalCost, String paymentMethod, int totalGetPoint) {
		super();
		this.paymentNo = paymentNo;
		this.user_Id = user_Id;
		this.shippingName = shippingName;
		this.shippingAddress = shippingAddress;
		this.shippingPhone = shippingPhone;
		this.deliveryRequest = deliveryRequest;
		this.payDate = payDate;
		this.usePoint = usePoint;
		this.totalCost = totalCost;
		this.paymentMethod = paymentMethod;
		this.totalGetPoint = totalGetPoint;
	}

	public Payment(String user_Id, String shippingName, String shippingAddress, String shippingPhone, int totalCost,
			String paymentMethod, int totalGetPoint) {
		super();
		this.user_Id = user_Id;
		this.shippingName = shippingName;
		this.shippingAddress = shippingAddress;
		this.shippingPhone = shippingPhone;
		this.totalCost = totalCost;
		this.paymentMethod = paymentMethod;
		this.totalGetPoint = totalGetPoint;
	}

	public Payment(String user_Id, String shippingName, String shippingAddress, String shippingPhone,
			int usePoint, int totalCost, String paymentMethod, int totalGetPoint) {
		super();
		this.user_Id = user_Id;
		this.shippingName = shippingName;
		this.shippingAddress = shippingAddress;
		this.shippingPhone = shippingPhone;
		this.usePoint = usePoint;
		this.totalCost = totalCost;
		this.paymentMethod = paymentMethod;
		this.totalGetPoint = totalGetPoint;
	}

	public Payment(String user_Id, String shippingName, String shippingAddress, String shippingPhone,
			String deliveryRequest, int totalCost, String paymentMethod, int totalGetPoint) {
		super();
		this.user_Id = user_Id;
		this.shippingName = shippingName;
		this.shippingAddress = shippingAddress;
		this.shippingPhone = shippingPhone;
		this.deliveryRequest = deliveryRequest;
		this.totalCost = totalCost;
		this.paymentMethod = paymentMethod;
		this.totalGetPoint = totalGetPoint;		
	}

	public Payment(String user_Id, String shippingName, String shippingAddress, String shippingPhone,
			String deliveryRequest, int usePoint, int totalCost, String paymentMethod, int totalGetPoint) {
		super();
		this.user_Id = user_Id;
		this.shippingName = shippingName;
		this.shippingAddress = shippingAddress;
		this.shippingPhone = shippingPhone;
		this.deliveryRequest = deliveryRequest;
		this.usePoint = usePoint;
		this.totalCost = totalCost;
		this.paymentMethod = paymentMethod;
		this.totalGetPoint = totalGetPoint;
	}
	
	

	public Payment(String user_Id, String shippingName, String shippingPostCode, String shippingAddress,
			String shippingAddressDetail, String shippingPhone, int totalCost, int totalGetPoint) {
		super();
		this.user_Id = user_Id;
		this.shippingName = shippingName;
		this.shippingPostCode = shippingPostCode;
		this.shippingAddress = shippingAddress;
		this.shippingAddressDetail = shippingAddressDetail;
		this.shippingPhone = shippingPhone;
		this.totalCost = totalCost;
		this.totalGetPoint = totalGetPoint;
	}

	public int getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public String getShippingName() {
		return shippingName;
	}

	public void setShippingName(String shippingName) {
		this.shippingName = shippingName;
	}

	public String getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	public String getShippingPhone() {
		return shippingPhone;
	}

	public void setShippingPhone(String shippingPhone) {
		this.shippingPhone = shippingPhone;
	}

	public String getDeliveryRequest() {
		return deliveryRequest;
	}

	public void setDeliveryRequest(String deliveryRequest) {
		this.deliveryRequest = deliveryRequest;
	}

	public Date getShipDate() {
		return payDate;
	}

	

	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}

	public int getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(int totalCost) {
		this.totalCost = totalCost;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	

	public String getShippingPostCode() {
		return shippingPostCode;
	}

	public void setShippingPostCode(String shippingPostCode) {
		this.shippingPostCode = shippingPostCode;
	}

	public String getShippingAddressDetail() {
		return shippingAddressDetail;
	}

	public void setShippingAddressDetail(String shippingAddressDetail) {
		this.shippingAddressDetail = shippingAddressDetail;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public int getTotalGetPoint() {
		return totalGetPoint;
	}

	public void setTotalGetPoint(int totalGetPoint) {
		this.totalGetPoint = totalGetPoint;
	}

	public int getUsePoint() {
		return usePoint;
	}

	
	public int getTotalPayCost() {
		return totalPayCost;
	}

	public void setTotalPayCost(int totalPayCost) {
		this.totalPayCost = totalPayCost;
	}

	
	public int getDeliveryCost() {
		return deliveryCost;
	}

	public void setDeliveryCost(int deliveryCost) {
		this.deliveryCost = deliveryCost;
	}

	@Override
	public String toString() {
		return "Payment [paymentNo=" + paymentNo + ", user_Id=" + user_Id + ", shippingName=" + shippingName
				+ ", shippingPostCode=" + shippingPostCode + ", shippingAddress=" + shippingAddress
				+ ", shippingAddressDetail=" + shippingAddressDetail + ", shippingPhone=" + shippingPhone
				+ ", deliveryRequest=" + deliveryRequest + ", payDate=" + payDate + ", usePoint=" + usePoint
				+ ", totalCost=" + totalCost + ", paymentMethod=" + paymentMethod + ", totalGetPoint=" + totalGetPoint
				+ ", totalPayCost=" + totalPayCost + ", deliveryCost=" + deliveryCost + "]";
	}

	
	

	
	
	
	
}
