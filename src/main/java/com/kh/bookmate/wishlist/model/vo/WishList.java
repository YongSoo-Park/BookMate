package com.kh.bookmate.wishlist.model.vo;

public class WishList {

	private int wishListNo;
	private String user_Id;
	private String bookISBN;
	
	//미소 추가함 21-11-29 
	private String bookTitle;
	private String bookMainImg;
	private String bookWriter;
	
	
	public String getBookWriter() {
		return bookWriter;
	}

	public void setBookWriter(String bookWriter) {
		this.bookWriter = bookWriter;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public String getBookMainImg() {
		return bookMainImg;
	}

	public void setBookMainImg(String bookMainImg) {
		this.bookMainImg = bookMainImg;
	}


	public WishList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public WishList(int wishListNo, String user_Id, String bookISBN) {
		super();
		this.wishListNo = wishListNo;
		this.user_Id = user_Id;
		this.bookISBN = bookISBN;
	}

	public WishList(String user_Id, String bookISBN) {
		super();
		this.user_Id = user_Id;
		this.bookISBN = bookISBN;
	}

	public int getWishListNo() {
		return wishListNo;
	}

	public void setWishListNo(int wishListNo) {
		this.wishListNo = wishListNo;
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

	@Override
	public String toString() {
		return "WishListVo [wishListNo=" + wishListNo + ", user_Id=" + user_Id + ", bookISBN=" + bookISBN + "]";
	}
	
	
}
