package com.kh.bookmate.book.model.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Book {

	private String bookISBN;
	private String bookMainImg;
	private String bookTitle;
	private String bookSubTitle;
	private String bookWriter;
	private String bookTranslator;
	private int bookCategory;
	private int bookSubCategory;
	private String bookPublisher;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date bookPublisheDate;
	private int bookPrice;
	private String bookContents;
	private String bookIntro;
	private String bookDetailImg;
	private int bookStock;
	private int bookStatus;
	private int allBestRank;
	private int categoryBestRank;
	private Double bookRating;
	private int bookRatingCount;
	private int bookReviewCount;

	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Book(String bookISBN, String bookMainImg, String bookTitle, String bookSubTitle, String bookWriter,
			String bookTranslator, int bookCategory, int bookSubCategory, String bookPublisher, Date bookPublisheDate,
			int bookPrice, String bookContents, String bookIntro, String bookDetailImg, int bookStock, int bookStatud,
			int allBestRank, int categoryBestRank, Double bookRating, int bookRatingCount, int bookReviewCount) {
		super();
		this.bookISBN = bookISBN;
		this.bookMainImg = bookMainImg;
		this.bookTitle = bookTitle;
		this.bookSubTitle = bookSubTitle;
		this.bookWriter = bookWriter;
		this.bookTranslator = bookTranslator;
		this.bookCategory = bookCategory;
		this.bookSubCategory = bookSubCategory;
		this.bookPublisher = bookPublisher;
		this.bookPublisheDate = bookPublisheDate;
		this.bookPrice = bookPrice;
		this.bookContents = bookContents;
		this.bookIntro = bookIntro;
		this.bookDetailImg = bookDetailImg;
		this.bookStock = bookStock;
		this.bookStatus = bookStatud;
		this.allBestRank = allBestRank;
		this.categoryBestRank = categoryBestRank;
		this.bookRating = bookRating;
		this.bookRatingCount = bookRatingCount;
		this.bookReviewCount = bookReviewCount;
	}

	public Book(String bookISBN, String bookMainImg, String bookTitle, String bookSubTitle, String bookWriter,
			String bookTranslator, int bookCategory, int bookSubCategory, String bookPublisher, Date bookPublisheDate,
			int bookPrice, String bookContents, String bookIntro, String bookDetailImg, int bookStock) {
		super();
		this.bookISBN = bookISBN;
		this.bookMainImg = bookMainImg;
		this.bookTitle = bookTitle;
		this.bookSubTitle = bookSubTitle;
		this.bookWriter = bookWriter;
		this.bookTranslator = bookTranslator;
		this.bookCategory = bookCategory;
		this.bookSubCategory = bookSubCategory;
		this.bookPublisher = bookPublisher;
		this.bookPublisheDate = bookPublisheDate;
		this.bookPrice = bookPrice;
		this.bookContents = bookContents;
		this.bookIntro = bookIntro;
		this.bookDetailImg = bookDetailImg;
		this.bookStock = bookStock;
	}

	public String getBookISBN() {
		return bookISBN;
	}

	public void setBookISBN(String bookISBN) {
		this.bookISBN = bookISBN;
	}

	public String getBookMainImg() {
		return bookMainImg;
	}

	public void setBookMainImg(String bookMainImg) {
		this.bookMainImg = bookMainImg;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public String getBookSubTitle() {
		return bookSubTitle;
	}

	public void setBookSubTitle(String bookSubTitle) {
		this.bookSubTitle = bookSubTitle;
	}

	public String getBookWriter() {
		return bookWriter;
	}

	public void setBookWriter(String bookWriter) {
		this.bookWriter = bookWriter;
	}

	public String getBookTranslator() {
		return bookTranslator;
	}

	public void setBookTranslator(String bookTranslator) {
		this.bookTranslator = bookTranslator;
	}

	public int getBookCategory() {
		return bookCategory;
	}

	public void setBookCategory(int bookCategory) {
		this.bookCategory = bookCategory;
	}

	public int getBookSubCategory() {
		return bookSubCategory;
	}

	public void setBookSubCategory(int bookSubCategory) {
		this.bookSubCategory = bookSubCategory;
	}

	public String getBookPublisher() {
		return bookPublisher;
	}

	public void setBookPublisher(String bookPublisher) {
		this.bookPublisher = bookPublisher;
	}

	public Date getBookPublicheDate() {
		return bookPublisheDate;
	}

	public void setBookPublicheDate(Date bookPublisheDate) {
		this.bookPublisheDate = bookPublisheDate;
	}

	public int getBookPrice() {
		return bookPrice;
	}

	public void setBookPrice(int bookPrice) {
		this.bookPrice = bookPrice;
	}

	public String getBookContents() {
		return bookContents;
	}

	public void setBookContents(String bookContents) {
		this.bookContents = bookContents;
	}

	public String getBookIntro() {
		return bookIntro;
	}

	public void setBookIntro(String bookIntro) {
		this.bookIntro = bookIntro;
	}

	public String getBookDetailImg() {
		return bookDetailImg;
	}

	public void setBookDetailImg(String bookDetailImg) {
		this.bookDetailImg = bookDetailImg;
	}

	public int getBookStock() {
		return bookStock;
	}

	public void setBookStock(int bookStock) {
		this.bookStock = bookStock;
	}

	public int getBookStatud() {
		return bookStatus;
	}

	public void setBookStatud(int bookStatud) {
		this.bookStatus = bookStatud;
	}

	public Double getBookRating() {
		return bookRating;
	}

	public void setBookRating(Double bookRating) {
		this.bookRating = bookRating;
	}

	public int getBookRatingCount() {
		return bookRatingCount;
	}

	public void setBookRatingCount(int bookRatingCount) {
		this.bookRatingCount = bookRatingCount;
	}

	public int getBookReviewCount() {
		return bookReviewCount;
	}

	public void setBookReviewCount(int bookReviewCount) {
		this.bookReviewCount = bookReviewCount;
	}

	public Date getBookPublisheDate() {
		return bookPublisheDate;
	}

	public void setBookPublisheDate(Date bookPublisheDate) {
		this.bookPublisheDate = bookPublisheDate;
	}

	public int getAllBestRank() {
		return allBestRank;
	}

	public void setAllBestRank(int allBestRank) {
		this.allBestRank = allBestRank;
	}

	public int getCategoryBestRank() {
		return categoryBestRank;
	}

	public void setCategoryBestRank(int categoryBestRank) {
		this.categoryBestRank = categoryBestRank;
	}

	@Override
	public String toString() {
		return "Book [bookISBN=" + bookISBN + ", bookMainImg=" + bookMainImg + ", bookTitle=" + bookTitle
				+ ", bookSubTitle=" + bookSubTitle + ", bookWriter=" + bookWriter + ", bookTranslator=" + bookTranslator
				+ ", bookCategory=" + bookCategory + ", bookSubCategory=" + bookSubCategory + ", bookPublisher="
				+ bookPublisher + ", bookPublisheDate=" + bookPublisheDate + ", bookPrice=" + bookPrice
				+ ", bookContents=" + bookContents + ", bookIntro=" + bookIntro + ", bookDetailImg=" + bookDetailImg
				+ ", bookStock=" + bookStock + ", bookStatud=" + bookStatus + ", allBestRank=" + allBestRank
				+ ", categoryBestRank=" + categoryBestRank + ", bookRating=" + bookRating + ", bookRatingCount="
				+ bookRatingCount + ", bookReviewCount=" + bookReviewCount + "]";
	}
	
	

	

}
