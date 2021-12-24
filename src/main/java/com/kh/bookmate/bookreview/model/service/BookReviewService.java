package com.kh.bookmate.bookreview.model.service;

import java.util.List;

import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.bookreview.model.vo.BookReview;
import com.kh.bookmate.bookreview.model.vo.BookReviewReply;
import com.kh.bookmate.common.PageInfo;
import com.kh.bookmate.common.Paging;
import com.kh.bookmate.user.model.vo.User;

public interface BookReviewService {

	void insertReview(BookReview bookReview, Book book, User user);

	int selectTotalCount(String bookISBN);

	List<BookReview> selectReviewList(String bookISBN, Paging reviewPaging, int reviewKind);

	int insertIdCheck(List<String> list);

	List<BookReviewReply> selectReviewReply(int reviewNo);

	void updateReview(BookReview review);

	void insertReviewReply(BookReviewReply reviewReply);

	void deleteReply(BookReviewReply reviewReply);

	void updateReply(BookReviewReply reviewReply);

	void insertAnswer(BookReviewReply reviewReply);

	void deleteAnswer(BookReviewReply reviewReply);

	
	// 마이페이지 북 리뷰 리스트
	List<BookReview> selectReviewListMine(String selectReviewListMine, PageInfo pi);

}
