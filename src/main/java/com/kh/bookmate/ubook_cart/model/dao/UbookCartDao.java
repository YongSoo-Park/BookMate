package com.kh.bookmate.ubook_cart.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.ubook.model.vo.Ubook;
import com.kh.bookmate.ubook_cart.model.vo.UbookCart;

@Repository
public class UbookCartDao {

	public int insertCart(SqlSession sqlSession, UbookCart cart) {
		
		return sqlSession.insert("ubookCartMapper.insertCart", cart);
	}

	public List<UbookCart> selectCartList(SqlSession sqlSession, String cartUserId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ubookCartMapper.selectCartList",cartUserId);
	}

	/*
	 public List<Ubook> selectUBookList(SqlSession sqlSession, String cartUserId) {
		 return sqlSession.selectList("ubookCartMapper.selectUBookList",cartUserId);
	  }
	*/
	 public List<Ubook> selectUBookList(SqlSession sqlSession, List<UbookCart> cartList) {
		 return sqlSession.selectList("ubookCartMapper.selectUBookList",cartList);
	  }
	 
	public int deleteCart(SqlSession sqlSession, int cartNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("ubookCartMapper.deleteCart",cartNo);
	}

	public UbookCart selectCart(SqlSession sqlSession, UbookCart cart) {
		return sqlSession.selectOne("ubookCartMapper.selectCart",cart);
	}

	/*
	 * public int updateUbookStock(SqlSession sqlSession, int cartUbNo) { return
	 * sqlSession.update("ubookCartMapper.updateUbookStock",cartUbNo); }
	 */


}
