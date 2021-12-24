package com.kh.bookmate.paymentmethod.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.paymentmethod.model.dao.PaymentMethodDao;
import com.kh.bookmate.paymentmethod.model.vo.PaymentMethod;
import com.kh.bookmate.paymentmethod.model.vo.PaymentMethodDetail;

@Service
public class PaymentMethodServiceImpl implements PaymentMethodService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private PaymentMethodDao paymentMethodDao;

	//사용자의  저장된 결제 수단 정보 가져오기
	@Override
	public PaymentMethod selectPaymentMethod(String user_Id) {
		// TODO Auto-generated method stub
		return paymentMethodDao.selectPaymentMethod(sqlSession, user_Id);
	}

	//결제 수단 정보 저장
	@Override
	public void insertPaymentMethod(String user_Id) {
		paymentMethodDao.insertPaymentMethod(sqlSession, user_Id);

	}

	//저장된 결제 수단들의 상세 정보 가져오기(카드번호, 계좌번호 등)
	@Override
	public List<PaymentMethodDetail> selectPMDetailList(PaymentMethod paymentMethod) {
		// TODO Auto-generated method stub
		return paymentMethodDao.selectPMDetailList(sqlSession, paymentMethod);
	}

	//결제수단 상세 정보 저장하기
	@Override
	public int insertPMDetail(PaymentMethod paymentMethod, PaymentMethodDetail PMDetail) {
		int result2 = 1;
		int paymentMethodDetailNo = paymentMethodDao.insertPMDetail(sqlSession, PMDetail);

		if (paymentMethod.getMainPayment() == 0) {
			result2 = paymentMethodDao.updateMainMethod(sqlSession, PMDetail.getUser_Id());
		}
		if (paymentMethodDetailNo * result2 < 1) {
			throw new RuntimeException("결제 저장수단 등록 실패");
		}
		return paymentMethodDetailNo;

	}

	//저장된 결제 수단으로 결제시 비밀번호 체크를 위한 정보 가져오기
	@Override
	public PaymentMethodDetail selectPaymentMethodDetail(int paymentMethodDetailNo) {
		// TODO Auto-generated method stub
		return paymentMethodDao.selectPaymentMethodDetail(sqlSession, paymentMethodDetailNo);
	}

}
