package com.kh.bookmate.clubReview.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.clubReview.model.vo.ClubQna;
import com.kh.bookmate.clubReview.model.vo.ClubQnaAnswer;
import com.kh.bookmate.clubReview.model.vo.ClubReview;

@Repository
public class ClubReviewDao {

	public int selectParticipate(SqlSessionTemplate sqlSession, int clubNo, String userId) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("clubNo", clubNo);
		return sqlSession.selectOne("clubReviewMapper.selectParticipate", map);
	}
	
	public int selectBefReview(SqlSessionTemplate sqlSession, int clubNo, String userId) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("clubNo", clubNo);
		return sqlSession.selectOne("clubReviewMapper.selectBefReview", map);
	}

	public int insertReview(SqlSessionTemplate sqlSession, ClubReview cr) {
		// TODO Auto-generated method stub
		return sqlSession.insert("clubReviewMapper.insertReview", cr);
	}

	public List<ClubReview> selectReviewList(SqlSessionTemplate sqlSession, int clubNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("clubReviewMapper.selectReviewList", clubNo);
	}

	public int deleteReview(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		
		return sqlSession.update("clubReviewMapper.deleteReview", map);
	}

	public int insertQna(SqlSessionTemplate sqlSession, ClubQna cq) {
		// TODO Auto-generated method stub
		return sqlSession.insert("clubReviewMapper.insertQna", cq);
	}

	public List<ClubReview> selectQnaList(SqlSessionTemplate sqlSession, int clubNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("clubReviewMapper.selectQnaList", clubNo);
	}

	public ClubQna selectQna(SqlSessionTemplate sqlSession, int qnaNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("clubReviewMapper.selectQna", qnaNo);
	}

	public int insertQnaAnswer(SqlSessionTemplate sqlSession, ClubQnaAnswer cqa) {
		// TODO Auto-generated method stub
		return sqlSession.insert("clubReviewMapper.insertQnaAnswer", cqa);
	}

	public int updateQna(SqlSessionTemplate sqlSession, int qnaNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("clubReviewMapper.updateQna", qnaNo);
	}

	public int deleteQna(SqlSessionTemplate sqlSession, int qnaNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("clubReviewMapper.deleteQna", qnaNo);
	}

	public int deleteQnaAnswer(SqlSessionTemplate sqlSession, int qnaNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("clubReviewMapper.deleteQnaAnswer", qnaNo);
	}

	public int updateQnaAnswerStatus(SqlSessionTemplate sqlSession, int qnaNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("clubReviewMapper.updateQnaAnswerStatus", qnaNo);
	}

	public List<ClubReview> selectReviewList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("clubReviewMapper.selectReviewList_all");
	}
}
