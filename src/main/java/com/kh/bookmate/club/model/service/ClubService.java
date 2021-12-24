/* 파일 설명 : 서비스(독서모임-개설신청,수정,삭제)
 * 담당자  : 황서연
 * 수정날짜 : 2021.11.01
 * */
package com.kh.bookmate.club.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.bookmate.club.model.vo.Club;
import com.kh.bookmate.club.model.vo.ClubAttachment;
import com.kh.bookmate.club.model.vo.SearchCondition;
import com.kh.bookmate.clubApply.model.vo.ClubApply;
import com.kh.bookmate.common.PageInfo;

public interface ClubService {

	int checkHost(String hostName);

	int insertStep1(Club c, ClubAttachment ca);

	void insertStep2(Club c, ClubAttachment ca);

	void insertStep3(Club c, ClubAttachment ca, Map<String, Object> map);

	void insertClub(Club c, ClubAttachment ca, Map<String, Object> map);

	ArrayList<Club> selectList3(String userId, PageInfo pi);

	ArrayList<ClubAttachment> selectPhotoList(List<Integer> clubNo);

	void deleteClub3(List<Integer> clubNo);

	//메인페이지
	int selectListCount(String userId);

	ArrayList<Club> selectCateList(String category);

	ArrayList<Club> selectEndList();
	
	ArrayList<Club> selectpopList();

	//상세페이지
	Club selectClub(int cno);

	//독서모임 개설 수정
	void updateStep1_2(Club c, ClubAttachment ca);

	void updateStep1_1(Club c, ClubAttachment ca);

	void updateStep2_1(Club c, ClubAttachment ca);

	//c:update, ca:update	map:insert
	void updateStep3_1(Club c, ClubAttachment ca, Map<String, Object> map);

	//c:update, ca:insert	map:insert
	void updateStep3_2(Club c, ClubAttachment ca, Map<String, Object> map);

	//신청 리스트
	List<Integer> selectApplyList(List<Integer> ctList);

	int selectListCount(String userId, String table);

//	ArrayList<Club> selectList2(String userId, String table);//, PageInfo pi
	
	//마이페이지 1,2
		ArrayList<Club> selectMypageList1_2(List<Integer> clubNoList);  //11/23 메소드수정

	void updateCondition(int clubNo, int condition);

	int selectListCount_1(String category, int type);

	ArrayList<Club> selectCateList_1(String category, PageInfo pi);

	ArrayList<Club> selectCateList_2(String category, PageInfo pi1);

	ArrayList<Club> selectCateList_3(String category);

	//독서모임 검색
	int selectListCount_search(SearchCondition sc);

	List<Club> selectList_search(SearchCondition sc, PageInfo pi);

	

	




}
