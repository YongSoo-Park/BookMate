package com.kh.bookmate.exchange_item.model.vo;

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
public class ExchangeItem {
	
	//교환은 책에 이상이 있을 때만 가능함 
	
	private int exchangeNo;
	private int paymentDetailNo;
	private String user_Id;
	private int exchangeStatus;
	private String exchangeName;
	private String exchangePhone;
	private String exchangeAddress;
//	private String exchangeShippingPostCode;
//	private String exchangeShippingAddressDetail;
	
	

}
