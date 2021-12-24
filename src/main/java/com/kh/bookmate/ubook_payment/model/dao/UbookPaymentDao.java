package com.kh.bookmate.ubook_payment.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.payment.model.vo.Payment;
import com.kh.bookmate.payment.model.vo.PaymentDetail;
import com.kh.bookmate.ubook_payment.model.vo.UbookPayment;
import com.kh.bookmate.ubook_payment.model.vo.UbookPaymentDetail;

@Repository
public class UbookPaymentDao {

	//결제정보 등록
	public int insertUbookPayment(SqlSessionTemplate sqlSession, UbookPayment temp) {
		// TODO Auto-generated method stub
		return sqlSession.insert("ubookPaymentMapper.insertUbookPayment",temp);
	}

	public int insertUbookPaymentDetail(SqlSessionTemplate sqlSession, UbookPaymentDetail upd) {
		// TODO Auto-generated method stub
		return sqlSession.insert("ubookPaymentMapper.insertUbookPaymentDetailUb",upd);
	}

	public int deleteCart(SqlSessionTemplate sqlSession, int cartNo) {
		return sqlSession.delete("ubookPaymentMapper.deleteCart",cartNo);
	}
	public int updateUbookStock(SqlSessionTemplate sqlSession, int ubookNoUb) {
		return sqlSession.update("ubookPaymentMapper.updateUbookStock",ubookNoUb);
	}

	public List<UbookPayment> selectMyOrderList(SqlSessionTemplate sqlSession, String loginUser) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("ubookPaymentMapper.selectMyOrderList", loginUser);
	}

	public int selectListCount(SqlSessionTemplate sqlSession, String loginUser) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ubookPaymentMapper.selectListCount",loginUser);
	}

	public List<UbookPaymentDetail> selectMyOrderListDetail(SqlSessionTemplate sqlSession, int paymentNoUb) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("ubookPaymentMapper.selectMyOrderListDetail", paymentNoUb);

	}

	public int confirmOrder(SqlSessionTemplate sqlSession, int paymentDetailNoUb) {
		return sqlSession.update("ubookPaymentMapper.confirmOrder",paymentDetailNoUb);
	}

	public UbookPayment selectPaymentNo(SqlSessionTemplate sqlSession, int paymentNoUb) {
		return sqlSession.selectOne("ubookPaymentMapper.selectPaymentNo" , paymentNoUb);
	}

	public List<UbookPaymentDetail> selectDeliveryList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ubookPaymentMapper.selectDeliveryList");
	}

	public List<UbookPayment> selectDeliveryPaymentNoList(SqlSessionTemplate sqlSession,
			List<Integer> deliveryDetailNoList) {
		ArrayList<UbookPayment> deliList = (ArrayList)sqlSession.selectList("ubookPaymentMapper.selectDeliveryPaymentNoList",deliveryDetailNoList);
		
		List<Integer> Nolist= new ArrayList<>();
			for(UbookPayment p: deliList) {
				Nolist.add(p.getPaymentNoUb());
			}
		return deliList;
	}

	//결제된 도서 정보
	public List<UbookPaymentDetail> selectOrderUbookList(SqlSessionTemplate sqlSession,int bSellerNo) {
		return sqlSession.selectList("ubookPaymentMapper.selectOrderUbookList",bSellerNo);
	}

	public UbookPaymentDetail selectOrderUbookInfo(SqlSessionTemplate sqlSession, UbookPaymentDetail ubookPayDetail) {
		return sqlSession.selectOne("ubookPaymentMapper.selectOrderUbookInfo" , ubookPayDetail);
	}



	//주문자 정보 보기
	public UbookPayment selectOrderUserInfo(SqlSessionTemplate sqlSession, int paymentNoUb) {
		return sqlSession.selectOne("ubookPaymentMapper.selectOrderUserInfo" , paymentNoUb);
	}

	//도서 정보 보기
	public UbookPaymentDetail selectOrderBookInfo(SqlSessionTemplate sqlSession, UbookPaymentDetail upd) {
		return sqlSession.selectOne("ubookPaymentMapper.selectOrderBookInfo" , upd);
	}

	//주문 상태 수정
	public int updateOrderInfo(SqlSessionTemplate sqlSession, UbookPaymentDetail updUp) {
		return sqlSession.update("ubookPaymentMapper.updateOrderInfo" , updUp);
	}

	//판매 완료 리스트
	public List<UbookPaymentDetail> selectSoldUbookList(SqlSessionTemplate sqlSession, int bSellerNo) {

		return sqlSession.selectList("ubookPaymentMapper.selectSoldUbookList",bSellerNo);
	}

	//[중고] 주문리스트 불러오기 
	public List<UbookPayment> selectUbookMyOrderList(SqlSessionTemplate sqlSession, String loginUser) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ubookPaymentMapper.selectUbookMyOrderList",loginUser);
	}
	
	//[중고] 상세주문리스트 불러오기 
	public List<UbookPaymentDetail> selectUbookMyOrderDetailList(SqlSessionTemplate sqlSession, int paymentNoUb) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("ubookPaymentMapper.selectUbookMyOrderDetailList",paymentNoUb);
	}
	//[중고] 배송완료 후 구매확정 
	public void confirmOrderUbook(SqlSessionTemplate sqlSession, int paymentDetailNoUb) {
		// TODO Auto-generated method stub
		 sqlSession.update("ubookPaymentMapper.confirmOrderUbook",paymentDetailNoUb);
	}



	
} 


