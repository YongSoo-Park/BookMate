package com.kh.bookmate.coupon.model.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.coupon.model.dao.CouponDao;
import com.kh.bookmate.coupon.model.dao.UseCouponDao;
import com.kh.bookmate.coupon.model.vo.Coupon;
import com.kh.bookmate.coupon.model.vo.UseCoupon;
import com.kh.bookmate.user.model.dao.UserDao;

@Service
public class CouponServiceImpl implements CouponService {
	@Autowired
	private CouponDao couponDao;

	@Autowired
	private UseCouponDao useCouponDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 쿠폰 번호 중복체크를 위한 쿠폰 정보 가져오기
	@Override
	public Coupon selectCoupon(String couponCode) {
		// TODO Auto-generated method stub
		return couponDao.selectCoupon(sqlSession, couponCode);
	}

	//쿠폰 등록
	@Override
	public int insertCoupon(Coupon coupon) {
		// TODO Auto-generated method stub
		return couponDao.insertCoupon(sqlSession, coupon);
	}

	//쿠폰 리스트 카운트
	@Override
	public int selectCouponListCount(String keyword) {
		// TODO Auto-generated method stub
		return couponDao.selectCouponListCount(sqlSession, keyword);
	}

	//쿠폰 리스트
	@Override
	public List<Coupon> selectCouponList(String keyword, RowBounds rb) {
		// TODO Auto-generated method stub
		return couponDao.selectCouponList(sqlSession, keyword, rb);
	}

	//쿠폰 수정
	@Override
	public void updateCoupon(Coupon coupon) {
		int result = couponDao.updateCoupon(sqlSession, coupon);
		if (result < 1) {
			throw new RuntimeException("쿠폰 수정중 db 오류");
		}

	}

	//쿠폰 삭제
	@Override
	public void deleteCoupon(int couponCode) {
		int result = couponDao.deleteCoupon(sqlSession, couponCode);
		if (result < 1) {
			throw new RuntimeException("쿠폰 삭제중 db 오류");
		}
	}

	/////////////////////////////////////////////////////////////////////
	
	// 쿠폰코드 중복체크
	@Override
	public int checkUseCoupon(String couponCode) {
		return couponDao.checkUseCoupon(sqlSession, couponCode);
	}

	// coupon -> usecoupon 으로 인서트
	// user테이블의 point 컬럼 업데이트
	@Override
	public void updateCoupon(UseCoupon uc, Coupon cu) {
		// TODO Auto-generated method stub

		int result1 = useCouponDao.insertUsedCouponCode(sqlSession, uc);
		if (result1 < 0) {
			throw new RuntimeException("유저 포인트 인서트 업데이트 오류");

		}
		System.out.println(uc.getUser_Id() + "--------------couponService 유저명확인 ");
		// 기존에 coupon 에 있던 couponcode와 user_id를 userCoupon은 다 쓴걸 넣어준다

		List<Object> redeem = new ArrayList<Object>();
		redeem.add(cu.getCouponPoint());
		redeem.add(uc.getUser_Id());

		int result2 = userDao.updateGetUserPoint(sqlSession, redeem);
		if (result2 < 0) {
			throw new RuntimeException("유저 포인트 업데이트 오류");
		}

	}

	// 사용된 쿠폰 테이블에서 체크조회
	@Override
	public UseCoupon checkAlreadyUsedCoupon(UseCoupon uc) {
		return useCouponDao.checkAlreadyUsedCoupon(sqlSession, uc);
	}

	@Override
	public void selectUseCoupon(UseCoupon uc) {
		couponDao.selectUseCoupon(sqlSession, uc);

	}

}
