package com.kh.bookmate.category.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.category.model.service.CategoryService;
import com.kh.bookmate.common.Paging;

@Controller
public class CategoryController {

	@Autowired
	private CategoryService categoryService;

	@RequestMapping("selectCategory.ca")
	public String selectCategory(int category,
			@RequestParam(name = "categoryNowPage", defaultValue = "1") int categoryNowPage,
			@RequestParam(name = "categoryKind", defaultValue = "1") int categoryKind, Model mo) {

		List<Book> categoryList = null;
		int categoryListCount = 0;
		Paging categoryPaging = null;
		if (category >= 10) {
			int mainCategory = category - 10;
			categoryListCount = categoryService.selectListMainCategoryCount(mainCategory);

			categoryPaging = new Paging(categoryListCount, categoryNowPage, 20, 10);
			categoryList = categoryService.selectListMainCategory(mainCategory, categoryPaging, categoryKind);
		} else {
			categoryListCount = categoryService.selectListCategoryCount(category);

			categoryPaging = new Paging(categoryListCount, categoryNowPage, 20, 10);
			categoryList = categoryService.selectListCategory(category, categoryPaging, categoryKind);
		}

		mo.addAttribute("categoryNowPage", categoryNowPage);
		mo.addAttribute("categoryKind", categoryKind);
		mo.addAttribute("category", category);
		mo.addAttribute("categoryList", categoryList);
		mo.addAttribute("categoryPaging", categoryPaging);
		return "category/categoryResult";

	}
}
