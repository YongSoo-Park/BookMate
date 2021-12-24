package com.kh.bookmate.category.model.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.category.model.dao.CategoryDao;
import com.kh.bookmate.common.Paging;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private CategoryDao categoryDao;

	@Override
	public int selectListCategoryCount(int category) {
		// TODO Auto-generated method stub
		return categoryDao.selectListCategoryCount(sqlSession, category);
	}

	@Override
	public List<Book> selectListCategory(int category, Paging categoryPaging, int categoryKind) {

		RowBounds rb = new RowBounds(categoryPaging.getStart() - 1, categoryPaging.getCntPerPage());

		if (categoryKind == 2) {
			return categoryDao.selectListCategoryBest(sqlSession, category, rb);
		} else {
			List<Object> list = new ArrayList<Object>();
			list.add(category);
			list.add(categoryKind);
			return categoryDao.selectListCategory(sqlSession, list, rb);
		}
	}

	@Override
	public int selectListMainCategoryCount(int mainCategory) {
		// TODO Auto-generated method stub
		return categoryDao.selectListMainCategoryCount(sqlSession, mainCategory);
	}

	@Override
	public List<Book> selectListMainCategory(int mainCategory, Paging categoryPaging, int categoryKind) {

		RowBounds rb = new RowBounds(categoryPaging.getStart() - 1, categoryPaging.getCntPerPage());

		if (categoryKind == 2) {
			return categoryDao.selectListMainCategoryBest(sqlSession, mainCategory, rb);
		} else {
			List<Object> list = new ArrayList<Object>();
			list.add(mainCategory);
			list.add(categoryKind);
			return categoryDao.selectListMainCategory(sqlSession, list, rb);
		}
	}

}
