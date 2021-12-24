package com.kh.bookmate.clubReview.model.service;

import java.util.List;

import com.kh.bookmate.clubReview.model.vo.ClubQna;
import com.kh.bookmate.clubReview.model.vo.ClubQnaAnswer;
import com.kh.bookmate.clubReview.model.vo.ClubReview;

public interface ClubReviewService {

	int selectParticipate(int clubNo, String userId);
	
	int selectBefReview(int clubNo, String userId);

	void insertReview(ClubReview cr);

	List<ClubReview> selectReviewList(int clubNo);

	void deleteReview(int clubNo, String userId);

	void insertQna(ClubQna cq);

	List<ClubReview> selectQnaList(int clubNo);

	ClubQna selectQna(int qnaNo);

	void insertQnaAnswer(ClubQnaAnswer cqa);

	void updateQna(int qnaNo);

	void deleteQna(int qnaNo, int type);

	//메인페이지용
	List<ClubReview> selectReviewList();

}
