package com.kh.bookmate.bookqna.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.bookqna.model.vo.BookQna;
import com.kh.bookmate.bookqna.model.vo.BookQnaAnswer;

@Repository
public class BookQnaDao {

	public int selectTotalCount(SqlSessionTemplate sqlSession, String bookISBN) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bookQnaMapper.selectTotalCount", bookISBN);
	}

	public List<BookQna> selectList(SqlSessionTemplate sqlSession, List<Object> list, RowBounds rb) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bookQnaMapper.selectList", list, rb);
	}

	public BookQna selectQnaDetail(SqlSessionTemplate sqlSession, int qnaNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bookQnaMapper.selectQnaDetail", qnaNo);
	}

	public BookQnaAnswer selectAnswerDetail(SqlSessionTemplate sqlSession, int qnaNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bookQnaMapper.selectAnswerDetail", qnaNo);
	}

	public List<BookQna> selectListAll(SqlSessionTemplate sqlSession, String bookISBN, RowBounds rb) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bookQnaMapper.selectListAll", bookISBN, rb);
	}

	public int selectKindCount(SqlSessionTemplate sqlSession, List<Object> list) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bookQnaMapper.selectKindCount", list);
	}

	public int qnaInsert(SqlSessionTemplate sqlSession, BookQna bookQna) {
		// TODO Auto-generated method stub
		return sqlSession.insert("bookQnaMapper.qnaInsert", bookQna);
	}

	public int qnaUpdate(SqlSessionTemplate sqlSession, BookQna bookQna) {
		// TODO Auto-generated method stub
		return sqlSession.update("bookQnaMapper.qnaUpdate", bookQna);
	}

	public int qnaDelete(SqlSessionTemplate sqlSession, int qnaNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("bookQnaMapper.qnaDelete", qnaNo);
	}

	public int selectA_QnaListCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bookQnaMapper.selectA_QnaListCount", map);
	}

	public List<BookQna> selectB_QnaList(SqlSessionTemplate sqlSession, Map<String, Object> map, RowBounds rb) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bookQnaMapper.selectB_QnaList", map, rb);
	}

	public BookQna selectA_QnaDetail(SqlSessionTemplate sqlSession, int qnaNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bookQnaMapper.selectA_QnaDetail", qnaNo);
	}

	public BookQnaAnswer selectA_QnaAnswerDetail(SqlSessionTemplate sqlSession, int qnaNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bookQnaMapper.selectA_QnaAnswerDetail", qnaNo);
	}

	public int intsertQnaAnswer(SqlSessionTemplate sqlSession, BookQnaAnswer qnaAnswer) {
		// TODO Auto-generated method stub
		return sqlSession.insert("bookQnaMapper.intsertQnaAnswer", qnaAnswer);
	}

	public int updateQnaInsertAnswer(SqlSessionTemplate sqlSession, int qnaNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("bookQnaMapper.updateQnaInsertAnswer", qnaNo);
	}

	public int updateQnaAnswer(SqlSessionTemplate sqlSession, BookQnaAnswer qnaAnswer) {
		// TODO Auto-generated method stub
		return sqlSession.update("bookQnaMapper.updateQnaAnswer", qnaAnswer);
	}

	public int deleteQnaAnswer(SqlSessionTemplate sqlSession, int qnaNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("bookQnaMapper.deleteQnaAnswer", qnaNo);
	}

	public int updateQnaDeleteAnswer(SqlSessionTemplate sqlSession, int qnaNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("bookQnaMapper.updateQnaDeleteAnswer", qnaNo);
	}

	public int selectMyQnaCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bookQnaMapper.selectMyQnaCount", map);
	}

	public List<BookQna> selectMyQnaList(SqlSessionTemplate sqlSession, Map<String, Object> map, RowBounds rb) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bookQnaMapper.selectMyQnaList", map, rb);
	}

}
