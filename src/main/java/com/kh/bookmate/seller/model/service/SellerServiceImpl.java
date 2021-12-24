package com.kh.bookmate.seller.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.seller.model.dao.SellerDao;
import com.kh.bookmate.seller.model.vo.Seller;
import com.kh.bookmate.ubook.model.vo.Ubook;

@Service
public class SellerServiceImpl implements SellerService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SellerDao sellerDao;

	@Override
	public void insertSeller(Seller s) {
		int result = sellerDao.insertUser(sqlSession, s);
	}

	@Override
	public Seller loginSeller(String userId) {
		Seller loginSeller = sellerDao.loginSeller(sqlSession, userId);
		return loginSeller;
	}


	@Override
	public int updateSeller(Seller s) {
		int result = sellerDao.updateSeller(sqlSession, s);
		return result;
	}

	@Override
	public int deleteSeller(Seller s) {
		int result = sellerDao.deleteSeller(sqlSession, s);
		return result;
	}
	/*
	@Override
	public List<Ubook> selectMyUbook(String userId) {

		List<Ubook> list = sellerDao.selectMyUbook(sqlSession, userId);
		
		return list;
	}

@Override
	public void deleteSeller(Seller s, String userPwd) {
		int result = sellerDao.deleteSeller(sqlSession, s, userPwd);
		
	}*/

	@Override
	public int chkNickN(String sellerNickN) {
		return sellerDao.chkNickN(sqlSession, sellerNickN);
	}

/*	@Override
	public void updateSeller(Seller s) {
		int result = sellerDao.updateSeller(sqlSession, s);

		if (result > 0) {
			Seller loginSeller = sellerDao.loginSeller(sqlSession, s);
			return loginSeller;
		}
	}


	/*
	 * @Override public void inserSeller(Seller s) { int result =
	 * sellerDao.insertSeller(sqlSession, s);
	 * 
	 * }
	 */


}
