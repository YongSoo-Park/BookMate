package com.kh.bookmate.bookreview.model.vo;

public class BuyReview {
	
	private String user_Id;
	private String bookISBN;
	private int reviewStatus;
	public BuyReview() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BuyReview(String user_Id, String bookISBN, int reviewStatus) {
		super();
		this.user_Id = user_Id;
		this.bookISBN = bookISBN;
		this.reviewStatus = reviewStatus;
	}
	public String getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}
	public String getBookISBN() {
		return bookISBN;
	}
	public void setBookISBN(String bookISBN) {
		this.bookISBN = bookISBN;
	}
	public int getReviewStatus() {
		return reviewStatus;
	}
	public void setReviewStatus(int reviewStatus) {
		this.reviewStatus = reviewStatus;
	}
	@Override
	public String toString() {
		return "BuyReview [user_Id=" + user_Id + ", bookISBN=" + bookISBN + ", reviewStatus=" + reviewStatus + "]";
	}
	
	

}
