package com.kh.bookmate.wishlist.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.wishlist.model.dao.WishListDao;
import com.kh.bookmate.wishlist.model.vo.WishList;

@Service
public class WishListServiceImpl implements WishListService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private WishListDao wishListDao;

	@Override
	public WishList selectWish(WishList wish) {
		// TODO Auto-generated method stub
		return wishListDao.selectWish(sqlSession,wish);
	}

	@Override
	public void updateWishList(WishList wish, int wishListStatus) {
		int result = 0;
		if(wishListStatus==1) {

			result = wishListDao.insertWishList(sqlSession,wish);
		}else {

			result = wishListDao.deleteWishList(sqlSession,wish);
		}
		if(result < 1) {
			throw new RuntimeException("찜목록 업데이트중 db 오류");
		}
	}

}
