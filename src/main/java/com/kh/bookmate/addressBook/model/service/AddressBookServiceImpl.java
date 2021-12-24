package com.kh.bookmate.addressBook.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.addressBook.model.dao.AddressBookDao;
import com.kh.bookmate.addressBook.model.vo.AddressBook;

@Service
public class AddressBookServiceImpl implements AddressBookService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AddressBookDao addressBookDao;

	//주소록  가져오기
	@Override
	public AddressBook selcetAddressBook(String userId) {
		// TODO Auto-generated method stub
		return addressBookDao.selcetAddressBook(sqlSession,userId);
	}

	//주소록이 생성되지 않은 신규 사용자라면 회원가입때 입력한 주소를 메인주소로 주소록 생성
	@Override
	public void insertAddressBook(AddressBook abook) {
		addressBookDao.insertAddressBook(sqlSession, abook);
		
		
	}

}
