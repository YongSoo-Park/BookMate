package com.kh.bookmate.search.model.service;

import java.util.List;

import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.common.Paging;

public interface SearchService {

	int selectListKeywordCount(String keyword);

	List<Book> selectListSearchKeyword(String keyword, Paging searchPaging, int searchKind);
	

}
