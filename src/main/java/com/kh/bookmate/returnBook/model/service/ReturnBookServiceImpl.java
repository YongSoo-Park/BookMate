package com.kh.bookmate.returnBook.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.payment.model.vo.PaymentDetail;
import com.kh.bookmate.returnBook.model.dao.ReturnBookDao;
import com.kh.bookmate.returnBook.model.vo.ReturnBook;

@Service
public class ReturnBookServiceImpl implements ReturnBookService {

	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private ReturnBookDao returnBookDao;
	
	@Override
	public void insertReturnBook(ReturnBook returnBook) {
		returnBookDao.insertReturnBook(sqlSession,returnBook);
		
		
	}

	@Override
	public List<ReturnBook> selectReturnList() {
		List<ReturnBook> rList = returnBookDao.selectReturnList(sqlSession);
		return rList;
	}

	@Override
	public List<PaymentDetail> selectReturnOrderDetailNoList(List<Integer> returnDetailNoList) {
		 List<PaymentDetail> List = returnBookDao.selectReturnOrderDetailNoList(sqlSession,returnDetailNoList);
		return List;
	}

	@Override
	public void updateReturnList(int paymentDetailNo) {
		returnBookDao.updateReturnList(sqlSession,paymentDetailNo);
		
	}
		
}
