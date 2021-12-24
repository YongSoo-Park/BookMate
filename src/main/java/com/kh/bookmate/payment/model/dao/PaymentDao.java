package com.kh.bookmate.payment.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.common.PageInfo;
import com.kh.bookmate.payment.model.vo.Payment;
import com.kh.bookmate.payment.model.vo.PaymentDetail;
import com.kh.bookmate.shoppingbasket.model.vo.ShoppingBasket;

@Repository
public class PaymentDao {

	// 나의 주문 리스트 조회
	public List<Payment> selectMyOrderList(SqlSessionTemplate sqlSession, String loginUser, PageInfo pi) {
		// TODO Auto-generated method stub

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("paymentMapper.selectMyOrderList", loginUser, rowBounds);
	}

	// 나의 주문 리스트 상세 조회
	public List<PaymentDetail> selectMyOrderListDetail(SqlSessionTemplate sqlSession, int paymentNo) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("paymentMapper.selectMyOrderListDetail", paymentNo);
	}

	public int cancelMyOrder(SqlSessionTemplate sqlSession, int paymentDetailNo) {
		return sqlSession.update("paymentMapper.cancelMyOrder", paymentDetailNo);
	}

	public int confirmOrder(SqlSessionTemplate sqlSession, int paymentDetailNo) {
		return sqlSession.update("paymentMapper.confirmOrder", paymentDetailNo);
	}

	public PaymentDetail applyExchange(SqlSessionTemplate sqlSession, int paymentDetailNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("paymentMapper.applyExchange", paymentDetailNo);
	}

	public Payment selectPaymentNo(SqlSessionTemplate sqlSession, int paymentNo) {
		return sqlSession.selectOne("paymentMapper.selectPaymentNo", paymentNo);
	}

	public void updateUserExList(SqlSessionTemplate sqlSession, int paymentDetailNo) {
		// TODO Auto-generated method stub
		sqlSession.update("paymentMapper.updateUserExList", paymentDetailNo);
	}

	public List<PaymentDetail> selectDeliveryList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("paymentMapper.selectDeliveryList");
	}

	public void updateDeliveryList(SqlSessionTemplate sqlSession, int paymentDetailNo) {
		sqlSession.update("paymentMapper.updateDeliveryList", paymentDetailNo);
	}

	public void exchangeWait(SqlSessionTemplate sqlSession, int paymentDetailNo) {
		sqlSession.update("paymentMapper.exchangeWait", paymentDetailNo);

	}

	public void updateUserReList(SqlSessionTemplate sqlSession, int paymentDetailNo) {
		sqlSession.update("paymentMapper.updateUserReList", paymentDetailNo);
	}

	public List<PaymentDetail> cancelList(SqlSessionTemplate sqlSession, String loginUser, PageInfo pi) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("paymentMapper.cancelList", loginUser, rowBounds);
	}

	// 셀렉트 페이먼트디테일 객체 가져옴
	public PaymentDetail selectPaymentDetail(SqlSessionTemplate sqlSession, int paymentDetailNo) {
		return sqlSession.selectOne("paymentMapper.selectPaymentDetail", paymentDetailNo);
	}

	// 셀렉트 페이먼트 객체 가져옴
	public Payment selectPayment(SqlSessionTemplate sqlSession, Payment p) {
		return sqlSession.selectOne("paymentMapper.selectPayment", p);
	}

	public List<PaymentDetail> refundAndExchangeList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("paymentMapper.checkStock", sqlSession);
	}

	public List<PaymentDetail> selectReAndExList(SqlSessionTemplate sqlSession, String loginUser, PageInfo pi) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("paymentMapper.selectReAndExList", loginUser, rowBounds);
	}

	public PaymentDetail selectPaymentDetail(SqlSessionTemplate sqlSession, PaymentDetail pd) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("paymentMapper.checkStock", pd);
	}

	// 주문리스트 페이징 처리용
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("paymentMapper.selectListCount");
	}

	// 취소리스트 페이징 처리용
	public int selectCancelListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("paymentMapper.selectCancelListCount");
	}

	// 반품, 교환 환불 리스트 페이징 처리용
	public int selectrefundAndExchangeListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("paymentMapper.selectrefundAndExchangeListCount");
	}

	// 결제 전 도서 재고 체크
	public int checkStock(SqlSessionTemplate sqlSession, String bookISBN) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("paymentMapper.checkStock", bookISBN);
	}

	// 결제정보 등록
	public int insertPayment(SqlSessionTemplate sqlSession, Payment temp) {
		// TODO Auto-generated method stub
		return sqlSession.insert("paymentMapper.insertPayment", temp);
	}

	// 결제 세부 정보 등록
	public int insertPaymentDetail(SqlSessionTemplate sqlSession, PaymentDetail pd) {
		// TODO Auto-generated method stub
		return sqlSession.insert("paymentMapper.insertPaymentDetail", pd);
	}

	// 결제후 장바구니 삭제
	public int deleteBasket(SqlSessionTemplate sqlSession, int basketNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("paymentMapper.deleteBasket", basketNo);
	}

	// 결제후 유저 포인트 업데이트
	public int updateUserPoint(SqlSessionTemplate sqlSession, Payment temp) {
		// TODO Auto-generated method stub
		return sqlSession.update("paymentMapper.updateUserPoint", temp);
	}

	// 결제후 도서 재고 업데이트
	public int updateBookStock(SqlSessionTemplate sqlSession, ShoppingBasket basket) {
		// TODO Auto-generated method stub
		return sqlSession.update("paymentMapper.updateBookStock", basket);
	}

}
