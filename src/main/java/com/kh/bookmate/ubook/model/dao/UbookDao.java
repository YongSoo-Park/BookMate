package com.kh.bookmate.ubook.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.ubook.model.vo.PageInfo;
import com.kh.bookmate.ubook.model.vo.Ubook;
import com.kh.bookmate.ubook.model.vo.Ubook_Qna;

@Repository
public class UbookDao {

	public int insertUbook(SqlSession sqlSession, Ubook ubook) {
		return sqlSession.insert("ubookMapper.insertUbook",ubook);
	}
/*
	public Ubook selectUbook(SqlSessionTemplate sqlSession, int ubookNo) {
		System.out.println("dao----" + ubookNo);
		return sqlSession.selectOne("ubookMapper.selectUbook",ubookNo);
	}

	public List<Ubook> selectbookListCount(SqlSessionTemplate sqlSession) {
		List list1 =  sqlSession.selectList("ubookMapper.selectbookListCount");
		System.out.println("dao----" + list1);
		return list1;
	}

	public List<Ubook> selectbookList(SqlSession sqlSession) {
		List list1 =  sqlSession.selectList("ubookMapper.selectbookList");
		System.out.println("dao----" + list1);
		return list1;
	}*/
/*
	public List<Ubook> selectbookList(SqlSession sqlSession, String userId) {
		List list1 =  sqlSession.selectList("ubookMapper.selectbookList", userId);
		System.out.println("dao----" + list1);
		return list1;
	}*/

	public List<Ubook> selectbookList(SqlSession sqlSession, int sellerNo) {
		List list1 =  sqlSession.selectList("ubookMapper.selectbookList", sellerNo);
		return list1;
	}

	public int deleteMyUbook(SqlSession sqlSession, int ubookNo) {
		System.out.println("dao의 결과: " + ubookNo);
		return sqlSession.delete("ubookMapper.deleteMyUbook",ubookNo);
	}
	
/*
	public List<Ubook> ubookCateList1(SqlSession sqlSession) {
		return sqlSession.selectList("ubookMapper.ubookCateList1");
	}

	public List<Ubook> selectCategory(SqlSessionTemplate sqlSession, int ubCategory) {
		System.out.println("dao----" + ubCategory);
		return sqlSession.selectList("ubookMapper.selectCategory",ubCategory);
	}
*/
	public List<Ubook> selectCategory(SqlSessionTemplate sqlSession,int ubCategory, PageInfo pi) {
		System.out.println("dao----" + pi);
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("ubookMapper.selectCategory",ubCategory,rowBounds);
	}
	
	public int ubookUpdate(SqlSessionTemplate sqlSession, Ubook ubook) {
	return sqlSession.update("ubookMapper.updateUbook", ubook);
	}

	public Ubook selectUbook(SqlSessionTemplate sqlSession, Ubook ub) {
		System.out.println("dao----" + ub);
		return sqlSession.selectOne("ubookMapper.selectUbook",ub);
	}

	public Ubook selectUpdateUbook(SqlSessionTemplate sqlSession, int ubookNo) {
		System.out.println("dao----" + ubookNo);
		return sqlSession.selectOne("ubookMapper.selectUpdateUbook",ubookNo);
	}

	public ArrayList<Ubook_Qna> selectQnaList(SqlSessionTemplate sqlSession, int ubookNo) {
		return (ArrayList)sqlSession.selectList("ubookMapper.selectQnaList",ubookNo);
	}

	public int insertQna(SqlSessionTemplate sqlSession, Ubook_Qna qna) {
		return sqlSession.insert("ubookMapper.insertQna",qna);
	}

	public int insertAnswer(SqlSessionTemplate sqlSession, Ubook_Qna qna2) {
		return sqlSession.insert("ubookMapper.insertAnswer",qna2);
	}

	public List<Ubook> sellerBookList(SqlSessionTemplate sqlSession, Ubook sellerBook) {
		System.out.println("sellerBook????" + sellerBook);
		return sqlSession.selectList("ubookMapper.sellerBookList",sellerBook);
	}

	public ArrayList<Ubook> selectRandomBookList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("ubookMapper.selectRandomBookList");
	}

	public List<Ubook> searchUbookList(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectList("ubookMapper.searchUbook",keyword);
	}

	public List<Ubook> haveQnaUbook(SqlSessionTemplate sqlSession, int sellerNumber) {
		System.out.println("sellerNo????" + sellerNumber);
		return sqlSession.selectList("ubookMapper.haveQnaUbook",sellerNumber);
	}

	public ArrayList<Ubook> selectRowPriceBookList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("ubookMapper.selectRowPriceBookList");
	}

	public int selectListCount(SqlSessionTemplate sqlSession, int ubCategory) {
		return sqlSession.selectOne("ubookMapper.selectListCount", ubCategory);
	}

	public int deleteQna(SqlSessionTemplate sqlSession, int qnaNo) {
		System.out.println("qnaNo????" + qnaNo);
		return sqlSession.delete("ubookMapper.deleteQna",qnaNo);
	}

}
