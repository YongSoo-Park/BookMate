package com.kh.bookmate.ubook.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.bookmate.ubook.model.vo.PageInfo;
import com.kh.bookmate.ubook.model.vo.Ubook;
import com.kh.bookmate.ubook.model.vo.Ubook_Qna;

public interface UbookService {

	void insertUbook(Ubook ubook);
	
	//Ubook selectUbook(int ubookNo);

	//List<Ubook> selectbookList();

	List<Ubook> selectbookList(int sellerNo);

	int deleteMyUbook(int ubookNo);
	
	int ubookUpdate(Ubook ubook);

	//List<Ubook> ubookCateList1();

	//List<Ubook> selectCategory(int ubCategory);
	List<Ubook> selectCategory(int ubCategory, PageInfo pi);

	Ubook selectUbook(Ubook ub);

	Ubook selectUpdateUbook(int ubookNo);

	//List<Ubook> selectbookList(String userId);
	//ArrayList<Ubook_Qna> selectQnaList(Ubook ub);

	int insertQna(Ubook_Qna qna);

	ArrayList<Ubook_Qna> selectQnaList(int ubookNo);

	int insertAnswer(Ubook_Qna qna2);

	List<Ubook> sellerBookList(Ubook sellerBook);

	ArrayList<Ubook> selectRandomBookList();

	List<Ubook> searchUbookList(String keyword);

	List<Ubook> haveQnaUbook(int sellerNumber);

	ArrayList<Ubook> selectRowPriceBookList();

	int selectListCount(int ubCategory);

	int deleteQna(int qnaNo);
}
