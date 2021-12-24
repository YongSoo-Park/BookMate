package com.kh.bookmate.coupon.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.coupon.model.vo.Coupon;
import com.kh.bookmate.coupon.model.vo.UseCoupon;

@Repository
public class CouponDao {

	public Coupon selectCoupon(SqlSessionTemplate sqlSession, String couponCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("couponMapper.selectCoupon", couponCode);
	}

	public int insertCoupon(SqlSessionTemplate sqlSession, Coupon coupon) {
		// TODO Auto-generated method stub
		return sqlSession.insert("couponMapper.insertCoupon", coupon);
	}

	public int selectCouponListCount(SqlSessionTemplate sqlSession, String keyword) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("couponMapper.selectCouponListCount", keyword);
	}

	public List<Coupon> selectCouponList(SqlSessionTemplate sqlSession, String keyword, RowBounds rb) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("couponMapper.selectCouponList", keyword, rb);
	}

	public int updateCoupon(SqlSessionTemplate sqlSession, Coupon coupon) {
		// TODO Auto-generated method stub
		return sqlSession.update("couponMapper.updateCoupon", coupon);
	}

	public int deleteCoupon(SqlSessionTemplate sqlSession, int couponCode) {
		// TODO Auto-generated method stub
		return sqlSession.delete("couponMapper.deleteCoupon", couponCode);
	}

	// 중복 쿠폰 번호 있는지 확인하기
	public int checkUseCoupon(SqlSessionTemplate sqlSession, String couponCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("couponMapper.checkUseCoupon", couponCode);
	}

	public void selectUseCoupon(SqlSessionTemplate sqlSession, UseCoupon uc) {
		sqlSession.selectOne("UseCouponMapper.selectUseCoupon", uc);

	}

}
