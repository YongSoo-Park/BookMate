package com.kh.bookmate.clubApply.model.service;

import java.util.List;

import com.kh.bookmate.clubApply.model.vo.ClubApply;
import com.kh.bookmate.clubApply.model.vo.ClubWish;
import com.kh.bookmate.common.PageInfo;

public interface ClubApplyService {
	
	String insertApplyTotal(List<Integer> times, String userId, int clubNo, String c_times);

	int selectCheckApply(List<Integer> times, String userId);
//
//	int insertApply(List<Integer> times, String userId, int clubNo, String c_times);

	String insertHeartTotal(String userId, int clubNo);
	
	int selectCheckHeart(String userId, int clubNo);
//
//	int insertHeart(String userId, int clubNo);

	void deleteHeart(String userId, List<Integer> clubNoList);

	//마이페이지1 - 신청목록 조회
	List<ClubApply> selectApplyList(String userId, PageInfo pi);
	
	//마이페이지2 - 찜목록 조회
	List<ClubWish> selectWishList(String userId, PageInfo pi);
	
	String updateCancelTotal(String userId, int timeNo, String times);

//	int updateCancel(String userId, int timeNo, String times);

	List<ClubApply> selectApplyList(int clubNo);

	void updateUserApply(List<Integer> applyNoList);

	






}
