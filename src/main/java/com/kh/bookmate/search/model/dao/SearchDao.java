package com.kh.bookmate.search.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.book.model.vo.Book;

@Repository
public class SearchDao {

	public int selectListKeywordCount(SqlSessionTemplate sqlSession, String keyword) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("searchMapper.selectListKeywordCount",keyword);
	}

	public List<Book> selectListSearchKeyword(SqlSessionTemplate sqlSession, List<Object> list, RowBounds rb) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("searchMapper.selectListSearchKeyword",list,rb);
	}

	public List<Book> selectListSearchBest(SqlSessionTemplate sqlSession, String keyword, RowBounds rb) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("searchMapper.selectListSearchBest",keyword,rb);
	}

}
