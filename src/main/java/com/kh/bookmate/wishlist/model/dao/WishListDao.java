package com.kh.bookmate.wishlist.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.wishlist.model.vo.WishList;

@Repository
public class WishListDao {

	public WishList selectWish(SqlSessionTemplate sqlSession, WishList wish) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("wishListMapper.selectWish",wish);
	}

	public int deleteWishList(SqlSessionTemplate sqlSession, WishList wish) {
		// TODO Auto-generated method stub
		return sqlSession.delete("wishListMapper.deleteWishList",wish);
	}

	public int insertWishList(SqlSessionTemplate sqlSession, WishList wish) {
		// TODO Auto-generated method stub
		return sqlSession.insert("wishListMapper.insertWishList",wish);
	}

	public List<WishList> selectMyWishList(SqlSessionTemplate sqlSession, String loginUser) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("wishListMapper.selectMyWishList",loginUser);
	}

}
