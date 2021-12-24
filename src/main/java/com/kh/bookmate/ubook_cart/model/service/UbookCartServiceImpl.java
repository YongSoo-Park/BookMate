package com.kh.bookmate.ubook_cart.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.shoppingbasket.model.dao.ShoppingBasketDao;
import com.kh.bookmate.shoppingbasket.model.vo.ShoppingBasket;
import com.kh.bookmate.ubook.model.vo.Ubook;
import com.kh.bookmate.ubook_cart.model.dao.UbookCartDao;
import com.kh.bookmate.ubook_cart.model.vo.UbookCart;

@Service
public class UbookCartServiceImpl implements UbookCartService {
	
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	UbookCartDao ubookCartDao;

	@Override
	public void insertCart(UbookCart cart) {


		int result = ubookCartDao.insertCart(sqlSession,cart);
		
		if(result < 0) {
			throw new RuntimeException("장바구니 등록 실패");
		}
		
	}

	@Override
	public List<UbookCart> selectCartList(String cartUserId) {
		// TODO Auto-generated method stub
		return ubookCartDao.selectCartList(sqlSession,cartUserId);
	}


	@Override
	public int deleteCart(int cartNo) {
		// TODO Auto-generated method stub
		return ubookCartDao.deleteCart(sqlSession,cartNo);
	}

	/*@Override
	public List<Ubook> selectUBookList(String cartUserId) {
	  List<Ubook> selectUBookList = ubookCartDao.selectUBookList(sqlSession,cartUserId);
		  if(selectUBookList == null) {
			  throw new RuntimeException("장바구니 북리스트 가져오기 오류");
		  }
	  return selectUBookList;
	}*/
	@Override
	public List<Ubook> selectUBookList(List<UbookCart> cartList) {
	  List<Ubook> selectUBookList = ubookCartDao.selectUBookList(sqlSession,cartList);
		  if(selectUBookList == null) {
			  throw new RuntimeException("장바구니 북리스트 가져오기 오류");
		  }
	  return selectUBookList;
	}

	@Override
	public UbookCart selectCart(UbookCart cart) {
		return ubookCartDao.selectCart(sqlSession,cart);
	}

	/*
	 * @Override public int updateUbookStock(int cartUbNo) { }
	 */
}
