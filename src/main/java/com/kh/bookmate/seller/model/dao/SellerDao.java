package com.kh.bookmate.seller.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.seller.model.vo.Seller;
import com.kh.bookmate.ubook.model.vo.Ubook;
@Repository
public class SellerDao {

	public int insertUser(SqlSessionTemplate sqlSession, Seller s) {
		return sqlSession.insert("sellerMapper.insertSeller",s);
	}

	public Seller loginSeller(SqlSessionTemplate sqlSession, String userId) {
		//Seller s1 = sqlSession.selectOne("sellerMapper.loginSeller", userId);
		return sqlSession.selectOne("sellerMapper.loginSeller", userId);
	}

	public int updateSeller(SqlSessionTemplate sqlSession, Seller s) {
		return sqlSession.update("sellerMapper.updateSeller", s);
	}

	public int deleteSeller(SqlSessionTemplate sqlSession, Seller s) {
		System.out.println("-------dao -----------s" + s);
		//return sqlSession.update("sellerMapper.deleteSeller", s);
		return sqlSession.delete("sellerMapper.deleteSeller", s);
	}
/*
	public List<Ubook> selectMyUbook(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectList("sellerMapper.selectMyUbook", userId);
	}
*/

	public int chkNickN(SqlSessionTemplate sqlSession, String sellerNickN) {
		return sqlSession.selectOne("sellerMapper.chkNickN", sellerNickN);
	}
}
