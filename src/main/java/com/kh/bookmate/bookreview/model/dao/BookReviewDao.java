package com.kh.bookmate.bookreview.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.bookreview.model.vo.BookReview;
import com.kh.bookmate.bookreview.model.vo.BookReviewReply;
import com.kh.bookmate.common.PageInfo;
import com.kh.bookmate.payment.model.vo.PaymentDetail;

@Repository
public class BookReviewDao {

	public int insertReview(SqlSessionTemplate sqlSession, BookReview bookReview) {
		// TODO Auto-generated method stub
		return sqlSession.insert("reviewMapper.insertReview", bookReview);
	}

	public int updateReviewWriter(SqlSessionTemplate sqlSession, BookReview bookReview) {
		// TODO Auto-generated method stub
		return sqlSession.update("reviewMapper.updateReviewWriter", bookReview);
	}

	public int selectTotalCount(SqlSessionTemplate sqlSession, String bookISBN) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reviewMapper.selectTotalCount", bookISBN);
	}

	public List<BookReview> selectReviewList(SqlSessionTemplate sqlSession, RowBounds rb, List<Object> list) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("reviewMapper.selectReviewList", list, rb);
	}

	public int insertIdCheck(SqlSessionTemplate sqlSession, List<String> list) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reviewMapper.insertIdCheck", list);
	}

	public List<BookReviewReply> selectReviewReply(SqlSessionTemplate sqlSession, int reviewNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("reviewMapper.selectReviewReply", reviewNo);
	}

	public int updateReview(SqlSessionTemplate sqlSession, BookReview review) {
		// TODO Auto-generated method stub
		return sqlSession.update("reviewMapper.updateReview", review);
	}

	public int insertReviewReply(SqlSessionTemplate sqlSession, BookReviewReply reviewReply) {
		// TODO Auto-generated method stub
		return sqlSession.insert("reviewMapper.insertReviewReply", reviewReply);
	}

	public int updateReviewReplyInsert(SqlSessionTemplate sqlSession, BookReview temp) {
		// TODO Auto-generated method stub
		return sqlSession.update("reviewMapper.updateReviewReplyInsert", temp);
	}

	public int updateDeleteReply(SqlSessionTemplate sqlSession, BookReviewReply reviewReply) {
		// TODO Auto-generated method stub
		return sqlSession.update("reviewMapper.updateDeleteReply", reviewReply);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, BookReviewReply reviewReply) {
		// TODO Auto-generated method stub
		return sqlSession.delete("reviewMapper.deleteReply", reviewReply);
	}

	public int updateReply(SqlSessionTemplate sqlSession, BookReviewReply reviewReply) {
		// TODO Auto-generated method stub
		return sqlSession.update("reviewMapper.updateReply", reviewReply);
	}

	public int insertAnswer(SqlSessionTemplate sqlSession, BookReviewReply reviewReply) {
		// TODO Auto-generated method stub
		return sqlSession.insert("reviewMapper.insertAnswer", reviewReply);
	}

	public int updateReplyAnswerInsert(SqlSessionTemplate sqlSession, BookReviewReply reviewReply) {
		// TODO Auto-generated method stub
		return sqlSession.update("reviewMapper.updateReplyAnswerInsert", reviewReply);
	}

	public int deleteAnswer(SqlSessionTemplate sqlSession, BookReviewReply reviewReply) {
		// TODO Auto-generated method stub
		return sqlSession.delete("reviewMapper.deleteAnswer", reviewReply);
	}

	public int updateReplyDeleteAnswer(SqlSessionTemplate sqlSession, BookReviewReply reviewReply) {
		// TODO Auto-generated method stub
		return sqlSession.update("reviewMapper.updateReplyDeleteAnswer", reviewReply);
	}

	public int insertConfirmOrder(SqlSessionTemplate sqlSession, List<Object> ibr) {
		// TODO Auto-generated method stub
		return sqlSession.insert("reviewMapper.insertConfirmOrder", ibr);
	}

	// 마이페이지 북 리뷰 리스트
	public List<BookReview> selectReviewListMine(SqlSessionTemplate sqlSession, String loginUser, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("reviewMapper.selectReviewListMine", loginUser, rowBounds);
	}

	// 마이페이지 북리뷰 페이징 처리용
	public int selectReviewListMineCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reviewMapper.selectReviewListMineCount");
	}

}
