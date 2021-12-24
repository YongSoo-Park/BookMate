package com.kh.bookmate.bookreview.model.vo;

import java.util.Date;

public class BookReviewAnswer {

	private int reviewAnswerNo;
	private int reviewReplyNo;
	private String reviewAnswerContent;
	private Date reviewAnswerDate;
	private int reviewAnswerStatus;
	
	public BookReviewAnswer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BookReviewAnswer(int reviewAnswerNo, int reviewReplyNo, String reviewAnswerContent, Date reviewAnswerDate,
			int reviewAnswerStatus) {
		super();
		this.reviewAnswerNo = reviewAnswerNo;
		this.reviewReplyNo = reviewReplyNo;
		this.reviewAnswerContent = reviewAnswerContent;
		this.reviewAnswerDate = reviewAnswerDate;
		this.reviewAnswerStatus = reviewAnswerStatus;
	}

	public BookReviewAnswer(int reviewReplyNo, String reviewAnswerContent) {
		super();
		this.reviewReplyNo = reviewReplyNo;
		this.reviewAnswerContent = reviewAnswerContent;
	}

	public int getReviewAnswerNo() {
		return reviewAnswerNo;
	}

	public void setReviewAnswerNo(int reviewAnswerNo) {
		this.reviewAnswerNo = reviewAnswerNo;
	}

	public int getReviewReplyNo() {
		return reviewReplyNo;
	}

	public void setReviewReplyNo(int reviewReplyNo) {
		this.reviewReplyNo = reviewReplyNo;
	}

	public String getReviewAnswerContent() {
		return reviewAnswerContent;
	}

	public void setReviewAnswerContent(String reviewAnswerContent) {
		this.reviewAnswerContent = reviewAnswerContent;
	}

	public Date getReviewAnswerDate() {
		return reviewAnswerDate;
	}

	public void setReviewAnswerDate(Date reviewAnswerDate) {
		this.reviewAnswerDate = reviewAnswerDate;
	}

	public int getReviewAnswerStatus() {
		return reviewAnswerStatus;
	}

	public void setReviewAnswerStatus(int reviewAnswerStatus) {
		this.reviewAnswerStatus = reviewAnswerStatus;
	}

	@Override
	public String toString() {
		return "BookReviewAnswerVo [reviewAnswerNo=" + reviewAnswerNo + ", reviewReplyNo=" + reviewReplyNo
				+ ", reviewAnswerContent=" + reviewAnswerContent + ", reviewAnswerDate=" + reviewAnswerDate
				+ ", reviewAnswerStatus=" + reviewAnswerStatus + "]";
	}
	
	
}
