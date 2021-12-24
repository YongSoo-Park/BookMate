package com.kh.bookmate.returnBook.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.payment.model.vo.PaymentDetail;
import com.kh.bookmate.returnBook.model.vo.ReturnBook;

@Repository
public class ReturnBookDao {

	public void insertReturnBook(SqlSessionTemplate sqlSession, ReturnBook returnBook) {
		
		sqlSession.insert("ReturnBookMapper.insertReturnBook",returnBook);
		
	}

	public List<ReturnBook> selectReturnList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ReturnBookMapper.selectReturnList");
	}

	
	public List<PaymentDetail> selectReturnOrderDetailNoList(SqlSessionTemplate sqlSession,
			List<Integer> returnDetailNoList) {
		
		ArrayList<PaymentDetail> orderList = (ArrayList)sqlSession.selectList("ReturnBookMapper.selectReturnOrderDetailNoList",returnDetailNoList);
		
		//위에서 뽑은 걸 DetailList에 담음 
		List<Integer> returnOrderDetailNoList = new ArrayList<>();
			for(PaymentDetail p : orderList) {
				returnOrderDetailNoList.add(p.getPaymentDetailNo());
			}
		
		return orderList;
	}

	public void updateReturnList(SqlSessionTemplate sqlSession, int paymentDetailNo) {
		sqlSession.update("ReturnBookMapper.updateReturnList",paymentDetailNo);
		
	}

}
