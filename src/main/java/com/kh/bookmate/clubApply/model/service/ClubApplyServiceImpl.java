package com.kh.bookmate.clubApply.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.club.model.dao.ClubDao;
import com.kh.bookmate.club.model.vo.Club;
import com.kh.bookmate.club.model.vo.ClubTime;
import com.kh.bookmate.clubApply.model.dao.ClubApplyDao;
import com.kh.bookmate.clubApply.model.vo.ClubApply;
import com.kh.bookmate.clubApply.model.vo.ClubWish;
import com.kh.bookmate.common.PageInfo;

@Service
public class ClubApplyServiceImpl implements ClubApplyService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ClubApplyDao clubApplyDao;
	
	@Autowired
	private ClubDao clubDao;
	

	@Override
	public String insertApplyTotal(List<Integer> times, String userId, int clubNo, String c_times) {
		
		//1)이전에 신청한 적 있는지 확인
		int befApply = selectCheckApply(times, userId);
		//2)이전에 신청한 적 없는 경우에만 신청되게하기
		if(befApply > 0) {
			return "fail";
		}
		//3-1)club_apply : insert
		int result1 ;
		int result2 ;
		int result3 = 1;
		
		if(c_times.equals("한 번 만나요")) {
			result1 = clubApplyDao.insertApply(sqlSession, times, userId,clubNo);
		}else {
			//'여러번 만나요'일때 club_apply테이블에 한 번만 들어갈 수 있도록 한다.
			//마이페이지 - 신청목록에서 여러 번 뜨면 페이징처리가 어렵다.
			List<Integer> subList = new ArrayList<>(times.subList(0, 1));
			result1 = clubApplyDao.insertApply(sqlSession, subList, userId,clubNo);
		}
		//3-2)club_time : apply_count +1
		result2 = clubApplyDao.insertApplyTime(sqlSession,times);

		//4)모집종료로 바꿔야 함
		//4-1) club 조회 - collection으로 club_time도 들어있으므로 2번 db에 왔다갔다 할 필요없다.
		//4-2) 신청인원, 모집정원 비교하기
		boolean status = true;
		Club club = clubDao.selectClub(sqlSession, clubNo);
		for(ClubTime ct : club.getClubTimes()) {
			int nowApply = ct.getApply_count();
			if(club.getClubCapacity() > nowApply) {  //모집정원이 신청인원보다 많을때니까 아직 모집중이어도 된다.
				status = false;
				break;
			}
		}
		if(status) {
			int condition = 5; //5:모집완료  (4:모집중-관리자페이지에서 아래 메소드 활용가능) 
			result3 = clubDao.updateCondition(sqlSession, clubNo, condition);
		}
		
		if(result1 < 0 || result2 < 0 || result3 <= 0) {  //11/29 update 에러 -> 결과값:0이어서 이렇게 처리
			throw new RuntimeException("독서모임 신청 오류");
		}
		return "success";
	}
	
	
	@Override  //1. 신청: 이전에 신청했는지 확인
	public int selectCheckApply(List<Integer> times, String userId) {
		int befApply = clubApplyDao.selectCheckApply(sqlSession, times, userId);

		return befApply;
	}
//
//	@Override  //2. 신청: insert, update
//	public int insertApply(List<Integer> times, String userId, int clubNo, String c_times) {
//		//2-1)club_apply : insert
//		//2-2)club_time : apply_count +1
//		int result1;
//		if(c_times.equals("한 번 만나요")) {
//			result1 = clubApplyDao.insertApply(sqlSession, times, userId,clubNo);
//		}else {
//			//'여러번 만나요'일때 club_apply테이블에 한 번만 들어갈 수 있도록 한다.
//			//마이페이지 - 신청목록에서 여러 번 뜨면 페이징처리가 어렵다.
//			List<Integer> subList = new ArrayList<>(times.subList(0, 1));
//			result1 = clubApplyDao.insertApply(sqlSession, subList, userId,clubNo);
//		}
//		
//		int result2 = clubApplyDao.insertApplyTime(sqlSession,times);
//		
//		if(result1 < 0 || result2 < 0) {
//			//예외처리
//		}
//		
//		return result1*result2;
//	}

	
	@Override
	public String insertHeartTotal(String userId, int clubNo) {
		//1)이전에 찜했는지 확인
		int befHeart = clubApplyDao.selectCheckHeart(sqlSession, clubNo, userId);
		if(befHeart > 0) {
			return "fail";
		}
		
		//2-1)club_wish : insert
		//2-2)club : heart_count +1
		int result1 = clubApplyDao.insertHeart(sqlSession, userId, clubNo);
		int result2 = clubApplyDao.updateHeartCount(sqlSession,clubNo);
		
		if(result1 < 0 || result2 <= 0) {  //11/29 update 에러 -> 결과값:0이어서 이렇게 처리
			throw new RuntimeException("독서모임 찜 오류");
		}
		
		return "success";
	}
	
	
	@Override  //3. 찜: 이전에 찜했는지 확인
	public int selectCheckHeart(String userId, int clubNo) {
		// TODO Auto-generated method stub
		return clubApplyDao.selectCheckHeart(sqlSession, clubNo, userId);
	}
//
//	@Override  //4. 찜: insert, update
//	public int insertHeart(String userId, int clubNo) {
//		//1)club_wish : insert
//		//2)club : heart_count +1
//		int result1 = clubApplyDao.insertHeart(sqlSession, userId, clubNo);
//		int result2 = clubApplyDao.updateHeartCount(sqlSession,clubNo);
//		
//		if(result1 < 0 || result2 < 0) {
//			//예외처리
//		}
//		
//		return result1*result2;
//	}

	@Override  //5.찜 : 찜 삭제
	public void deleteHeart(String userId, List<Integer> clubNoList) {
		// TODO Auto-generated method stub
		int result1 = clubApplyDao.deleteHeart(sqlSession, userId, clubNoList);
		int result2 = clubApplyDao.updateHeartCount2(sqlSession, clubNoList);
		
		if(result1 <= 0 || result2 <= 0) {  //11/29 update 에러 -> 결과값:0이어서 이렇게 처리
			throw new RuntimeException("독서모임 찜 삭제 오류");
		}
	}

	//마이페이지1 - 신청목록 조회
	@Override
	public List<ClubApply> selectApplyList(String userId , PageInfo pi) {
		// TODO Auto-generated method stub
		return clubApplyDao.selectApplyList(sqlSession, userId, pi);
	}
	
	//마이페이지2 - 찜목록 조회
	@Override
	public List<ClubWish> selectWishList(String userId, PageInfo pi) {
		// TODO Auto-generated method stub
		return clubApplyDao.selectWishList(sqlSession, userId, pi);
	}


	//마이페이지1 - 신청취소하기
	@Override
	public String updateCancelTotal(String userId, int timeNo, String times) {
		int result = updateCancel(userId, timeNo, times);

		boolean status = true;
		
		Club club = clubDao.selectClub(sqlSession, result);
		for(ClubTime ct : club.getClubTimes()) {
			int nowApply = ct.getApply_count();
			if(club.getClubCapacity() > nowApply) {  //모집정원이 신청인원보다 많을때니까 아직 모집중이어도 된다.
				status = false;
				break;
			}
		}
		if(!status) {
			int condition = 4; //5:모집완료  (4:모집중-관리자페이지에서 아래 메소드 활용가능) 
			int result2 = clubDao.updateCondition(sqlSession, result, condition);
			
			if(result2 <= 0) {  //11/29 update 에러 -> 결과값:0이어서 이렇게 처리
				throw new RuntimeException("독서모임 취소 오류_condition변경 오류");
			}
		}
		return "success";
	}

	public int updateCancel(String userId, int timeNo, String times) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("timeNo", timeNo);
		
		//1) club_apply테이블 apply_cancle컬럼 'n'으로 바꾸기
		int result1 = clubApplyDao.updateCancel(sqlSession,map);

		//2) club_time테이블 apply_count컬럼 -1해주기
		int result2 = 1;
		if(times.equals("여러 번 만나요")) {
			map.put("columnValue", map.get("clubNo"));
			map.put("column", "REF_CLUB_NO");
			result2 = clubApplyDao.updateCancelTime(sqlSession,map);
		}else {
			map.put("columnValue", timeNo);
			map.put("column", "CLUB_TIME_NO");
			result2 = clubApplyDao.updateCancelTime(sqlSession,map);
		}

		if(result1<=0 || result2<=0) {  //11/29 update 에러 -> 결과값:0이어서 이렇게 처리
			throw new RuntimeException("독서모임 신청 취소 오류");
		}
		return (int) map.get("clubNo");
	}

	@Override
	public List<ClubApply> selectApplyList(int clubNo) {
		// TODO Auto-generated method stub
		return clubApplyDao.selectApplyList(sqlSession, clubNo);
	}

	@Override
	public void updateUserApply(List<Integer> applyNoList) {
		int result = clubApplyDao.updateUserApply(sqlSession, applyNoList);
		if(result <= 0) {  //11/29 update 에러 -> 결과값:0이어서 이렇게 처리
			throw new RuntimeException("독서모임 참여확정 중 오류");
		}
	}


	







}
