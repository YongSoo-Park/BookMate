package com.kh.bookmate.ubook.model.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.book.model.dao.BookDao;
import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.ubook.model.dao.UbookDao;
import com.kh.bookmate.ubook.model.vo.PageInfo;
import com.kh.bookmate.ubook.model.vo.Ubook;
import com.kh.bookmate.ubook.model.vo.Ubook_Qna;

@Service
public class UbookServiceImpl implements UbookService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private UbookDao ubookDao;
	
	@Override
	public void insertUbook(Ubook ubook) {
		int reulst = ubookDao.insertUbook(sqlSession,ubook);
		
		if(reulst < 0 ) {
			throw new RuntimeException("중고 도서 등록 오류 발생");
						
		}
	}
/*
	@Override
	public Ubook selectUbook(int ubookNo) {		
		Ubook u = null;
		u = ubookDao.selectUbook(sqlSession, ubookNo);
		return u;
		
	}

	/*
	 * @Override public List<Ubook> selectbookList() { return
	 * ubookDao.selectbookList(sqlSession); }
	 */

	@Override
	public List<Ubook> selectbookList(int sellerNo) {
		return ubookDao.selectbookList(sqlSession, sellerNo);
	}

	@Override
	public int deleteMyUbook(int ubookNo) {
		return ubookDao.deleteMyUbook(sqlSession, ubookNo);
		
	}
	
	@Override
	public int ubookUpdate(Ubook ubook) {
		return ubookDao.ubookUpdate(sqlSession, ubook);
	}
/*
	@Override
	public List<Ubook> ubookCateList1() {
		return ubookDao.ubookCateList1(sqlSession);
	}

	@Override
	public List<Ubook> selectCategory(int ubCategory) {
		return ubookDao.selectCategory(sqlSession, ubCategory);
	}
*/
	@Override
	public Ubook selectUbook(Ubook ub) {
		Ubook u = null;
		u = ubookDao.selectUbook(sqlSession, ub);
		return u;
	}

	@Override
	public Ubook selectUpdateUbook(int ubookNo) {
		return ubookDao.selectUpdateUbook(sqlSession, ubookNo);
	}

	@Override
	public int insertQna(Ubook_Qna qna) {
		int result = ubookDao.insertQna(sqlSession, qna);
		
		if(result < 0) {
			System.out.println("insertQna 실패");
		}
		return result;
	}

	@Override
	public ArrayList<Ubook_Qna> selectQnaList(int ubookNo) {
		return ubookDao.selectQnaList(sqlSession, ubookNo);
	}

	@Override
	public int insertAnswer(Ubook_Qna qna2) {
		int result = ubookDao.insertAnswer(sqlSession, qna2);
		
		if(result < 0) {
			System.out.println("insertAnswer 실패");
		}
		return result;
	}

	@Override
	public List<Ubook> sellerBookList(Ubook sellerBook) {
		return ubookDao.sellerBookList(sqlSession, sellerBook);
	}

	@Override
	public ArrayList<Ubook> selectRandomBookList() {
		return ubookDao.selectRandomBookList(sqlSession);
	}

	@Override
	public List<Ubook> searchUbookList(String keyword) {
		return ubookDao.searchUbookList(sqlSession, keyword);
	}

	@Override
	public List<Ubook> haveQnaUbook(int sellerNumber) {
		return ubookDao.haveQnaUbook(sqlSession, sellerNumber);
	}

	@Override
	public ArrayList<Ubook> selectRowPriceBookList() {
		return ubookDao.selectRowPriceBookList(sqlSession);
	}

	@Override
	public int selectListCount(int ubCategory) {
		return ubookDao.selectListCount(sqlSession,ubCategory);
	}

	@Override
	public List<Ubook> selectCategory(int ubCategory, PageInfo pi) {
		return ubookDao.selectCategory(sqlSession,ubCategory, pi);
	}

	@Override
	public int deleteQna(int qnaNo) {
		return ubookDao.deleteQna(sqlSession, qnaNo);
	}

	
	/*@Override
	public List<Ubook> selectbookList(String userId) {
		return ubookDao.selectbookList(sqlSession,userId);
	}*/
	

}
