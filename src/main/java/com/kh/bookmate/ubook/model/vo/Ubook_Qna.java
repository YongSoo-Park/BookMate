package com.kh.bookmate.ubook.model.vo;

import java.util.Date;

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
public class Ubook_Qna {
	private int qnaNo;	//문의 번호
	private int ubno;	//도서번호
	private int qnaGroupNo;	//그룹번호
	private int qnaGroupNoOrder;	//그룹내번호
	private String qnaWriter;	//작성자
	private String qnaContent;	//내용
	private Date createDate;	//생성일
	
	/*//셀러 추가
	private String sellerNickN;
	private int sellerNo;
	private String sellerId;

	private String userId;*/
}
