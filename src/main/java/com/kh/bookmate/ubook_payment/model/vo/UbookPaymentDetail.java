package com.kh.bookmate.ubook_payment.model.vo;

import java.util.Date;
import java.util.List;

import com.kh.bookmate.payment.model.vo.PaymentDetail;

public class UbookPaymentDetail {

	private int paymentDetailNoUb;
	private int paymentNoUb;
	private int ubookNoUb;
	private int bSellerNo;
	private String ubookImgUb;
	private String ubookNameUb;
	private int quantityUb;
	private int ubookOPriceUb;
	private int ubookPriceUb;
	private Date deliveryDateUb;
	//private int deliveryStatusUb;
	private String deliveryStatusUb;
	
	private List<UbookPaymentDetail> UbookPaymentDetailList;
	
	public UbookPaymentDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getPaymentDetailNoUb() {
		return paymentDetailNoUb;
	}

	public void setPaymentDetailNoUb(int paymentDetailNoUb) {
		this.paymentDetailNoUb = paymentDetailNoUb;
	}

	public int getPaymentNoUb() {
		return paymentNoUb;
	}

	public void setPaymentNoUb(int paymentNoUb) {
		this.paymentNoUb = paymentNoUb;
	}

	public int getUbookNoUb() {
		return ubookNoUb;
	}

	public void setUbookNoUb(int ubookNoUb) {
		this.ubookNoUb = ubookNoUb;
	}

	public int getBSellerNo() {
		return bSellerNo;
	}

	public void setBSellerNo(int bSellerNo) {
		this.bSellerNo = bSellerNo;
	}

	public String getUbookImgUb() {
		return ubookImgUb;
	}

	public void setUbookImgUb(String ubookImgUb) {
		this.ubookImgUb = ubookImgUb;
	}

	public String getUbookNameUb() {
		return ubookNameUb;
	}

	public void setUbookNameUb(String ubookNameUb) {
		this.ubookNameUb = ubookNameUb;
	}

	public int getQuantityUb() {
		return quantityUb;
	}

	public void setQuantityUb(int quantityUb) {
		this.quantityUb = quantityUb;
	}

	public int getUbookOPriceUb() {
		return ubookOPriceUb;
	}

	public void setUbookOPriceUb(int ubookOPriceUb) {
		this.ubookOPriceUb = ubookOPriceUb;
	}

	public int getUbookPriceUb() {
		return ubookPriceUb;
	}

	public void setUbookPriceUb(int ubookPriceUb) {
		this.ubookPriceUb = ubookPriceUb;
	}

	public Date getDeliveryDateUb() {
		return deliveryDateUb;
	}

	public void setDeliveryDateUb(Date deliveryDateUb) {
		this.deliveryDateUb = deliveryDateUb;
	}

	public String getDeliveryStatusUb() {
		return deliveryStatusUb;
	}

	public void setDeliveryStatusUb(String deliveryStatusUb) {
		this.deliveryStatusUb = deliveryStatusUb;
	}

	public List<UbookPaymentDetail> getUbookPaymentDetailList() {
		return UbookPaymentDetailList;
	}

	public void setUbookPaymentDetailList(List<UbookPaymentDetail> ubookPaymentDetailList) {
		UbookPaymentDetailList = ubookPaymentDetailList;
	}

	public UbookPaymentDetail(int paymentDetailNoUb, int paymentNoUb, int ubookNoUb, int bSellerNo, String ubookImgUb,
			String ubookNameUb, int quantityUb, int ubookOPriceUb, int ubookPriceUb, Date deliveryDateUb,
			String deliveryStatusUb, List<UbookPaymentDetail> ubookPaymentDetailList) {
		super();
		this.paymentDetailNoUb = paymentDetailNoUb;
		this.paymentNoUb = paymentNoUb;
		this.ubookNoUb = ubookNoUb;
		this.bSellerNo = bSellerNo;
		this.ubookImgUb = ubookImgUb;
		this.ubookNameUb = ubookNameUb;
		this.quantityUb = quantityUb;
		this.ubookOPriceUb = ubookOPriceUb;
		this.ubookPriceUb = ubookPriceUb;
		this.deliveryDateUb = deliveryDateUb;
		this.deliveryStatusUb = deliveryStatusUb;
		UbookPaymentDetailList = ubookPaymentDetailList;
	}

	public UbookPaymentDetail(int paymentDetailNoUb, int paymentNoUb, int ubookNoUb, int bSellerNo, String ubookImgUb,
			String ubookNameUb, int quantityUb, int ubookOPriceUb, int ubookPriceUb, Date deliveryDateUb,
			String deliveryStatusUb) {
		super();
		this.paymentDetailNoUb = paymentDetailNoUb;
		this.paymentNoUb = paymentNoUb;
		this.ubookNoUb = ubookNoUb;
		this.bSellerNo = bSellerNo;
		this.ubookImgUb = ubookImgUb;
		this.ubookNameUb = ubookNameUb;
		this.quantityUb = quantityUb;
		this.ubookOPriceUb = ubookOPriceUb;
		this.ubookPriceUb = ubookPriceUb;
		this.deliveryDateUb = deliveryDateUb;
		this.deliveryStatusUb = deliveryStatusUb;
	}

	public UbookPaymentDetail(int paymentNoUb, int ubookNoUb, int bSellerNo, String ubookImgUb, String ubookNameUb,
			int quantityUb, int ubookOPriceUb, int ubookPriceUb) {
		super();
		this.paymentNoUb = paymentNoUb;
		this.ubookNoUb = ubookNoUb;
		this.bSellerNo = bSellerNo;
		this.ubookImgUb = ubookImgUb;
		this.ubookNameUb = ubookNameUb;
		this.quantityUb = quantityUb;
		this.ubookOPriceUb = ubookOPriceUb;
		this.ubookPriceUb = ubookPriceUb;
	}

	public UbookPaymentDetail(int ubookNoUb, int bSellerNo, String ubookImgUb, String ubookNameUb, int quantityUb,
			int ubookOPriceUb, int ubookPriceUb) {
		super();
		this.ubookNoUb = ubookNoUb;
		this.bSellerNo = bSellerNo;
		this.ubookImgUb = ubookImgUb;
		this.ubookNameUb = ubookNameUb;
		this.quantityUb = quantityUb;
		this.ubookOPriceUb = ubookOPriceUb;
		this.ubookPriceUb = ubookPriceUb;
	}

	@Override
	public String toString() {
		return "UbookPaymentDetail [paymentDetailNoUb=" + paymentDetailNoUb + ", paymentNoUb=" + paymentNoUb
				+ ", ubookNoUb=" + ubookNoUb + ", bSellerNo=" + bSellerNo + ", ubookImgUb=" + ubookImgUb
				+ ", ubookNameUb=" + ubookNameUb + ", quantityUb=" + quantityUb + ", ubookOPriceUb=" + ubookOPriceUb
				+ ", ubookPriceUb=" + ubookPriceUb + ", deliveryDateUb=" + deliveryDateUb + ", deliveryStatusUb="
				+ deliveryStatusUb + ", UbookPaymentDetailList=" + UbookPaymentDetailList + "]";
	}


	
	
	
}
