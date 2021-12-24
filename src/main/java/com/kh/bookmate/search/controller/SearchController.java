package com.kh.bookmate.search.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.common.Paging;
import com.kh.bookmate.search.model.service.SearchService;

@Controller
public class SearchController {

	@Autowired
	private SearchService searchService;

	@RequestMapping("selectSearchKeyword.se")
	public String selectListSearchKeyword(String keyword,
			@RequestParam(name = "searchNowPage", defaultValue = "1") int searchNowPage,
			@RequestParam(name = "searchKind", defaultValue = "1") int searchKind, Model mo) {
		String temp = null;
		if (keyword == null || keyword.trim().isEmpty()) {
			temp = "%%";
		} else {
			temp = "%" + keyword + "%";
		}
		List<Book> searchList = null;
		int searchKeywordCount = 0;
		searchKeywordCount = searchService.selectListKeywordCount(temp);
		Paging searchPaging = new Paging(searchKeywordCount, searchNowPage, 10, 10);
		searchList = searchService.selectListSearchKeyword(temp, searchPaging, searchKind);

		mo.addAttribute("searchNowPage", searchNowPage);
		mo.addAttribute("searchKind", searchKind);
		mo.addAttribute("keyword", keyword);
		mo.addAttribute("searchList", searchList);
		mo.addAttribute("searchPaging", searchPaging);
		return "search/searchResult";

	}

}
