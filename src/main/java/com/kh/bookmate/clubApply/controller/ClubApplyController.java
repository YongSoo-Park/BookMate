package com.kh.bookmate.clubApply.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bookmate.club.model.service.ClubService;
import com.kh.bookmate.club.model.vo.Club;
import com.kh.bookmate.club.model.vo.ClubTime;
import com.kh.bookmate.clubApply.model.service.ClubApplyService;
import com.kh.bookmate.user.model.vo.User;

@Controller
public class ClubApplyController {
	
	@Autowired
	private ClubApplyService clubApplyService;
	
	@Autowired
	private ClubService clubService;

	//1. 독서모임 신청
	@ResponseBody
	@RequestMapping("apply.cl")
	public String insertApply(@RequestParam(value="times[]") List<Integer> times, String userId, int clubNo, String c_times) { //String[] times -> 이렇게 배열 받으면 안됨;;

		String result = clubApplyService.insertApplyTotal(times, userId, clubNo, c_times);
		
		//1)이전에 신청한 적 있는지 확인
//		int befApply = clubApplyService.selectCheckApply(times, userId);
		//2)이전에 신청한 적 없는 경우에만 신청되게하기
//		if(befApply > 0) {
//			return "fail";
//		}
		//2-1)club_apply : insert
		//2-2)club_time : apply_count +1
//		int result = clubApplyService.insertApply(times, userId, clubNo, c_times);	
		
		//3)모집종료로 바꿔야 함
		//3-1) club 조회 - collection으로 club_time도 들어있으므로 2번 db에 왔다갔다 할 필요없다.
		//3-2) 신청인원, 모집정원 비교하기
//		boolean status = true;
//		
//		Club club = clubService.selectClub(clubNo);
//		for(ClubTime ct : club.getClubTimes()) {
//			int nowApply = ct.getApply_count();
//			if(club.getClubCapacity() > nowApply) {  //모집정원이 신청인원보다 많을때니까 아직 모집중이어도 된다.
//				status = false;
//				break;
//			}
//		}
//		if(status) {
//			int condition = 5; //5:모집완료  (4:모집중-관리자페이지에서 아래 메소드 활용가능) 
//			clubService.updateCondition(clubNo, condition);
//		}

		return result;
	}
	
	//2.찜하기
	@ResponseBody
	@RequestMapping("heart.cl")
	public String insertHeart(String userId, int clubNo) {
		
		String result = clubApplyService.insertHeartTotal(userId, clubNo);
		
		//1)이전에 찜한 적 있는지 확인
//		int befHeart = clubApplyService.selectCheckHeart(userId, clubNo);
//		if(befHeart > 0) {
//			return "fail";
//		}
		//2)이전에 찜한 적 없는 경우 찜할 수 있도록하기
//		int result = clubApplyService.insertHeart(userId, clubNo);
		
		return result;
	}
	
	//3.찜 삭제 - 독서모임 상세페이지
	@ResponseBody
	@RequestMapping("heartCancle.cl")
	public String deleteHeart(String userId, int clubNo) {
		List<Integer> clubNoList = new ArrayList<>();
		clubNoList.add(clubNo);
		
		clubApplyService.deleteHeart(userId, clubNoList);
		
		return "success";
	}
	
	//3-6. 찜 삭제 - 마이페이지2(찜목록)에서
	//clubController에 있었는데 복잡해서 여기로 뺐다.
	@RequestMapping("deleteClub2.cl")
	public String deleteClub2(int[] clubNo, HttpServletRequest request) {

		String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
		List<Integer> clubNos = Arrays.stream(clubNo).boxed().collect(Collectors.toList());
				
		//1.db 업데이트(delete시키기)
		clubApplyService.deleteHeart(userId, clubNos);
		
		return "redirect:mypage2.cl";
	}
	
	//mypage3 - 신청 취소하기
	@ResponseBody
	@RequestMapping(value = "updateCancel.cl",method = RequestMethod.POST)
	public String updateCancel(String userId, int timeNo, String times) { //times:한번만나요/여러번만나요
		
		String result = clubApplyService.updateCancelTotal(userId, timeNo, times);
		
		//1) club_apply테이블 apply_cancle컬럼 'y'으로 바꾸기
		//2) club_time테이블 apply_count컬럼 -1해주기
//		int result = clubApplyService.updateCancel(userId, timeNo, times);
		
		//3) 독서모임 상태 바꾸기
//		boolean status = true;
//		
//		Club club = clubService.selectClub(result);
//		for(ClubTime ct : club.getClubTimes()) {
//			int nowApply = ct.getApply_count();
//			if(club.getClubCapacity() > nowApply) {  //모집정원이 신청인원보다 많을때니까 아직 모집중이어도 된다.
//				status = false;
//				break;
//			}
//		}
//		if(!status) {
//			int condition = 4; //5:모집완료  (4:모집중-관리자페이지에서 아래 메소드 활용가능) 
//			clubService.updateCondition(result, condition);
//		}
		
		return result;
	}
	
	//독서모임 개설자 -> 참여완료 확정
	@ResponseBody
	@RequestMapping(value = "checkUserApply.cl",method = RequestMethod.POST)
	public String updateUserApply(@RequestParam(value="applyNoList[]") List<Integer> applyNoList) {
		
		clubApplyService.updateUserApply(applyNoList);
		
		return "success";
	}

	

}
