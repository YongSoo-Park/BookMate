/* 파일 설명 : 서비스(독서모임-개설신청,수정,삭제)
 * 담당자  : 황서연
 * 수정날짜 : 2021.11.01
 * 수정필요 : 오류처리 (dao결과에 따른)
 * */
package com.kh.bookmate.club.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.club.model.dao.ClubDao;
import com.kh.bookmate.club.model.vo.Club;
import com.kh.bookmate.club.model.vo.ClubAttachment;
import com.kh.bookmate.club.model.vo.SearchCondition;
import com.kh.bookmate.clubApply.model.vo.ClubApply;
import com.kh.bookmate.common.PageInfo;

@Service
public class ClubServiceImpl implements ClubService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ClubDao clubDao;
	
	
	@Override
	public int checkHost(String hostName) {
		
		return clubDao.checkHost(sqlSession, hostName);
	}

	@Override
	public int insertStep1(Club c, ClubAttachment ca) {
		// TODO Auto-generated method stub
		int result = 0;
		result = clubDao.saveStep1(sqlSession, c);  	 //1) Club테이블에 넣기
		if(ca != null) {
			result = clubDao.saveStep1(sqlSession, ca);  //2) Club_attachment 테이블에 넣기
		}
		
		if(result < 0) {
			throw new RuntimeException("독서모임 개설 1단계 중 저장 중 오류");
		}
		
		return c.getClubNo(); //바로 앞에 추가한 행 clubNo컨트롤러로
	}

	@Override
	public void insertStep2(Club c, ClubAttachment ca) {
		// TODO Auto-generated method stub

		int result1 = clubDao.saveStep2(sqlSession, c);  	 //1) Club테이블에 넣기
		int result2 = 1;
		if(ca != null) {
			result2 = clubDao.saveStep2(sqlSession, ca);  //2) Club_attachment 테이블에 넣기
		}

		if(result1 <= 0 || result2 <= 0) {  //11/29 update 에러 -> 결과값:0이어서 이렇게 처리
			//throw new RuntimeException("독서모임 개설 2단계 중 저장 중 오류");
		}
	}

	@Override
	public void insertStep3(Club c, ClubAttachment ca, Map<String, Object> map) {
		int result1 = clubDao.saveStep3(sqlSession, c);  	 //1) Club테이블에 넣기
		int result2 = clubDao.saveStep3(sqlSession, map);    //2) ClubTime테이블에 넣기
		int result3 =1;
		if(ca != null) {
			result3 = clubDao.saveStep2(sqlSession, ca);  //3) Club_attachment 테이블에 넣기
		}

		if(result1 <= 0 || result2 <= 0 || result3 <= 0) {  //11/29 update 에러 -> 결과값:0이어서 이렇게 처리
			throw new RuntimeException("독서모임 개설 3단계 중 저장 중 오류");
		}
		
	}

	@Override
	public void insertClub(Club c, ClubAttachment ca, Map<String, Object> map) {
		int result1 = clubDao.insertClub(sqlSession, c);  	 //1) Club테이블에 넣기
		int result2 = clubDao.saveStep3(sqlSession, map);    //2) ClubTime테이블에 넣기
		int result3 =1;
		if(ca != null) {
			result3 = clubDao.saveStep2(sqlSession, ca);  //3) Club_attachment 테이블에 넣기
		}

		if(result1 < 0 || result2 <= 0 || result3 <= 0) { //11/29 update 에러 -> 결과값:0이어서 이렇게 처리
			throw new RuntimeException("독서모임 개설 신청 중 오류");
		}		
	}

	@Override
	public ArrayList<Club> selectList3(String userId, PageInfo pi) {

		ArrayList<Club> list = clubDao.selectList3(sqlSession, userId, pi);
		
		return list;
	}

	@Override
	public ArrayList<ClubAttachment> selectPhotoList(List<Integer> clubNo) {
		
		ArrayList<ClubAttachment> plist = clubDao.selectPhotoList(sqlSession,clubNo);
		
		return plist;
	}

	@Override
	public void deleteClub3(List<Integer> clubNo) {
		
		int result = clubDao.deleteClub3(sqlSession, clubNo);
		if(result < 0) {
			throw new RuntimeException("독서모임 삭제 오류");
		}
		
	}

	@Override
	public int selectListCount(String userId) {
		// TODO Auto-generated method stub
		return clubDao.selectListCount(sqlSession,userId);
	}

	//메인페이지 - 카테고리 리스트
	@Override
	public ArrayList<Club> selectCateList(String category) {
		// TODO Auto-generated method stub
		return clubDao.selectCateList(sqlSession, category);
	}
	//메인페이지 - 마감임박 리스트
	@Override
	public ArrayList<Club> selectEndList() {
		// TODO Auto-generated method stub
		return clubDao.selectEndList(sqlSession);
	}
	//메인페이지 - 인기(찜) 리스트
	@Override
	public ArrayList<Club> selectpopList() {
		// TODO Auto-generated method stub
		return clubDao.selectPopList(sqlSession);
	}
	

	@Override
	public Club selectClub(int cno) {
		// TODO Auto-generated method stub
		return clubDao.selectClub(sqlSession, cno);
	}
	
	//update 스텝1 --> c:update, ca:update
	@Override
	public void updateStep1_1(Club c, ClubAttachment ca) {
		int result = clubDao.updateStep1(sqlSession, c);  //update
		int result2 = clubDao.updateStep1_2(sqlSession, ca);  //update
		
		if(result <= 0 || result2 <= 0) {  //11/29 update 에러 -> 결과값:0이어서 이렇게 처리
			throw new RuntimeException("독서모임 1단계 수정 오류");
		}
	}

	//update 스텝1 --> --> c:update, ca:insert
	@Override
	public void updateStep1_2(Club c, ClubAttachment ca) {
		// TODO Auto-generated method stub
		
		int result = 1;
		result = clubDao.updateStep1(sqlSession, c);  	 //1) Club테이블에 넣기
		if(ca != null) {
			result = clubDao.updateInsertAttach(sqlSession, ca);  //2) Club_attachment 테이블에 넣기
		}
		
		if(result <= 0) {
			throw new RuntimeException("독서모임 2단계 수정 오류");
		}
	}

	@Override
	public void updateStep2_1(Club c, ClubAttachment ca) {
		int result = clubDao.saveStep2(sqlSession, c);  //update
		int result2 = clubDao.updateStep1_2(sqlSession, ca); //update
		
		if(result <= 0 || result2 <= 0) {
			throw new RuntimeException("독서모임 2단계 수정 오류");
		}
	}

	@Override
	public void updateStep3_1(Club c, ClubAttachment ca, Map<String, Object> map) {
		//c:update, ca:update	map:insert
		//1)c:update -> saveStep3_1;
		//2)ca:update -> updateStep_attach
		//3)map:delete -> deleteClubTimes
		//4)map:insert -> saveStep3_2
		int clubNo = c.getClubNo();
		int result1 = clubDao.saveStep3(sqlSession, c);
		int result2 = clubDao.updateStep1_2(sqlSession, ca);
		int result3 = clubDao.deleteClubTimes(sqlSession, clubNo); 
		int result4 = clubDao.saveStep3(sqlSession, map);
		
		if(result1 <= 0 || result2 < 0 || result3 < 0 || result4 < 0) {
			throw new RuntimeException("독서모임 3단계 수정 오류");
		}
	}

	@Override
	public void updateStep3_2(Club c, ClubAttachment ca, Map<String, Object> map) {
		//c:update, ca:insert map:insert
		//1)c:update -> saveStep3_1;
		//2)ca:insert -> saveStep2_2
		//3)map:delete -> deleteClubTimes
		//4)map:insert -> saveStep3_2
		int clubNo = c.getClubNo();
		int result2 = 0;
		
		int result1 = clubDao.saveStep3(sqlSession, c);
		if(ca != null) {
			result2 = clubDao.updateStep1_2(sqlSession, ca);
		}
		
		int result3 = clubDao.deleteClubTimes(sqlSession, clubNo);
		int result4 = clubDao.saveStep3(sqlSession, map);
		
		if(result1 <= 0) {
			throw new RuntimeException("독서모임 3단계 수정 오류11_처");
		}
		if(result2 < 0 ) {
			throw new RuntimeException("독서모임 3단계 수정 오류22_둘");
		}
		if(result3 < 0) {
			throw new RuntimeException("독서모임 3단계 수정 오류33_셋");
		}
		if(result4 < 0) {
			throw new RuntimeException("독서모임 3단계 수정 오류44_넷");
		}
	}

	@Override
	public List<Integer> selectApplyList(List<Integer> ctList) {
		
		ArrayList<Integer> applyList = clubDao.selectApplyList(sqlSession,ctList);
		
		return applyList;
	}

	@Override
	public int selectListCount(String userId, String table) {
		// TODO Auto-generated method stub
		return clubDao.selectListCount(sqlSession,userId, table);
	}

//	@Override
//	public ArrayList<Club> selectList2(String userId, String table) { //, PageInfo pi
//	
//		return clubDao.selectList2(sqlSession, userId, table);
//	}

	@Override
	public void updateCondition(int clubNo, int condition) {
		
		int result = clubDao.updateCondition(sqlSession, clubNo, condition);
		
		if(result <= 0) {
			throw new RuntimeException("독서모임 condition 수정오류 - updateCondtion메소드");
		}
	}

	@Override
	public int selectListCount_1(String category, int type) {
		
		int result = clubDao.selectListCount_1(sqlSession, category, type);

		return result;
	}

	@Override
	public ArrayList<Club> selectCateList_1(String category, PageInfo pi) {
		// TODO Auto-generated method stub
		return clubDao.selectCateList_1(sqlSession, category, pi);
	}


	@Override
	public ArrayList<Club> selectCateList_2(String category, PageInfo pi1) {
		// TODO Auto-generated method stub
		return clubDao.selectCateList_2(sqlSession, category, pi1);
	}

	@Override
	public ArrayList<Club> selectCateList_3(String category) {
		// TODO Auto-generated method stub
		return clubDao.selectCateList_3(sqlSession, category);
	}

	@Override
	public int selectListCount_search(SearchCondition sc) {
		// TODO Auto-generated method stub
		int result = clubDao.selectListCount_search(sqlSession, sc);

		return result;
	}

	@Override
	public List<Club> selectList_search(SearchCondition sc, PageInfo pi) {
		// TODO Auto-generated method stub
		return clubDao.selectList_search(sqlSession, sc, pi);
	}

	//테스트용도 1123
	@Override
	public ArrayList<Club> selectMypageList1_2(List<Integer> clubNoList) {
		
		return clubDao.selectMypageList1_2(sqlSession,clubNoList);
	}

	

	
	
	
}
