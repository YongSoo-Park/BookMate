package com.kh.bookmate.admin.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.admin.model.dao.AdminDao;
import com.kh.bookmate.admin.model.vo.AdminUser;
import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.club.model.vo.Club;
import com.kh.bookmate.user.model.vo.User;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private AdminDao adminDao;

	// 재고 위험 도서 리스트 카운트
	@Override
	public int selectLessStockCount(int checkStock) {
		// TODO Auto-generated method stub
		return adminDao.selectLessStockCount(sqlSession, checkStock);
	}

	// 재고 위험 도서 리스트
	@Override
	public List<Book> selectLessStockBook(RowBounds rb, int checkStock) {
		// TODO Auto-generated method stub
		return adminDao.selectLessStockBook(sqlSession, rb, checkStock);
	}

	// 모든 회원 리스트 카운트
	@Override
	public int selectAllUserCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return adminDao.selectAllUserCount(sqlSession, map);
	}

	// 모든 회원 리스트
	@Override
	public List<AdminUser> selectAllUserList(Map<String, Object> map, RowBounds rb) {
		// TODO Auto-generated method stub
		return adminDao.selectAllUserList(sqlSession, map, rb);
	}

	// 자격 정지중인 회원 카운트
	@Override
	public int selectBannedUserCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return adminDao.selectBannedUserCount(sqlSession, map);
	}

	// 자격 정지중인 회원 리스트
	@Override
	public List<AdminUser> selectBannedUserList(Map<String, Object> map, RowBounds rb) {
		// TODO Auto-generated method stub
		return adminDao.selectBannedUserList(sqlSession, map, rb);
	}

	// 자격정지 회원 자격 복구
	@Override
	public void updateUserRestore(String user_Id) {

		int result = adminDao.updateUserRestore(sqlSession, user_Id);
		if (result < 1) {
			throw new RuntimeException("유저 정지 해제 업데이트중 db 오류");
		}
	}

	// 자격 정지를 위한 회원 불러오기
	@Override
	public AdminUser selectBanUser(Map<String, Object> map) {

		return adminDao.selectBanUser(sqlSession, map);
	}

	// 선택 회원 자격정지
	@Override
	public void updateUserBan(String user_Id) {
		int result = adminDao.updateUserBan(sqlSession, user_Id);
		if (result < 1) {
			throw new RuntimeException("유저 자격 정지 업데이트중 db 오류");
		}

	}

	// 독서 모임 신청 리스트 카운트
	@Override
	public int clubListCount(String keyword) {
		// TODO Auto-generated method stub
		return adminDao.clubListCount(sqlSession, keyword);
	}

	// 독서 모임 신청 리스트
	@Override
	public List<Club> selectClubConfirmList(String keyword, RowBounds rb) {
		// TODO Auto-generated method stub

		return adminDao.selectClubConfirmList(sqlSession, keyword, rb);
	}

	// 신청 독서모임 승인 반려 업데이트
	@Override
	public void updateClubConfirm(Map<String, Object> map) {

		int result = adminDao.updateClubConfirm(sqlSession, map);
		if (result < 1) {
			throw new RuntimeException("독서모임 승인업데이트중 db 오류");
		}

	}

}
