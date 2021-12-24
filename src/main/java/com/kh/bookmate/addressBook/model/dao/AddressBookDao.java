package com.kh.bookmate.addressBook.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.addressBook.model.vo.AddressBook;

@Repository
public class AddressBookDao {

	public int insertAddressBook(SqlSessionTemplate sqlSession, AddressBook abook) {
		// TODO Auto-generated method stub
		return sqlSession.insert("addressBookMapper.insertAddressBook",abook);
	}

	public AddressBook selcetAddressBook(SqlSessionTemplate sqlSession, String user_Id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("addressBookMapper.selcetAddressBook",user_Id);
	}

	
	// 마이페이지 주소록 리스트 
	public List<AddressBook> selectMyAddressList(SqlSessionTemplate sqlSession, String loginUser) {
		
		return sqlSession.selectList("addressBookMapper.selectMyAddressList",loginUser);
	}

	public int updateLatelyAddress(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("addressBookMapper.updateLatelyAddress",map);
	}

}
