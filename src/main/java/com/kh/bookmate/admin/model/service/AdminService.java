package com.kh.bookmate.admin.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kh.bookmate.admin.model.vo.AdminUser;
import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.club.model.vo.Club;
import com.kh.bookmate.user.model.vo.User;

public interface AdminService {

	int clubListCount(String keyword);

	List<Club> selectClubConfirmList(String keyword, RowBounds rb);

	void updateClubConfirm(Map<String, Object> map);

	int selectLessStockCount(int checkStock);

	List<Book> selectLessStockBook(RowBounds rb, int checkStock);


	int selectAllUserCount(Map<String, Object> map);

	List<AdminUser> selectAllUserList(Map<String, Object> map, RowBounds rb);

	int selectBannedUserCount(Map<String, Object> map);

	List<AdminUser> selectBannedUserList(Map<String, Object> map, RowBounds rb);

	void updateUserRestore(String user_Id);

	AdminUser selectBanUser(Map<String, Object> map);

	void updateUserBan(String user_Id);


}
