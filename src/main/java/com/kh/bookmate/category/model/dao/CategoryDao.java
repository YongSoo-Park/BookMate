package com.kh.bookmate.category.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.book.model.vo.Book;

@Repository
public class CategoryDao {

	public int selectListCategoryCount(SqlSessionTemplate sqlSession, int category) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("categoryMapper.selectListCategoryCount",category);
	}

	public List<Book> selectListCategoryBest(SqlSessionTemplate sqlSession, int category, RowBounds rb) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("categoryMapper.selectListCategoryBest",category,rb);
	}

	public List<Book> selectListCategory(SqlSessionTemplate sqlSession, List<Object> list, RowBounds rb) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("categoryMapper.selectListCategory",list,rb);
	}

	public int selectListMainCategoryCount(SqlSessionTemplate sqlSession, int mainCategory) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("categoryMapper.selectListMainCategoryCount",mainCategory);
	}

	public List<Book> selectListMainCategoryBest(SqlSessionTemplate sqlSession, int mainCategory, RowBounds rb) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("categoryMapper.selectListMainCategoryBest",mainCategory,rb);
	}

	public List<Book> selectListMainCategory(SqlSessionTemplate sqlSession, List<Object> list, RowBounds rb) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("categoryMapper.selectListMainCategory",list,rb);
	}

}
