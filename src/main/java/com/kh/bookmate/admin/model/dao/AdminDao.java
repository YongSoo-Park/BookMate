package com.kh.bookmate.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.admin.model.vo.AdminUser;
import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.club.model.vo.Club;
import com.kh.bookmate.user.model.vo.User;

@Repository
public class AdminDao {

	public int selectLessStockCount(SqlSessionTemplate sqlSession, int checkStock) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.selectLessStockCount", checkStock);
	}

	public List<Book> selectLessStockBook(SqlSessionTemplate sqlSession, RowBounds rb, int checkStock) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminMapper.selectLessStockBook", checkStock, rb);
	}

	public int selectAllUserCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.selectAllUserCount", map);
	}

	public List<AdminUser> selectAllUserList(SqlSessionTemplate sqlSession, Map<String, Object> map, RowBounds rb) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminMapper.selectAllUserList", map, rb);
	}

	public int selectBannedUserCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.selectBannedUserCount", map);
	}

	public List<AdminUser> selectBannedUserList(SqlSessionTemplate sqlSession, Map<String, Object> map, RowBounds rb) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminMapper.selectBannedUserList", map, rb);
	}

	public int updateUserRestore(SqlSessionTemplate sqlSession, String user_Id) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.updateUserRestore", user_Id);
	}

	public AdminUser selectBanUser(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.selectBanUser", map);
	}

	public int updateUserBan(SqlSessionTemplate sqlSession, String user_Id) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.updateUserBan", user_Id);
	}

	public int clubListCount(SqlSessionTemplate sqlSession, String keyword) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.clubListCount", keyword);
	}

	public List<Club> selectClubConfirmList(SqlSessionTemplate sqlSession, String keyword, RowBounds rb) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminMapper.selectClubConfirmList", keyword, rb);
	}

	public int updateClubConfirm(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.updateClubConfirm", map);
	}

}
