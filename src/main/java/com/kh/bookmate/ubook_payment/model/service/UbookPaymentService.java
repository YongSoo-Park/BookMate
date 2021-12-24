package com.kh.bookmate.ubook_payment.model.service;

import java.util.List;

import com.kh.bookmate.payment.model.vo.PaymentDetail;
import com.kh.bookmate.ubook_cart.model.vo.UbookCart;
import com.kh.bookmate.ubook_payment.model.vo.UbookPayment;
import com.kh.bookmate.ubook_payment.model.vo.UbookPaymentDetail;
import com.kh.bookmate.user.model.vo.User;

public interface UbookPaymentService {

	List<UbookPayment> selectMyOrderList(String loginUser);

	int selectListCount(String loginUser);
 
	List<UbookPaymentDetail> selectMyOrderListDetail(int paymentNoUb);

	int confirmOrder(int paymentDetailNoUb);
 
	UbookPayment selectPaymentNo(int paymentNoUb);

	//주문 상세에 넣기
	int insertUbookPayment(UbookPayment temp, List<UbookPaymentDetail> list, List<UbookCart> deleteCartList);
	
	//(배송상태 업데이트) 사용자 화면에서 배송중으로 업데이트 
	void updateUpdateDelivery(UbookPaymentDetail ubookPaymentDeatil);

	List<UbookPaymentDetail> selectDeliveryList();

	List<UbookPayment> selectDeliveryPaymentNoList(List<Integer> deliveryDetailNoList);

	int updateUbookStock(int ubookNoUb);

	//판매자 화면에서 현재 결제된 도서 리스트 보기
	List<UbookPaymentDetail> selectOrderUbookList(int bSellerNo);

	//결제된 도서 정보 보기
	UbookPaymentDetail selectOrderUbookInfo(UbookPaymentDetail ubookPayDetail);

	//주문자 정보 보기
	UbookPayment selectOrderUserInfo(int paymentNoUb);

	//도서 정보 보기
	UbookPaymentDetail selectOrderBookInfo(UbookPaymentDetail upd);
	
	//주문상태 변경하려고
	int updateOrderInfo(UbookPaymentDetail updUp);

	//판매완료 도서 리스트 보기
	List<UbookPaymentDetail> selectSoldUbookList(int bSellerNo);

	
	//[중고]유북 마이페이지 주문리스트 
	List<UbookPayment> selectUbookMyOrderList(String loginUser);

	//[중고] 유북 마이페이지 상세주문리스트 
	List<UbookPaymentDetail> selectUbookMyOrderDetailList(int paymentNoUb);

	//[중고] 유북 구매 확정 상태값 변경 
	void confirmOrderUbook(int paymentDetailNoUb);

 
}
