package com.kh.bookmate.bookreview.model.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class BookReviewReply {

	private int reviewReplyNo;
	private int reviewNo;
	private String reviewReplyWriter;
	private String reviewReplyContent;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reviewReplyDate;
	private int reviewReplyIndex;
	private int reviewReplyLevel;
	private int reviewReplyStatus;
	
	
	public BookReviewReply() {
		super();
		// TODO Auto-generated constructor stub
	}


	public BookReviewReply(int reviewReplyNo, int reviewNo, String reviewReplyWriter, String reviewReplyContent,
			Date reviewReplyDate, int reviewReplyIndex, int reviewReplyLevel, int reviewReplyStatus) {
		super();
		this.reviewReplyNo = reviewReplyNo;
		this.reviewNo = reviewNo;
		this.reviewReplyWriter = reviewReplyWriter;
		this.reviewReplyContent = reviewReplyContent;
		this.reviewReplyDate = reviewReplyDate;
		this.reviewReplyIndex = reviewReplyIndex;
		this.reviewReplyLevel = reviewReplyLevel;
		this.reviewReplyStatus = reviewReplyStatus;
	}


	public int getReviewReplyIndex() {
		return reviewReplyIndex;
	}


	public void setReviewReplyIndex(int reviewReplyIndex) {
		this.reviewReplyIndex = reviewReplyIndex;
	}


	public int getReviewReplyLevel() {
		return reviewReplyLevel;
	}


	public void setReviewReplyLevel(int reviewReplyLevel) {
		this.reviewReplyLevel = reviewReplyLevel;
	}


	public int getReviewReplyNo() {
		return reviewReplyNo;
	}

	public void setReviewReplyNo(int reviewReplyNo) {
		this.reviewReplyNo = reviewReplyNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewReplyWriter() {
		return reviewReplyWriter;
	}

	public void setReviewReplyWriter(String reviewReplyWriter) {
		this.reviewReplyWriter = reviewReplyWriter;
	}

	public String getReviewReplyContent() {
		return reviewReplyContent;
	}

	public void setReviewReplyContent(String reviewReplyContent) {
		this.reviewReplyContent = reviewReplyContent;
	}

	public Date getReviewReplyDate() {
		return reviewReplyDate;
	}

	public void setReviewReplyDate(Date reviewReplyDate) {
		this.reviewReplyDate = reviewReplyDate;
	}

	public int getReviewReplyStatus() {
		return reviewReplyStatus;
	}

	public void setReviewReplyStatus(int reviewReplyStatus) {
		this.reviewReplyStatus = reviewReplyStatus;
	}


	@Override
	public String toString() {
		return "BookReviewReply [reviewReplyNo=" + reviewReplyNo + ", reviewNo=" + reviewNo + ", reviewReplyWriter="
				+ reviewReplyWriter + ", reviewReplyContent=" + reviewReplyContent + ", reviewReplyDate="
				+ reviewReplyDate + ", reviewReplyIndex=" + reviewReplyIndex + ", reviewReplyLevel=" + reviewReplyLevel
				+ ", reviewReplyStatus=" + reviewReplyStatus + "]";
	}

	
	
	
	
}
