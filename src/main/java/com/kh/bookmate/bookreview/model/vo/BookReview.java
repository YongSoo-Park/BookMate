package com.kh.bookmate.bookreview.model.vo;

import java.util.Date;

public class BookReview {

	private int reviewNo;
	private String bookISBN;
	private int bookRating;
	private String reviewTitle;
	private String reviewWriter;
	private String reviewContent;
	private Date reviewDate;	
	private int reviewStatus;
	private int reviewReplyCount;
	
	private String user_Id;// 미소 추가 21-11-27
	
	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public BookReview() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BookReview(int reviewNo, String bookISBN, int bookRating, String reviewTitle, String reviewWriter,
			String reviewContent, Date reviewDate, int reviewStatus) {
		super();
		this.reviewNo = reviewNo;
		this.bookISBN = bookISBN;
		this.bookRating = bookRating;
		this.reviewTitle = reviewTitle;
		this.reviewWriter = reviewWriter;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
		this.reviewStatus = reviewStatus;
	}

	public BookReview(String bookISBN, int bookRating, String reviewTitle, String reviewWriter,
			String reviewContent) {
		super();
		this.bookISBN = bookISBN;
		this.bookRating = bookRating;
		this.reviewTitle = reviewTitle;
		this.reviewWriter = reviewWriter;
		this.reviewContent = reviewContent;
	}
	
	

	public int getReviewReplyCount() {
		return reviewReplyCount;
	}

	public void setReviewReplyCount(int reviewReplyCount) {
		this.reviewReplyCount = reviewReplyCount;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getBookISBN() {
		return bookISBN;
	}

	public void setBookISBN(String bookISBN) {
		this.bookISBN = bookISBN;
	}

	public int getBookRating() {
		return bookRating;
	}

	public void setBookRating(int bookRating) {
		this.bookRating = bookRating;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewWriter() {
		return reviewWriter;
	}

	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public int getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(int reviewStatus) {
		this.reviewStatus = reviewStatus;
	}

	@Override
	public String toString() {
		return "BookReview [reviewNo=" + reviewNo + ", bookISBN=" + bookISBN + ", bookRating=" + bookRating
				+ ", reviewTitle=" + reviewTitle + ", reviewWriter=" + reviewWriter + ", reviewContent=" + reviewContent
				+ ", reviewDate=" + reviewDate + ", reviewStatus=" + reviewStatus + ", reviewReplyCount="
				+ reviewReplyCount + "]";
	}

	
	
	
	
}
