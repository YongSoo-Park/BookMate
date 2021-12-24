package com.kh.bookmate.ubook_payment.model.service;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.payment.model.vo.Payment;
import com.kh.bookmate.payment.model.vo.PaymentDetail;
import com.kh.bookmate.shoppingbasket.model.vo.ShoppingBasket;
import com.kh.bookmate.ubook_cart.model.vo.UbookCart;
import com.kh.bookmate.ubook_payment.model.dao.UbookPaymentDao;
import com.kh.bookmate.ubook_payment.model.vo.UbookPayment;
import com.kh.bookmate.ubook_payment.model.vo.UbookPaymentDetail;
import com.kh.bookmate.user.model.dao.UserDao;

@Service
public class UbookPaymentServiceImpl implements UbookPaymentService {

	@Autowired
	private SqlSessionTemplate sqlSession;
		
	@Autowired 
	private UbookPaymentDao ubookPaymentDao;
 

	@Override
	public int insertUbookPayment(UbookPayment temp, List<UbookPaymentDetail> list, List<UbookCart> deleteCartList) {
		
		int result = ubookPaymentDao.insertUbookPayment(sqlSession,temp);
		if(result < 0) {
			throw new RuntimeException("결제 정보 저장 오류");
		}
		int paymentNoUb = temp.getPaymentNoUb();
		for(UbookPaymentDetail upd : list) {
			upd.setPaymentNoUb(paymentNoUb);
			int result2 = ubookPaymentDao.insertUbookPaymentDetail(sqlSession,upd);
			if(result2 < 0) {
				throw new RuntimeException("세부 결제 정보 저장 오류");
			}
		}
		for(UbookCart cart : deleteCartList) {
			int result3 = ubookPaymentDao.deleteCart(sqlSession,cart.getCartNo());
			if(result3 < 0) {
				throw new RuntimeException("결제후 장바구니 삭제 오류");
			}
		}
		/*
		 * for(UbookCart cart : updateUbookStock) {
		 * System.out.println("paymentServiceImpl cart" + cart);
		 * System.out.println("paymentServiceImpl getCartUbNo" + cart.getCartUbNo());
		 * int result4 =
		 * ubookPaymentDao.updateUbookStock(sqlSession,cart.getCartUbNo()); if(result4 <
		 * 0) { throw new RuntimeException("결제후 수량 변경 삭제 오류"); } }
		 */
		return result;
	}
	
	/*@Override
	public void insertUbookPayment(UbookPayment temp, List<UbookPaymentDetail> list, List<UbookCart> deleteCartList, List<UbookCart> updateUbookStock) {
		
		int result = ubookPaymentDao.insertUbookPayment(sqlSession,temp);
		if(result < 0) {
			throw new RuntimeException("결제 정보 저장 오류");
		}
		int paymentNoUb = temp.getPaymentNoUb();
		for(UbookPaymentDetail upd : list) {
			upd.setPaymentNoUb(paymentNoUb);
			int result2 = ubookPaymentDao.insertUbookPaymentDetail(sqlSession,upd);
			if(result2 < 0) {
				throw new RuntimeException("세부 결제 정보 저장 오류");
			}
		}
		for(UbookCart cart : deleteCartList) {
			int result3 = ubookPaymentDao.deleteCart(sqlSession,cart.getCartNo());
			if(result3 < 0) {
				throw new RuntimeException("결제후 장바구니 삭제 오류");
			}
		}
		for(UbookCart cart : updateUbookStock) {
		System.out.println("paymentServiceImpl cart" + cart);
		System.out.println("paymentServiceImpl getCartUbNo" + cart.getCartUbNo());
			int result4 = ubookPaymentDao.updateUbookStock(sqlSession,cart.getCartUbNo());
			if(result4 < 0) {
				throw new RuntimeException("결제후 수량 변경 삭제 오류");
			}
		}
	}*/


	@Override
	public List<UbookPayment> selectMyOrderList(String loginUser) {
		List<UbookPayment> list = ubookPaymentDao.selectMyOrderList(sqlSession, loginUser);
		return list;
	}


	@Override
	public int selectListCount(String loginUser) {
		// TODO Auto-generated method stub
		return ubookPaymentDao.selectListCount(sqlSession,loginUser);
	}


	@Override
	public List<UbookPaymentDetail> selectMyOrderListDetail(int paymentNoUb) {
		List<UbookPaymentDetail> list = ubookPaymentDao.selectMyOrderListDetail(sqlSession,paymentNoUb);
		return list;
	}


	@Override
	public int confirmOrder(int paymentDetailNoUb) {
		int list = ubookPaymentDao.confirmOrder(sqlSession,paymentDetailNoUb);
		return list;
	}


	@Override
	public UbookPayment selectPaymentNo(int paymentNoUb) {
		UbookPayment list = ubookPaymentDao.selectPaymentNo(sqlSession,paymentNoUb);
		return list;
	}


	@Override
	public void updateUpdateDelivery(UbookPaymentDetail ubookPaymentDeatil) {
		
	}


	@Override
	public List<UbookPaymentDetail> selectDeliveryList() {
		List<UbookPaymentDetail> list = ubookPaymentDao.selectDeliveryList(sqlSession);
		return list;
	}


	@Override
	public List<UbookPayment> selectDeliveryPaymentNoList(List<Integer> deliveryDetailNoList) {
		List<UbookPayment> paymentNoList = ubookPaymentDao.selectDeliveryPaymentNoList(sqlSession,deliveryDetailNoList);
		return paymentNoList;
	}


	@Override
	public int updateUbookStock(int ubookNoUb) {
		return ubookPaymentDao.updateUbookStock(sqlSession,ubookNoUb);
	}

	//결제된 등록 도서 확인하기
	@Override
	public List<UbookPaymentDetail> selectOrderUbookList(int bSellerNo) {
		List<UbookPaymentDetail> ubookPayDetailList = ubookPaymentDao.selectOrderUbookList(sqlSession,bSellerNo);
		return ubookPayDetailList;
	}



	//결제한 도서 정보 보기
	@Override
	public UbookPaymentDetail selectOrderUbookInfo(UbookPaymentDetail ubookPayDetail) {
		return ubookPaymentDao.selectOrderUbookInfo(sqlSession,ubookPayDetail);
	}

	//주문자 정보 보기
	@Override
	public UbookPayment selectOrderUserInfo(int paymentNoUb) {
		return ubookPaymentDao.selectOrderUserInfo(sqlSession,paymentNoUb);
	}

	//도서정보 보기
	@Override
	public UbookPaymentDetail selectOrderBookInfo(UbookPaymentDetail upd) {
		return ubookPaymentDao.selectOrderBookInfo(sqlSession,upd);
	}

	//도서 배송상태 수정
	@Override
	public int updateOrderInfo(UbookPaymentDetail updUp) {
		return ubookPaymentDao.updateOrderInfo(sqlSession,updUp);
	}

	@Override
	public List<UbookPaymentDetail> selectSoldUbookList(int bSellerNo) {
		List<UbookPaymentDetail> ubookSoldList = ubookPaymentDao.selectSoldUbookList(sqlSession,bSellerNo);
		return ubookSoldList;
	}

	//[중고] 도서 주문리스트 불러오기 
	@Override
	public List<UbookPayment> selectUbookMyOrderList(String loginUser) {
		 List<UbookPayment> uList = ubookPaymentDao.selectUbookMyOrderList(sqlSession,loginUser);
		return uList;
	}

	//[중고] 도서 상세 주문리스트 불러오기 
	@Override
	public List<UbookPaymentDetail> selectUbookMyOrderDetailList(int paymentNoUb) {
		 List<UbookPaymentDetail>	uDetailList = ubookPaymentDao.selectUbookMyOrderDetailList(sqlSession,paymentNoUb);
		return uDetailList;
	}

	//[중고] 배송완료 후 구매확정 
	@Override
	public void confirmOrderUbook(int paymentDetailNoUb) {
		ubookPaymentDao.confirmOrderUbook(sqlSession, paymentDetailNoUb);
	
	}

	
}
