package com.kh.bookmate.book.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.ubook.model.vo.Ubook;
import com.kh.bookmate.user.model.vo.User;

public interface BookService {


	Book selectBook(String bookISBN);

	void insertBook(Book book);


	List<Book> selectCategoryBookList(int i);

	void sellDateInsert(List<Book> bookList);

	List<Book> selectBestBookList(int bookSubCategory);

	List<Book> selectNewBookList(int bookSubCategory);

	int selectAllBestRank(String bookISBN);

	int selectCategoryBestRank(Book book);

	Book selectCheckISBN(String bookISBN);

	//화제의 신간
	ArrayList<Book> selectHotTopicBook();

	void insertRecentView(String userId, String bookISBN);

	Book selectBookStock(String bookISBN);

	void updateBookPlusStock(Map<String, Object> map);

	void updateBook(Book book, Book temp, int imgDeleteCheck, String directoryPath);

}
