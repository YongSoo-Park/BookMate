package com.kh.bookmate.bookqna.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kh.bookmate.bookqna.model.vo.BookQna;
import com.kh.bookmate.bookqna.model.vo.BookQnaAnswer;
import com.kh.bookmate.common.Paging;

public interface BookQnaService {

	int selectTotalCount(String bookISBN, int questionKind, String user_Id);

	List<BookQna> selectList(String bookISBN, Paging qnaPaging, int questionKind, String user_Id);

	List<String> selectQnaDetail(int qnaNo);

	void qnaInsert(BookQna bookQna);

	void qnaUpdate(BookQna bookQna);

	void qnaDelete(int qnaNo);

	int selectA_QnaListCount(int searchKind, String searchKeyword, int isAnswer);

	List<BookQna> selectB_QnaList(int searchKind, String keyword, int isAnswer, RowBounds rb);

	BookQna selectA_QnaDetail(int qnaNo);

	BookQnaAnswer selectA_QnaAnswerDetail(int qnaNo);

	void intsertQnaAnswer(BookQnaAnswer qnaAnswer);

	void updateQnaAnswer(BookQnaAnswer qnaAnswer);

	void deleteQnaAnswer(int qnaNo);

}
