package com.kh.bookmate.addressBook.model.service;

import com.kh.bookmate.addressBook.model.vo.AddressBook;

public interface AddressBookService {

	AddressBook selcetAddressBook(String userId);

	void insertAddressBook(AddressBook abook);

}
