package com.kh.bookmate.exchange_item.model.service;

import java.util.List;

import com.kh.bookmate.exchange_item.model.vo.ExchangeItem;
import com.kh.bookmate.payment.model.vo.PaymentDetail;

public interface ExchangeItemService {

	void insertExchangeItem(ExchangeItem exchangeBook);

	List<ExchangeItem> selectExchangeList();

	List<PaymentDetail> selectOrderDetailNoList(List<Integer> exchangeDetailNoList);

	void updateExchangeList(int paymentDetailNo);

 
 
}
   