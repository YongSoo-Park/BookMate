package com.kh.bookmate.seller.model.service;

import java.util.List;

import com.kh.bookmate.seller.model.vo.Seller;
import com.kh.bookmate.ubook.model.vo.Ubook;

public interface SellerService {
	
	void insertSeller(Seller s);

	Seller loginSeller(String userId);

	//Seller updateSeller(String userId) throws Exception;
	//void updateSeller(Seller s);

	//void updateSeller(Seller s1) throws Exception;

	int updateSeller(Seller s);
	
	int deleteSeller(Seller s);

	int chkNickN(String sellerNickN);

	//List<Ubook> selectMyUbook(String userId);

	//void deleteSeller(Seller s, String userPwd);
}
