package com.kh.bookmate.paymentmethod.model.service;

import java.util.List;

import com.kh.bookmate.paymentmethod.model.vo.PaymentMethod;
import com.kh.bookmate.paymentmethod.model.vo.PaymentMethodDetail;

public interface PaymentMethodService {
	
	

	PaymentMethod selectPaymentMethod(String userId);

	void insertPaymentMethod(String userId);


	List<PaymentMethodDetail> selectPMDetailList(PaymentMethod paymentMethod);

	int insertPMDetail(PaymentMethod paymentMethod, PaymentMethodDetail pmd);

	PaymentMethodDetail selectPaymentMethodDetail(int paymentMethodDetailNo);
	
	

}
