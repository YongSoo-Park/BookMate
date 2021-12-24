package com.kh.bookmate.shoppingbasket.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.shoppingbasket.model.vo.ShoppingBasket;

@Repository
public class ShoppingBasketDao {

	public int insertBasket(SqlSession sqlSession, ShoppingBasket basket) {

		return sqlSession.insert("basketMapper.insertBasket", basket);
	}

	public List<ShoppingBasket> selectCartList(SqlSession sqlSession, String user_Id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("basketMapper.selectCartList", user_Id);
	}

	public List<Book> selectBookList(SqlSession sqlSession, List<ShoppingBasket> basketList) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("basketMapper.selectBookList", basketList);
	}

	public int deleteBasket(SqlSession sqlSession, int basketNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("basketMapper.deleteBasket", basketNo);
	}

	public ShoppingBasket selectBasket(SqlSession sqlSession, ShoppingBasket basket) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("basketMapper.selectBasket", basket);
	}

}
