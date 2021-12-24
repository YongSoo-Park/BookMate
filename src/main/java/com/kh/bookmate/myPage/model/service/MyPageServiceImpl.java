package com.kh.bookmate.myPage.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.addressBook.model.dao.AddressBookDao;
import com.kh.bookmate.addressBook.model.vo.AddressBook;
import com.kh.bookmate.bookreview.model.dao.BookReviewDao;
import com.kh.bookmate.payment.model.dao.PaymentDao;
import com.kh.bookmate.wishlist.model.dao.WishListDao;
import com.kh.bookmate.wishlist.model.vo.WishList;



@Service
public class MyPageServiceImpl implements MyPageService {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AddressBookDao addressBookDao;
	
	@Autowired
	private PaymentDao paymentDao;
	
	@Autowired
	private BookReviewDao bookReviewDao;
	
	@Autowired
	private WishListDao wishListDao;

	@Override
	public List<AddressBook> selectMyAddressList(String loginUser) {
		List<AddressBook> list = addressBookDao.selectMyAddressList(sqlSession,loginUser);
		return list;
	}

	@Override
	public int selectListCount() {
		return paymentDao.selectListCount(sqlSession);
	}

	@Override
	public int selectCancelListCount() {
		// TODO Auto-generated method stub
		return  paymentDao.selectCancelListCount(sqlSession);
	}

	@Override
	public int selectrefundAndExchangeListCount() {
		// TODO Auto-generated method stub
		return paymentDao.selectrefundAndExchangeListCount(sqlSession);
	}

	@Override
	public int selectReviewListMineCount() {
		// TODO Auto-generated method stub
		return bookReviewDao.selectReviewListMineCount(sqlSession);
	}

	@Override
	public List<WishList> selectMyWishList(String loginUser) {
		// TODO Auto-generated method stub
		return wishListDao.selectMyWishList(sqlSession,loginUser);
	}

}
