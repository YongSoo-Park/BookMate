package com.kh.bookmate.main.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.main.model.vo.RecentView;
import com.kh.bookmate.notice.model.vo.Notice;

@Repository
public class MainDao {

	public List<Book> selectBestList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mainMapper.selectBestList");
	}

	public List<Book> selectTodayList(SqlSessionTemplate sqlSession, int category_number) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mainMapper.selectTodayList", category_number);
	}
	
	//1-1.최근본상품 조회
	public RecentView selectRecentView(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mainMapper.selectRecentView", userId);
	}

	//1-2.최근본상품 insert
	public int insertRecentView(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("mainMapper.insertRecentView", map);
	}

	public int updateRecentView(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("mainMapper.updateRecentView", map);
	}

	public List<Book> selectRecentViewList(SqlSessionTemplate sqlSession, ArrayList<String> isbnList) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mainMapper.selectRecentViewList", isbnList);
	}

	public List<Notice> selectEventImg(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("mainMapper.selectEventImg");
	}

	

}
