package com.kh.bookmate.bookqna.model.vo;

import java.util.Date;

public class BookQnaAnswer {

	private int qnaAnswerNo;
	private int qnaNo;
	private String qnaAnswerContent;
	private Date qnaAnswerDate;
	
	public BookQnaAnswer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookQnaAnswer(int qnaAnswerNo, int qnaNo, String qnaAnswerContent, Date qnaAnswerDate) {
		super();
		this.qnaAnswerNo = qnaAnswerNo;
		this.qnaNo = qnaNo;
		this.qnaAnswerContent = qnaAnswerContent;
		this.qnaAnswerDate = qnaAnswerDate;
	}
	public BookQnaAnswer(int qnaNo, String qnaAnswerContent) {
		super();
		this.qnaNo = qnaNo;
		this.qnaAnswerContent = qnaAnswerContent;
	}
	public int getQnaAnswerNo() {
		return qnaAnswerNo;
	}
	public void setQnaAnswerNo(int qnaAnswerNo) {
		this.qnaAnswerNo = qnaAnswerNo;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQnaAnswerContent() {
		return qnaAnswerContent;
	}
	public void setQnaAnswerContent(String qnaAnswerContent) {
		this.qnaAnswerContent = qnaAnswerContent;
	}
	public Date getQnaAnswerDate() {
		return qnaAnswerDate;
	}
	public void setQnaAnswerDate(Date qnaAnswerDate) {
		this.qnaAnswerDate = qnaAnswerDate;
	}
	@Override
	public String toString() {
		return "BookQnaAnswerVo [qnaAnswerNo=" + qnaAnswerNo + ", qnaNo=" + qnaNo + ", qnaAnswerContent="
				+ qnaAnswerContent + ", qnaAnswerDate=" + qnaAnswerDate + "]";
	}
	
	
	
}
