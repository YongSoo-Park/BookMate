package com.kh.bookmate.returnBook.model.vo;

import java.util.List;

import com.kh.bookmate.payment.model.vo.PaymentDetail;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ReturnBook {
	
	private int returnNo;
	private String user_Id;
	private int paymentDetailNo;
	private String returnName;
	private int returnReason; 
	private int returnPoint;
	private String returnPaymentMethod;
	private int returnDeliveryPrice;
	private int returnTotalPrice;
	private int returnStatus;
	
	private int bookPrice; //추가 

	
}
