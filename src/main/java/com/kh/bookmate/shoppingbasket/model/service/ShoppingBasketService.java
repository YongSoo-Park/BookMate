package com.kh.bookmate.shoppingbasket.model.service;

import java.util.List;

import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.shoppingbasket.model.vo.ShoppingBasket;

public interface ShoppingBasketService {

	void insertBasket(ShoppingBasket basket);

	List<ShoppingBasket> selectCartList(String user_Id);

	List<Book> selectBookList(List<ShoppingBasket> basketList);

	int deleteBasket(int basketNo);

	ShoppingBasket selectBasket(ShoppingBasket basket);
	
}
