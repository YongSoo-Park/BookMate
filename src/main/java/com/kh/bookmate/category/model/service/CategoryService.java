package com.kh.bookmate.category.model.service;

import java.util.List;

import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.common.Paging;

public interface CategoryService {

	int selectListCategoryCount(int category);

	List<Book> selectListCategory(int category, Paging categoryPaging, int categoryKind);

	int selectListMainCategoryCount(int mainCategory);

	List<Book> selectListMainCategory(int mainCategory, Paging categoryPaging, int categoryKind);

}
