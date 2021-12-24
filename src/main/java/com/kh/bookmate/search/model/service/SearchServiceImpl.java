package com.kh.bookmate.search.model.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.common.Paging;
import com.kh.bookmate.search.model.dao.SearchDao;

@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SearchDao searchDao;

	@Override
	public int selectListKeywordCount(String keyword) {
		// TODO Auto-generated method stub
		return searchDao.selectListKeywordCount(sqlSession,keyword);
	}

	@Override
	public List<Book> selectListSearchKeyword(String keyword, Paging searchPaging, int searchKind) {
		RowBounds rb = new RowBounds(searchPaging.getStart()-1, searchPaging.getCntPerPage());
		
		if(searchKind==2) {
			return searchDao.selectListSearchBest(sqlSession,keyword,rb);
		}else {
			List<Object> list=new ArrayList<Object>();
			list.add(keyword);
			list.add(searchKind);
			return searchDao.selectListSearchKeyword(sqlSession, list , rb);
		}
		
		
		
	}

}
