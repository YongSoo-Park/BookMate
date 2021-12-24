package com.kh.bookmate.wishlist.model.service;

import com.kh.bookmate.wishlist.model.vo.WishList;

public interface WishListService {

	WishList selectWish(WishList wish);

	void updateWishList(WishList wish, int wishListStatus);

}
