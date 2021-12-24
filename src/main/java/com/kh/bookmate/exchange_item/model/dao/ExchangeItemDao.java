package com.kh.bookmate.exchange_item.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.exchange_item.model.vo.ExchangeItem;
import com.kh.bookmate.payment.model.vo.PaymentDetail;

@Repository
public class ExchangeItemDao {

	public void insertExchangeItem(SqlSessionTemplate sqlSession, ExchangeItem exchangeBook) {
	
		sqlSession.insert("ExchangeItemMapper.insertExchangeItem",exchangeBook);
	}

	public List<ExchangeItem> selectExchangeList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList("ExchangeItemMapper.selectExchangeList");
	}

	public List<PaymentDetail> selectOrderDetailList(SqlSessionTemplate sqlSession, List<Integer> exchangeDetailNoList) {
		
		ArrayList<PaymentDetail> orderList = (ArrayList)sqlSession.selectList("ExchangeItemMapper.selectOrderDetailList",exchangeDetailNoList);
		
		//위에 orderList에서 뽑은 DetailNoList에 담음 
		List<Integer> exchangeOrderDetailNoList = new ArrayList<>();
			for(PaymentDetail e : orderList) {
				exchangeOrderDetailNoList.add(e.getPaymentDetailNo());
			}
			
			return orderList;
	}
 
	public void updateExchangeList(SqlSessionTemplate sqlSession, int paymentDetailNo) {
		// TODO Auto-generated method stub
		sqlSession.update("ExchangeItemMapper.updateExchangeList",paymentDetailNo);

	}

	



	  
 
}
 