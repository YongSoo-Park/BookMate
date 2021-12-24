package com.kh.bookmate.payment.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.addressBook.model.dao.AddressBookDao;
import com.kh.bookmate.book.model.dao.BookDao;
import com.kh.bookmate.bookreview.model.dao.BookReviewDao;
import com.kh.bookmate.bookreview.model.vo.BuyReview;
import com.kh.bookmate.common.PageInfo;
import com.kh.bookmate.payment.model.dao.PaymentDao;
import com.kh.bookmate.payment.model.vo.Payment;
import com.kh.bookmate.payment.model.vo.PaymentDetail;
import com.kh.bookmate.returnBook.model.dao.ReturnBookDao;
import com.kh.bookmate.shoppingbasket.model.vo.ShoppingBasket;
import com.kh.bookmate.user.model.dao.UserDao;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private UserDao userDao;

	@Autowired
	private PaymentDao paymentDao;

	@Autowired
	private ReturnBookDao returnBookDao;

	@Autowired
	private BookDao bookDao;

	@Autowired
	private BookReviewDao bookReviewDao;

	@Autowired
	private AddressBookDao addressBookDao;

	// 주문 리스트 조회
	@Override
	public List<Payment> selectMyOrderList(String loginUser, PageInfo pi) {
		List<Payment> list = paymentDao.selectMyOrderList(sqlSession, loginUser, pi);
		return list;
	}

	// 주문리스트 상세조회
	@Override
	public List<PaymentDetail> selectMyOrderListDetail(int paymentNo) {
		List<PaymentDetail> list = paymentDao.selectMyOrderListDetail(sqlSession, paymentNo);
		return list;
	}

	// 사용자 배송준비중 구매취소
	@Override
	public int cancelMyOrder(int paymentDetailNo) {
		int cancel = paymentDao.cancelMyOrder(sqlSession, paymentDetailNo);
		return cancel;
	}

	// 사용자 배송완료 후 구매확정
	@Override
	public void confirmOrder(int paymentDetailNo, int paymentNo) {

		PaymentDetail pd = paymentDao.selectPaymentDetail(sqlSession, paymentDetailNo);
		// paymentDetailNo 로 페이먼트 객체 가져오기
		Payment p = paymentDao.selectPaymentNo(sqlSession, paymentNo);
		// paymentNo 로 페이먼트 객체 가져오기

		int result1 = paymentDao.confirmOrder(sqlSession, paymentDetailNo);
		// 구매확정
		if (result1 < 0) {
			throw new RuntimeException("paymentServiceImpl result1 오류 ");
		}

		List<Object> ibr = new ArrayList<Object>();
		ibr.add(p.getUser_Id());
		ibr.add(pd.getBookISBN());

		List<Object> sell = new ArrayList<Object>();
		sell.add(pd.getBookISBN());
		sell.add(pd.getQuantity());
		sell.add(pd.getDeliveryDate());

		int result2 = bookReviewDao.insertConfirmOrder(sqlSession, ibr);
		// buyReview 에 인서트(구매 고객 한해서 리뷰를 작성할수있게 해놓음)

		int result3 = bookDao.insertConfirmSellDate(sqlSession, sell);

		if (result2 < 0) {
			throw new RuntimeException("paymentServiceImpl result2 오류 ");
		}
		if (result3 < 0) {
			throw new RuntimeException("paymentServiceImpl result3 오류 ");
		}

	}

	// 교환
	@Override
	public PaymentDetail applyExchange(int paymentDetailNo) {
		PaymentDetail applyExchange = paymentDao.applyExchange(sqlSession, paymentDetailNo);
		return applyExchange;
	}

	@Override
	public Payment selectPaymentNo(int paymentNo) {
		Payment pno = paymentDao.selectPaymentNo(sqlSession, paymentNo);
		return pno;
	}

	// 사용자 deliveryStatus 교환 완료로 업데이트 시켜줘야됨
	@Override
	public void updateUserExList(int paymentDetailNo) {
		paymentDao.updateUserExList(sqlSession, paymentDetailNo);

	}

	@Override
	public List<PaymentDetail> selectDeliveryList() {
		List<PaymentDetail> pdList = paymentDao.selectDeliveryList(sqlSession);
		return pdList;
	}

	// [관리자] 배송리스트 업데이트
	@Override
	public void updateDeliveryList(int paymentDetailNo) {
		paymentDao.updateDeliveryList(sqlSession, paymentDetailNo);

	}

	@Override
	public void exchangeWait(int paymentDetailNo) {
		paymentDao.exchangeWait(sqlSession, paymentDetailNo);
	}

	@Override
	public void updateUserReList(int paymentDetailNo) {
		paymentDao.updateUserReList(sqlSession, paymentDetailNo);

	}

	@Override
	public List<PaymentDetail> cancelList(String loginUser, PageInfo pi) {
		List<PaymentDetail> cList = paymentDao.cancelList(sqlSession, loginUser, pi);
		return cList;
	}

	// 여기서 트렌젝션 처리해서 하나 오류난다고 해서 다른 하나가 되지 않음
	@Override
	public void updateReturn(int paymentDetailNo, Payment p) {
		// TODO Auto-generated method stub
		paymentDao.updateUserReList(sqlSession, paymentDetailNo); // 반품승인 완료 2번 업데이트
		returnBookDao.updateReturnList(sqlSession, paymentDetailNo); // 반품 완료로 업데이트 시켜주기 반품완료는 5번
		PaymentDetail pd = paymentDao.selectPaymentDetail(sqlSession, paymentDetailNo);
		// int paymentDetailNo 로 페이먼트디테일 객체 가져오기

		// Payment pay =paymentDao.selectPayment(sqlSession, p); // int paymentNo으로
		// payment객체 가져오기

		// 얘를 파라미터로 넣어서 북객체를 바꿔준다.
		// 1. pd를 가지고 파라미터로 넣어서 북테이블에 재고를 플러스 시켜준다. (update set stock)
		bookDao.updateBookStock(sqlSession, pd);
		// 2. pd를 가지고 파라미터로 넣어서 유저테이블에 포인트를 마이너스 시켜준다. (update set point)

		// 페이먼트 넘버랑, 페이먼트디테일넘버, 유저포인트 (getPoint)

		// userId랑 getpoint만 가져옴
		List<Object> pointAnduserId = new ArrayList<Object>();
		pointAnduserId.add(p.getGetPoint());
		pointAnduserId.add(p.getUser_Id());

		int result = userDao.updateUserReturnPoint(sqlSession, pointAnduserId);

		// 업데이트 오류시 여기서 롤백해줌
		if (result < 0) {
			throw new RuntimeException("유저 포인트 업데이트 오류");
		}

	}

	@Override
	public List<PaymentDetail> selectReAndExList(String loginUser, PageInfo pi) {
		List<PaymentDetail> result = paymentDao.selectReAndExList(sqlSession, loginUser, pi);

		return result;
	}

	///////////////////////////////////////////////////////////////////////////////////////////

	// 결제 전 도서 재고 체크
	@Override
	public boolean checkStock(ShoppingBasket basket) {
		int stock = paymentDao.checkStock(sqlSession, basket.getBookISBN());
		return stock >= basket.getQuantity();
	}

	// 결제후 결제 정보 저장
	@Override
	public void insertPayment(Payment temp, List<PaymentDetail> list, List<ShoppingBasket> deleteBasketList,
			String latelyAddress) {

		// 결제 정보 등록, 결제 세부(도서)정보 등록, 결제후 장바구니 삭제, 결제후 유저 포인트 업데이트, 결제후 도서 재고 변동, 주소록 이전 결제 주소 업데이트

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_Id", temp.getUser_Id());
		map.put("latelyAddress", latelyAddress);
		paymentDao.insertPayment(sqlSession, temp);

		int paymentNo = temp.getPaymentNo();
		for (PaymentDetail pd : list) {
			pd.setPaymentNo(paymentNo);
			paymentDao.insertPaymentDetail(sqlSession, pd);

		}

		for (ShoppingBasket basket : deleteBasketList) {
			int result1 = paymentDao.deleteBasket(sqlSession, basket.getBasketNo());
			if (result1 < 0) {
				throw new RuntimeException("결제후 장바구니 삭제 오류");
			}
		}

		temp.setUsePoint(-temp.getUsePoint());
		int result2 = paymentDao.updateUserPoint(sqlSession, temp);
		if (result2 < 0) {
			throw new RuntimeException("유저 포인트 업데이트 오류");
		}
		for (ShoppingBasket basket : deleteBasketList) {
			int result3 = paymentDao.updateBookStock(sqlSession, basket);
			if (result3 < 0) {
				throw new RuntimeException("결제후 재고 감소 오류");
			}
		}
		int result4 = addressBookDao.updateLatelyAddress(sqlSession, map);
		if (result4 < 1) {
			throw new RuntimeException("이전 결제 주소 업데이트 오류");
		}

	}

	@Override
	public void insertSinglePayment(Payment temp, PaymentDetail paymentDetail, String latelyAddress) {

		// 결제 정보 등록, 결제 세부(도서)정보 등록, 결제후 유저 포인트 업데이트, 결제후 도서 재고 변동, 주소록 이전 결제 주소 업데이트

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_Id", temp.getUser_Id());
		map.put("latelyAddress", latelyAddress);
		paymentDao.insertPayment(sqlSession, temp);
		ShoppingBasket basket = new ShoppingBasket();
		basket.setBookISBN(paymentDetail.getBookISBN());
		basket.setQuantity(paymentDetail.getQuantity());

		int paymentNo = temp.getPaymentNo();

		paymentDetail.setPaymentNo(paymentNo);
		paymentDao.insertPaymentDetail(sqlSession, paymentDetail);
		temp.setUsePoint(-temp.getUsePoint());
		int result1 = paymentDao.updateUserPoint(sqlSession, temp);
		if (result1 < 0) {
			throw new RuntimeException("유저 포인트 업데이트 오류");
		}

		int result2 = paymentDao.updateBookStock(sqlSession, basket);
		if (result2 < 0) {
			throw new RuntimeException("결제후 재고 감소 오류");
		}

		int result3 = addressBookDao.updateLatelyAddress(sqlSession, map);
		if (result3 < 1) {
			throw new RuntimeException("이전 결제 주소 업데이트 오류");
		}

	}

}
