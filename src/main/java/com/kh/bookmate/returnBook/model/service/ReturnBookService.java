package com.kh.bookmate.returnBook.model.service;

import java.util.List;

import com.kh.bookmate.payment.model.vo.PaymentDetail;
import com.kh.bookmate.returnBook.model.vo.ReturnBook;

public interface ReturnBookService {

	void insertReturnBook(ReturnBook returnBook);

	List<ReturnBook> selectReturnList();

	List<PaymentDetail> selectReturnOrderDetailNoList(List<Integer> returnDetailNoList);

	void updateReturnList(int paymentDetailNo);

}
