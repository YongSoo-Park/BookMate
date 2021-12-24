package com.kh.bookmate.myPage.model.service;

import java.util.List;

import com.kh.bookmate.addressBook.model.vo.AddressBook;
import com.kh.bookmate.wishlist.model.vo.WishList;

public interface MyPageService {

	List<AddressBook> selectMyAddressList(String loginUser);

	int selectListCount();

	int selectCancelListCount();

	int selectrefundAndExchangeListCount();

	int selectReviewListMineCount();

	List<WishList> selectMyWishList(String loginUser);

	

}
