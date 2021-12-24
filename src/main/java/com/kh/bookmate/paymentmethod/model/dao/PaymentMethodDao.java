package com.kh.bookmate.paymentmethod.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.paymentmethod.model.vo.PaymentMethod;
import com.kh.bookmate.paymentmethod.model.vo.PaymentMethodDetail;

@Repository
public class PaymentMethodDao {
	

	public int insertPaymentMethod(SqlSessionTemplate sqlSession, String user_Id) {
		// TODO Auto-generated method stub
		return sqlSession.insert("paymentMethodMapper.insertPaymentMethod",user_Id);
	}

	public PaymentMethod selectPaymentMethod(SqlSessionTemplate sqlSession, String user_Id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("paymentMethodMapper.selectPaymentMethod",user_Id);
	}


	public List<PaymentMethodDetail> selectPMDetailList(SqlSessionTemplate sqlSession, PaymentMethod paymentMethod) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("paymentMethodMapper.selectPMDetailList",paymentMethod);
	}

	public int insertPMDetail(SqlSessionTemplate sqlSession, PaymentMethodDetail PMDetail) {
		sqlSession.insert("paymentMethodMapper.insertPMDetail",PMDetail);
		return PMDetail.getPaymentMethodDetailNo();
		
	}

	public int updateMainMethod(SqlSessionTemplate sqlSession, String user_Id) {
		return sqlSession.update("paymentMethodMapper.updateMainMethod",user_Id);
		// TODO Auto-generated method stub
		
	}

	public PaymentMethodDetail selectPaymentMethodDetail(SqlSessionTemplate sqlSession, int paymentMethodDetailNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("paymentMethodMapper.selectPaymentMethodDetail",paymentMethodDetailNo);
	}

}
