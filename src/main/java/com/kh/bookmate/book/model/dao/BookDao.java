package com.kh.bookmate.book.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.payment.model.vo.PaymentDetail;

@Repository
public class BookDao {

	public Book selectBook(SqlSession sqlSession, String bookISBN) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bookMapper.selectBook", bookISBN);
	}

	public int insertBook(SqlSession sqlSession, Book book) {
		// TODO Auto-generated method stub
		return sqlSession.insert("bookMapper.insertBook", book);
	}

	public List<Book> selectCategoryBookList(SqlSession sqlSession, int num) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bookMapper.selectCategoryBookList", num);
	}

	public int sellDateInsert(SqlSession sqlSession, Book book) {

		return sqlSession.insert("bookMapper.sellDateInsert", book);
	}

	public List<Book> selectBestBookList(SqlSession sqlSession, int bookSubCategory) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bookMapper.selectBestBookList", bookSubCategory);
	}

	public List<Book> selectNewBookList(SqlSession sqlSession, int bookSubCategory) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bookMapper.selectNewBookList", bookSubCategory);
	}

	public int selectAllBestRank(SqlSession sqlSession, String bookISBN) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bookMapper.selectAllBestRank", bookISBN);
	}

	public int selectCategoryBestRank(SqlSession sqlSession, Book book) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bookMapper.selectCategoryBestRank", book);
	}

	public int updateBookRating(SqlSessionTemplate sqlSession, Book book) {
		// TODO Auto-generated method stub
		return sqlSession.update("bookMapper.updateBookRating", book);
	}

	public void updateBookStock(SqlSessionTemplate sqlSession, PaymentDetail pd) {
		sqlSession.update("bookMapper.updateBookStock", pd);
	}

	// 화제의 신간
	public ArrayList<Book> selectHotTopicBook(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("bookMapper.selectHotTopicBook");

	}

	public int insertConfirmSellDate(SqlSessionTemplate sqlSession, List<Object> sell) {
		// TODO Auto-generated method stub
		return sqlSession.insert("bookMapper.insertConfirmSellDate", sell);
	}

	public int updateBookPlusStock(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("bookMapper.updateBookPlusStock", map);
	}

	public int updateBook(SqlSessionTemplate sqlSession, Book book) {
		// TODO Auto-generated method stub
		return sqlSession.update("bookMapper.updateBook", book);
	}

}
