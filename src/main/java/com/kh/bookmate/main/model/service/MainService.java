package com.kh.bookmate.main.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.main.model.vo.RecentView;
import com.kh.bookmate.notice.model.vo.Notice;

public interface MainService {

	//베스트 도서 리스트
	List<Book> selectBestList();

	//오늘의 책 리스트
	List<Book> selectTodayList(int category_number);
	
	//최근본상품 insert -> userId가 있는 경우에만 되도록 해야함
	void insertRecentView(String bookISBN, String userId);

	//최근본상품 select -> isbn들 조회하기위해
	RecentView selectRecentView(String userId);

	//최근본상품 select -> 위에서 조회한 isbn들로 Book 리스트 조회
	List<Book> selectRecentViewList(ArrayList<String> isbnList);

	//이벤트 사진 리스트
	List<Notice> selectEventImg();
	
}
