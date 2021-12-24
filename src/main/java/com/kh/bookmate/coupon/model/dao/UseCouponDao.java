package com.kh.bookmate.coupon.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.coupon.model.vo.UseCoupon;

@Repository
public class UseCouponDao {

	public UseCoupon checkAlreadyUsedCoupon(SqlSessionTemplate sqlSession, UseCoupon uc) {
		return sqlSession.selectOne("UseCouponMapper.checkAlreadyUsedCoupon", uc);
	}


	public int insertUsedCouponCode(SqlSessionTemplate sqlSession, UseCoupon uc) {
		return sqlSession.insert("UseCouponMapper.insertUsedCouponCode", uc);
	}

	
	

	

}
