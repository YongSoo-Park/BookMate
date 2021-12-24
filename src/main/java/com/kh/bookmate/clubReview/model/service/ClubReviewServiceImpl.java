package com.kh.bookmate.clubReview.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.clubApply.model.dao.ClubApplyDao;
import com.kh.bookmate.clubReview.model.dao.ClubReviewDao;
import com.kh.bookmate.clubReview.model.vo.ClubQna;
import com.kh.bookmate.clubReview.model.vo.ClubQnaAnswer;
import com.kh.bookmate.clubReview.model.vo.ClubReview;

@Service
public class ClubReviewServiceImpl implements ClubReviewService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ClubReviewDao clubReviewDao;
	
	@Autowired
	private ClubApplyDao clubApplyDao;
	
	@Override
	public int selectParticipate(int clubNo, String userId) {
		// TODO Auto-generated method stub
		return clubReviewDao.selectParticipate(sqlSession, clubNo, userId);
	}
	
	@Override
	public int selectBefReview(int clubNo, String userId) {
		// TODO Auto-generated method stub
		return clubReviewDao.selectBefReview(sqlSession, clubNo, userId);
	}

	@Override
	public void insertReview(ClubReview cr) {
		//1) clubReview테이블에 넣기
		int result = clubReviewDao.insertReview(sqlSession,cr);
		//2) clubapply테이블 review_status 필드 update
		int result2 = clubApplyDao.updateReviewStatus(sqlSession, cr);
		
		if(result < 0 || result2<=0) {
			throw new RuntimeException("독서모임 리뷰 추가 오류");
		}
	}

	@Override
	public List<ClubReview> selectReviewList(int clubNo) {
		// TODO Auto-generated method stub
		return clubReviewDao.selectReviewList(sqlSession, clubNo);
	}

	@Override
	public void deleteReview(int clubNo, String userId) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("clubNo", clubNo);
		
		int result = clubReviewDao.deleteReview(sqlSession,map);
		int result2 = clubApplyDao.updateReviewStatus_del(sqlSession, map);
		
		if(result < 0 || result2<=0) {
			throw new RuntimeException("독서모임 리뷰 삭제 오류");
		}
	}

	@Override
	public void insertQna(ClubQna cq) {
		int result = clubReviewDao.insertQna(sqlSession,cq);
		if(result < 0) {
			throw new RuntimeException("독서모임 qna 추가 오류");
		}
	}

	@Override
	public List<ClubReview> selectQnaList(int clubNo) {
		// TODO Auto-generated method stub
		return clubReviewDao.selectQnaList(sqlSession, clubNo);
	}

	@Override
	public ClubQna selectQna(int qnaNo) {
		// TODO Auto-generated method stub
		return clubReviewDao.selectQna(sqlSession, qnaNo);
	}

	@Override
	public void insertQnaAnswer(ClubQnaAnswer cqa) {
		int result = clubReviewDao.insertQnaAnswer(sqlSession,cqa);
		if(result < 0) {
			throw new RuntimeException("독서모임 qna 답변 추가 오류");
		}
	}

	@Override
	public void updateQna(int qnaNo) {
		int result = clubReviewDao.updateQna(sqlSession,qnaNo);
		if(result <= 0) {
			throw new RuntimeException("독서모임 qna 추가 오류");
		}
	}

	@Override
	public void deleteQna(int qnaNo, int type) {
		int result;
		int result2 = 1;
		if(type == 1) {
			result = clubReviewDao.deleteQna(sqlSession,qnaNo);
		}else {
			//CLUBQNAANSWER테이블에서 삭제 & CLUBQNA테이블 QNAANSWER상태 'N'으로 바꾸기
			result = clubReviewDao.deleteQnaAnswer(sqlSession,qnaNo);
			result2 = clubReviewDao.updateQnaAnswerStatus(sqlSession,qnaNo);
		}
		if(result < 0 || result2 <= 0) {
			throw new RuntimeException("독서모임 qna 삭제 오류");
		}
	}

	@Override
	public List<ClubReview> selectReviewList() {
		// TODO Auto-generated method stub
		return clubReviewDao.selectReviewList(sqlSession);
	}

}
