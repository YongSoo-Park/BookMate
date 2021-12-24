package com.kh.bookmate.ubook.model.vo;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
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
public class Ubook {
	private int ubookNo;
	private int bSellerNo;
	private String ubookName;
	private String ubookWriter;
	private String ubookIsbn;
	private int ubCategory;
	private String ubookTrans;
	private String ubookPub;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ubookPubDate;
	private int ubookOPrice;
	private int ubookPrice;
	private int ubookStock;
	private String ubookQual;
	private String ubookDetail;
	private String ubookContent;
	private String ubookImg;
	private String ubookStatus;
	
	//셀러 추가
	private String sellerNickN;
	private int sellerNo;
	private String sellerId;
	private String sellerDel;
}
