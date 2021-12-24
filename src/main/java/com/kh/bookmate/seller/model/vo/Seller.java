package com.kh.bookmate.seller.model.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Seller {

	private int sellerNo;
	private String sellerId;
	private String sellerNickN;
	private String sellerEmail;
	private String sellerPhone;
	private String sellerDel;
	private int sellerDelP1;
	private int sellerDelP2;
	private String sellerAddress;
	private Date enrollDate;
	private Date modifyDate;
	private String status;
	
	private String userPwd;
}
