package com.kh.bookmate.payment.model.vo;

import java.util.Date;
import java.util.List;

public class PaymentDetail {

	private int paymentDetailNo;
	private int paymentNo;
	private String bookISBN;
	private String bookMainImg;
	private String bookTitle;
	private int quantity;
	private int bookPrice;
	private int salePrice;
	private int getPoint;
	private Date deliveryDate;
	private int deliveryStatus;
	private String shippingName;//--추가 김미소 
	private int totalPayCost;//--추가 김미소 
	
	
	private List<PaymentDetail> PaymentDetailList;
	
	public int getTotalPayCost() {
		return totalPayCost;
	}

	public void setTotalPayCost(int totalPayCost) {
		this.totalPayCost = totalPayCost;
	}

	public PaymentDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PaymentDetail(int paymentDetailNo, int paymentNo, String bookISBN, String bookMainImg, String bookTitle,
			int quantity, int bookPrice, int salePrice, int getPoint, Date deliveryDate, int deliveryStatus) {
		super();
		this.paymentDetailNo = paymentDetailNo;
		this.paymentNo = paymentNo;
		this.bookISBN = bookISBN;
		this.bookMainImg = bookMainImg;
		this.bookTitle = bookTitle;
		this.quantity = quantity;
		this.bookPrice = bookPrice;
		this.salePrice = salePrice;
		this.getPoint = getPoint;
		this.deliveryDate = deliveryDate;
		this.deliveryStatus = deliveryStatus;
	}

	public String getShippingName() {
		return shippingName;
	}

	public void setShippingName(String shippingName) {
		this.shippingName = shippingName;
	}

	public PaymentDetail(int paymentNo, String bookISBN, String bookMainImg, String bookTitle, int quantity,
			int bookPrice, int salePrice, int getPoint) {
		super();
		this.paymentNo = paymentNo;
		this.bookISBN = bookISBN;
		this.bookMainImg = bookMainImg;
		this.bookTitle = bookTitle;
		this.quantity = quantity;
		this.bookPrice = bookPrice;
		this.salePrice = salePrice;
		this.getPoint = getPoint;
	}

	
	
	
	public PaymentDetail(String bookISBN, String bookMainImg, String bookTitle, int quantity, int bookPrice,
			int salePrice, int getPoint) {
		super();
		this.bookISBN = bookISBN;
		this.bookMainImg = bookMainImg;
		this.bookTitle = bookTitle;
		this.quantity = quantity;
		this.bookPrice = bookPrice;
		this.salePrice = salePrice;
		this.getPoint = getPoint;
	}

	
	public int getPaymentDetailNo() {
		return paymentDetailNo;
	}

	public void setPaymentDetailNo(int paymentDetailNo) {
		this.paymentDetailNo = paymentDetailNo;
	}

	public int getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}

	public List<PaymentDetail> getPaymentDetailList() {
		return PaymentDetailList;
	}

	public void setPaymentDetailList(List<PaymentDetail> paymentDetailList) {
		PaymentDetailList = paymentDetailList;
	}

	public String getBookISBN() {
		return bookISBN;
	}

	public void setBookISBN(String bookISBN) {
		this.bookISBN = bookISBN;
	}

	public String getBookMainImg() {
		return bookMainImg;
	}

	public void setBookMainImg(String bookMainImg) {
		this.bookMainImg = bookMainImg;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getBookPrice() {
		return bookPrice;
	}

	public void setBookPrice(int bookPrice) {
		this.bookPrice = bookPrice;
	}

	public int getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

	public int getGetPoint() {
		return getPoint;
	}

	public void setGetPoint(int getPoint) {
		this.getPoint = getPoint;
	}

	public Date getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public int getDeliveryStatus() {
		return deliveryStatus;
	}

	public void setDeliveryStatus(int deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}

	public PaymentDetail(int paymentDetailNo, int paymentNo, String bookISBN, String bookMainImg, String bookTitle,
			int quantity, int bookPrice, int salePrice, int getPoint, Date deliveryDate, int deliveryStatus,
			List<PaymentDetail> paymentDetailList) {
		super();
		this.paymentDetailNo = paymentDetailNo;
		this.paymentNo = paymentNo;
		this.bookISBN = bookISBN;
		this.bookMainImg = bookMainImg;
		this.bookTitle = bookTitle;
		this.quantity = quantity;
		this.bookPrice = bookPrice;
		this.salePrice = salePrice;
		this.getPoint = getPoint;
		this.deliveryDate = deliveryDate;
		this.deliveryStatus = deliveryStatus;
		PaymentDetailList = paymentDetailList;
	}

	@Override
	public String toString() {
		return "PaymentDetail [paymentDetailNo=" + paymentDetailNo + ", paymentNo=" + paymentNo + ", bookISBN="
				+ bookISBN + ", bookMainImg=" + bookMainImg + ", bookTitle=" + bookTitle + ", quantity=" + quantity
				+ ", bookPrice=" + bookPrice + ", salePrice=" + salePrice + ", getPoint=" + getPoint + ", deliveryDate="
				+ deliveryDate + ", deliveryStatus=" + deliveryStatus 
				+ "]";
	}

	
	
	
}
