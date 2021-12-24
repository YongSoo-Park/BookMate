package com.kh.bookmate.exchange_item.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.exchange_item.model.dao.ExchangeItemDao;
import com.kh.bookmate.exchange_item.model.vo.ExchangeItem;
import com.kh.bookmate.payment.model.vo.PaymentDetail;
 
@Service
public class ExchangeItemImpl implements ExchangeItemService {
 
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ExchangeItemDao exchangeItemDao;

	//교환대상 인서트 
	@Override
	public void insertExchangeItem(ExchangeItem exchangeBook) {
		exchangeItemDao.insertExchangeItem(sqlSession,exchangeBook);
	}

	//관리자 교환 페이지 리스트 조회 
	@Override
	public List<ExchangeItem> selectExchangeList() {
		List<ExchangeItem> list = exchangeItemDao.selectExchangeList(sqlSession);
		return list;
		
	} 

	//관리자 교환 리스트 뽑아옴 (디테일넘버테이블도 쓸꺼기 때문에 )
	@Override
	public List<PaymentDetail> selectOrderDetailNoList(List<Integer> exchangeDetailNoList) {
		List<PaymentDetail> OrderDetailList = exchangeItemDao.selectOrderDetailList(sqlSession,exchangeDetailNoList);
		return OrderDetailList;
	}

	@Override
	public void updateExchangeList(int paymentDetailNo) {
		exchangeItemDao.updateExchangeList(sqlSession,paymentDetailNo);

	}

//	@Override
//	public List<PaymentDetail> updateExchangeList(List<Integer> exchangeDetailNoList) {
//		List<PaymentDetail> updateExchangeList = exchangeItemDao.updateExchangeList(sqlSession, exchangeDetailNoList);
//		return updateExchangeList;
//	}
//  

	
}
 