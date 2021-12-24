package com.kh.bookmate.coupon.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kh.bookmate.coupon.model.vo.Coupon;
import com.kh.bookmate.coupon.model.vo.UseCoupon;

public interface CouponService {

	Coupon selectCoupon(String couponCode);

	int insertCoupon(Coupon coupon);

	
	int checkUseCoupon(String couponCode);

	

	UseCoupon checkAlreadyUsedCoupon(UseCoupon uc);

	
	
	//테이블에서 포인트만 알아서 받아온다 
	void updateCoupon(UseCoupon uc, Coupon cu);

	void selectUseCoupon(UseCoupon uc);

	int selectCouponListCount(String keyword);

	List<Coupon> selectCouponList(String keyword, RowBounds rb);

	void updateCoupon(Coupon coupon);

	void deleteCoupon(int couponCode);

	
	
}
