package com.kh.bookmate.user.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.bookmate.user.model.dao.UserDao;
import com.kh.bookmate.user.model.vo.User;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private UserDao userDao;

	@Override
	public User loginUser(User u) {
		User loginUser = userDao.loginUser(sqlSession, u);
		
		
		return loginUser;
	}

	@Override
	public void insertUser(User u) {
		int result = userDao.insertUser(sqlSession, u);
		
	}

	@Override
	public String findId(User u) {
		String findId = userDao.findId(sqlSession, u);
		return findId;
	}

	//회원 탈퇴 
	@Override
	public void deleteUser(String userId){
		userDao.deleteUser(sqlSession, userId);
	}
	
	@Override
	public String findPwd(User u) {
		String findPwd = userDao.findPwd(sqlSession, u);
		return findPwd;
	}

	
	@Override
	public User selectUserPoint(String loginUser) {
		User user = userDao.selectUserPoint(sqlSession,loginUser );	
		return user;
	}

	
	@Override
	public void updatePwd(User user) {
		 userDao.updatePwd(sqlSession, user);
		
	}

	@Override
	public User updateUser(User user) {
		
		int result = userDao.updateUser(sqlSession, user);
		//	memberDao.insertMember(sqlSession, m);
			
			//예외로 타고 있어서 부등호 반대로 해봄 result < 0 일부러 예외 발생 
			if(result > 0) {
				//로그인 멤버를 반환해서 다시 조회를해서 보여주면됨
				User loginUser = userDao.loginUser(sqlSession, user);
				
				return loginUser;
			}else {
				throw new RuntimeException("회원수정 실패");

			}
	}

	@Override
	public String selectCheckPwd(String userId) {
		// TODO Auto-generated method stub
		return userDao.selectCheckPwd(sqlSession,userId);
	}
}
