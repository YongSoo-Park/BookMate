package com.kh.bookmate.ubook_cart.model.service;

import java.util.List;

import com.kh.bookmate.ubook.model.vo.Ubook;
import com.kh.bookmate.ubook_cart.model.vo.UbookCart;

public interface UbookCartService {

	void insertCart(UbookCart cart);

	List<UbookCart> selectCartList(String cartUserId);


	int deleteCart(int cartNo);

	//List<Ubook> selectUBookList(String cartUserId);
	List<Ubook> selectUBookList(List<UbookCart> cartList);

	UbookCart selectCart(UbookCart cart);

	//int updateUbookStock(int cartUbNo);
}
