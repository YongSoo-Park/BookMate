/* 파일 설명 : 컨트롤러(독서모임-개설신청,수정,삭제)
 * 담당자  : 황서연
 * 수정날짜 : 2021.11.10
 * 수정사항 : 독서모임 수정3 - date[]에서 arrayindex오류난다. 고쳐줘야함
 * 수정필요사항 : loginUser 세션에 넣어줘야 함 (V)
 * 			  step2에서 정원 typemismatch 오류남 default=0으로해야겠다.(V)
 * 			  message로 상황 알려줘야 함
 *            오프라인 장소(club_place) 추가해줘야 함
 *            <삭제> 1.club_time, club_attachment -> club삭제되면 해당 clubNo에 맞는 값 delete처리? (V)
 *            
 *            
 * */
package com.kh.bookmate.club.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.kh.bookmate.club.model.service.ClubService;
import com.kh.bookmate.club.model.vo.Club;
import com.kh.bookmate.club.model.vo.ClubAttachment;
import com.kh.bookmate.club.model.vo.ClubTime;
import com.kh.bookmate.club.model.vo.SearchCondition;
import com.kh.bookmate.clubApply.model.service.ClubApplyService;
import com.kh.bookmate.clubApply.model.vo.ClubApply;
import com.kh.bookmate.clubApply.model.vo.ClubWish;
import com.kh.bookmate.clubReview.model.service.ClubReviewService;
import com.kh.bookmate.clubReview.model.vo.ClubReview;
import com.kh.bookmate.common.PageInfo;
import com.kh.bookmate.common.Pagination;
import com.kh.bookmate.user.model.vo.User;

@Controller
public class ClubController {
	
	
	private int keyClubNo;  //insert할때 단계 건너뛸 때 clubNo전역변수로 저장해두고 쓰려고 만듦/currval은 한번만 쓰고

	@Autowired
	private ClubService clubService;
	@Autowired
	private ClubApplyService clubApplyService;
	@Autowired
	private ClubReviewService clubReviewService;
	
	//0. insert 첫단계 화면 띄우기
	@RequestMapping("insertForm1.cl")
	public String insertForm1() {
		return "club/insertForm1";
	}
	
	//1. 호스트명 중복 확인
	@ResponseBody
	@RequestMapping(value="/hostCheck.cl")
	public String checkHost(String hostName) {

		int result = clubService.checkHost(hostName);
		if(result > 0) {  //이미 이름 있는 경우
			return "duplicate";
		}else {
			return "use";
		}
	}
	
	//2. 개설신청 1단계 저장 : c, ca, userId 총 3개 보내기
	/* 1) value에 기본값 넣기 & required=false로 받기 2가지 중 후자로 해봄 */	
	@RequestMapping(value={"saveStep1.cl", "insertClub1.cl"}) 
	public String insertStep1(HttpServletRequest request, @ModelAttribute Club c,
							@RequestParam(name="hostPhoto", required=false) MultipartFile file,
							@RequestParam(name="phwhatTodo", required=false) String[] phwhatTodo){
		
		String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
		c.setUserId(userId);
		c.setHostComment(c.getHostComment().replaceAll("\r\n", "<br>"));
		
		String hwhatTodo = "";
		for(int i=0; i< phwhatTodo.length; i++) {
			hwhatTodo += phwhatTodo[i]+"|";  //글자 중에 ,있는 경우 구분이 안되서 이렇게 바꿈
		}
		c.setHwhatTodo(hwhatTodo);
		System.out.println(c.getHwhatTodo());
	
		ClubAttachment ca = null;
		int imageType = 1;
		
		ca = preSaveFile(ca, file, request, imageType);

		keyClubNo = clubService.insertStep1(c, ca);  //1단계에서 insert한 clubNo
		
		//다중 매핑 (10.30) 후 url판별하여 분기처리
		if(request.getServletPath().equals("/saveStep1.cl")) {
			return "redirect:mypage3.cl";
		}else {
			return "club/insertForm2";
		}
	}
	
	@RequestMapping("test.cl")
	public String test() {
		return "club/insertForm3";
	}
	
	public ClubAttachment preSaveFile(ClubAttachment ca, MultipartFile file, HttpServletRequest request, int imageType) {
		
		if(!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file,request);
			
			if(changeName != null) {
				ca = new ClubAttachment();
				ca.setOriginalName(file.getOriginalFilename());
				ca.setChangeName(changeName);
				ca.setFileType(imageType);  //이미지종류-1 : 호스트이미지
			}
		}
		return ca;
	}

	private String saveFile(MultipartFile file, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources"); 
		System.out.println("resources : " + resources);
		
		//String savePath = resources+"\\upload_files\\";  -> 맥에서는 적용이안되서 아래로 수정
		String savePath = resources + File.separator+"upload_files"+File.separator+"club_img"+File.separator;
		
		System.out.println("savePath : " + savePath);
		
		String originName = file.getOriginalFilename();		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ext;
		
		try {
			//new File(savePath + changeName) : 파일을 저장하기 위한 파일 객체 생성
			//new File(저장경로 + 저장할이름)
			file.transferTo(new File(savePath + changeName));
			//transferTo : 파일 저장
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//throw new CommException("file Upload error");
		}
		return changeName;
	}

	//3. 개설신청 2단계 저장 후 다음단계로
	@RequestMapping(value={"saveStep2.cl", "insertClub2.cl"}) 
	public String insertStep2(HttpServletRequest request, @ModelAttribute Club c,
							@RequestParam(name="coverPhoto", required=false) MultipartFile file,
							@RequestParam(name="capacity", required=false, defaultValue="0") int capacity) {
		ClubAttachment ca = null;
		int imageType = 2;	
		
		c.setIntro(c.getIntro().replaceAll("\r\n", "<br>"));
		c.setActivity(c.getActivity().replaceAll("\r\n", "<br>"));
		c.setWant(c.getWant().replaceAll("\r\n", "<br>"));
		c.setNotwant(c.getNotwant().replaceAll("\r\n", "<br>"));
		
		ca = preSaveFile(ca, file, request, imageType);

		c.setClubCapacity(capacity); //typeMismatch 오류나서 따로 뺏음(11.03)
		c.setClubNo(keyClubNo);  //앞 단계에서 넣은 ClubNo값 넣기
		
		if(ca != null) {
			ca.setClubNo(keyClubNo);
		}

		clubService.insertStep2(c, ca);

		if(request.getServletPath().equals("/saveStep2.cl")) {
			return "redirect:mypage3.cl";
		}else {
			return "club/insertForm3";
		}
	}
	
	//4. 개설신청 3단계 저장 후 다음단계로
	@RequestMapping(value={"saveStep3.cl", "insertClub3.cl"}) 
	public String insertStep3(HttpServletRequest request, @ModelAttribute Club c, @ModelAttribute ClubTime ct,
							@RequestParam(name="bookPhoto", required=false) MultipartFile file,
							@RequestParam(name="newClubDate", required=false) String[] newClubDate) { 
		ClubAttachment ca = null;
		int imageType = 3;	
		ca = preSaveFile(ca, file, request, imageType);

		c.setClubNo(keyClubNo);  //앞 단계에서 넣은 ClubNo값 넣기
		
		if(ca != null) {
			ca.setClubNo(keyClubNo);
		}
		
		//String[] dates = ct.getClubDate().split(",");
		
		//추가 - 맥에서는 string -> date로 입력이 안되서 date로 입력하게끔 바꿨다(11.09)
		java.sql.Date[] nDates = new java.sql.Date[newClubDate.length];

		for(int i=0; i<newClubDate.length; i++) {
			nDates[i] = java.sql.Date.valueOf(newClubDate[i]);
		}
		
		String[] startTimes = ct.getStartTime().split(",");
		String[] endTimes = ct.getEndTime().split(",");
				
		List<ClubTime> list = new ArrayList<ClubTime>();
		
		//clubTime 객체에 값들 set하고 list에 add하기 -> mapper에서 foreach로 insert하기
		for(int i=0; i<startTimes.length; i++) {
			ClubTime inputCt = new ClubTime();
			inputCt.setClubNo(keyClubNo);
			//inputCt.setClubDate(dates[i]);
			inputCt.setClubDate(nDates[i]);
			inputCt.setStartTime(startTimes[i]);
			inputCt.setEndTime(endTimes[i]);
			
			list.add(inputCt);
		}
		
		System.out.println(list.toString());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);

		if(request.getServletPath().equals("/saveStep3.cl")) {
			clubService.insertStep3(c, ca, map);
			//return "redirect:mypage3.cl";  //msg 다르게 처리해야한다.
		}else {
			clubService.insertClub(c, ca, map);  //condition컬럼 값 2로 바꾼다.
			//return "redirect:mypage3.cl";  //msg 다르게 처리해야한다.
		}
		
		return "redirect:mypage3.cl";
	}
	
	
	//마이페이지2 조회 - 찜목록 조회
	@RequestMapping("mypage1.cl")
	public String selectListMypage1(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
									HttpServletRequest request, Model model) {
			
		String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
		String table  = "CLUB_APPLY";
		int listCount  = clubService.selectListCount(userId, table);
		List<ClubApply> capList = new ArrayList<>();  //신청

		//1.전체 apply 리스트 - 페이징처리
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 7, 5);
		capList = clubApplyService.selectApplyList(userId, pi);
		
		//2.신청한 club 리스트
		List<Integer> clubNoList = new ArrayList<>();
		for(ClubApply ca : capList) {
			clubNoList.add(ca.getClubNo());
		}
		
		ArrayList<Club> list= new ArrayList<>();
		if(clubNoList.size() != 0) {
			list = clubService.selectMypageList1_2(clubNoList);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("capList", capList);
		model.addAttribute("pi",pi);
		return "clubMypage/mypage1";
	}	
	
	//마이페이지2 조회 - 찜목록 조회
	@RequestMapping("mypage2.cl")
	public String selectListMypage2(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
									HttpServletRequest request, Model model) {
		
		String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
		String table = "CLUB_WISH";
		int listCount = clubService.selectListCount(userId, table);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 7, 5);
		List<ClubWish> cwList = clubApplyService.selectWishList(userId, pi);
		
		List<Integer> clubNoList = new ArrayList<>();
		for(ClubWish cw : cwList) {
			clubNoList.add(cw.getClubNo());
		}
		
		ArrayList<Club> list= new ArrayList<>();
		if(clubNoList.size() != 0) {
			list = clubService.selectMypageList1_2(clubNoList);
		}

//	ArrayList<Club> list = clubService.selectList2(userId, table);

		model.addAttribute("cwList", cwList);
		model.addAttribute("list", list);
		model.addAttribute("pi",pi);
		
		return "clubMypage/mypage2";
	}
	
	//5. 마이페이지3 - 독서모임 개설 조회하기
	@RequestMapping("mypage3.cl")
	public String selectListMypage3(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
									HttpServletRequest request, Model model) {
		
		String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
		
		int listCount = clubService.selectListCount(userId);
		System.out.println("listCount : " + listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 7, 5);
		
		ArrayList<Club> list = clubService.selectList3(userId, pi);		

		model.addAttribute("list", list);
		model.addAttribute("pi",pi);

		return "clubMypage/mypage3";
	}
	
	//6.마이페이지-내독서모임관리-독서모임 삭제
	@RequestMapping("deleteClub3.cl")
	public String deleteClub3(int[] clubNo, HttpServletRequest request) {
		//0.mybatis-foreach문에서 arraylist,list만취급해서 int[] 바꿨는데 다 쓸수있었다,,,
		//참고: https://wook-dragon.tistory.com/8		
		List<Integer> clubNos = Arrays.stream(clubNo).boxed().collect(Collectors.toList());
		
		//1.조회
		ArrayList<ClubAttachment> plist = new ArrayList<>();
		plist = clubService.selectPhotoList(clubNos);
		
		//2.사진삭제(해당 clubNo에 사진있는 경우만)
		if(plist != null) {
			for(ClubAttachment ca : plist) {
				deleteFile(ca.getChangeName(),request);
			}
		}
		
		//3.db 업데이트(status='n'말고 다 지우기)
		clubService.deleteClub3(clubNos);
		
		return "redirect:mypage3.cl";
	}

	private void deleteFile(String changeName, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + File.separator+"upload_files"+File.separator+"club_img"+File.separator;

		File deleteFile = new File(savePath+changeName);
		deleteFile.delete();
	}
	
	//6.5 마이페이지3_1 수정 폼 띄우기
	@RequestMapping("updateForm3_1.cl")
	public String updateForm(int clubNo, Model model) {
		
		Club club = clubService.selectClub(clubNo);

		if(club.getHostComment() != null) {  //안해주면 nullpointer 난다.
			club.setHostComment(club.getHostComment().replaceAll("<br>", "\r\n"));
		}
		
		model.addAttribute("club", club);
		return "clubMypage/updateForm3_1";
	}
	
	//6.5 마이페이지3 - 독서모임 수정1
	@RequestMapping(value={"updateClub1.cl", "updateClubNext1.cl"}) 
	public String updateClub3_1(HttpServletRequest request, @ModelAttribute Club c, Model model,
							@RequestParam(name="old_changeName", required=false, defaultValue="없음") String old_changeName,
							@RequestParam(name="hostPhoto", required=false) MultipartFile file,
							@RequestParam(name="phwhatTodo", required=false) String[] phwhatTodo){
		
		//hwhatTodo 구분자(|) 처리
		String hwhatTodo = "";
		for(int i=0; i< phwhatTodo.length; i++) {
			hwhatTodo += phwhatTodo[i]+"|";  //글자 중에 ,있는 경우 구분이 안되서 이렇게 바꿈
		}
		c.setHwhatTodo(hwhatTodo);
		
		/* 파일첨부 확인
		 * 1. 파일첨부 새로 한 경우
		 *   0)club테이블 update
		 *   1_1)club_attachment테이블 - 기존파일 첨부되어있는 경우 : update
		 *   1_2)club_attachment테이블 - 기존파일 첨부 X 되어있는 경우 : insert
		 * 2. 파일첨부 새로 하지 않은 경우 
		 *   0)club테이블 update
		 * */
		ClubAttachment ca = null;
		int imageType = 1;

		if(!file.getOriginalFilename().equals("")) {  
			
			ca = preSaveFile(ca, file, request, imageType);
			ca.setClubNo(c.getClubNo());
			
			if(!old_changeName.equals("없음")) { 

				deleteFile(old_changeName, request);
				
				//UPDATE
				clubService.updateStep1_1(c, ca);  //c:update, ca:update	
			}else {
				//INSERT
				clubService.updateStep1_2(c,ca);  //c:update, ca:insert
			}
		}else {
			ca = preSaveFile(ca, file, request, imageType);
			clubService.updateStep1_2(c,ca);  //c:update (impl에서 ca null처리해줌)
		}

		//업데이트 후 club 다시 조회해와서 저장하고 화면 넘어가기
		Club club = clubService.selectClub(c.getClubNo());
		
		//1201_수정폼 <br>고치기
		if(club.getIntro() != null) {  
			club.setIntro(club.getIntro().replaceAll("<br>", "\r\n"));
		}
		if(club.getActivity() != null) { 
			club.setActivity(club.getActivity().replaceAll("<br>", "\r\n"));
		}
		if(club.getWant() != null) {  
			club.setWant(club.getWant().replaceAll("<br>", "\r\n"));
		}
		if(club.getNotwant() != null) { 
			club.setNotwant(club.getNotwant().replaceAll("<br>", "\r\n"));
		}
		
		model.addAttribute("club", club);
		
		//다중 매핑 (11.09) 후 url 판별하여 분기처리
		if(request.getServletPath().equals("/updateClub1.cl")) {
			return "redirect:mypage3.cl";
		}else {
			return "clubMypage/updateForm3_2";
		}
	}
	
	
	
	//6.6 마이페이지3 - 독서모임 수정2
	@RequestMapping(value={"updateClub2.cl", "updateClubNext2.cl"})
	public String updateClub3_2(HttpServletRequest request, @ModelAttribute Club c, Model model,
								@RequestParam(name="old_changeName", required=false, defaultValue="없음") String old_changeName,
								@RequestParam(name="coverPhoto", required=false) MultipartFile file,
								@RequestParam(name = "capacity", required = false, defaultValue = "0") int capacity){
		
		c.setClubCapacity(capacity);
		/* 파일첨부 확인
		 * 1. 파일첨부 새로 한 경우
		 *   0)club테이블 update
		 *   1_1)club_attachment테이블 - 기존파일 첨부되어있는 경우 : update
		 *   1_2)club_attachment테이블 - 기존파일 첨부 X 되어있는 경우 : insert
		 * 2. 파일첨부 새로 하지 않은 경우 
		 *   0)club테이블 update
		 * */
		ClubAttachment ca = null;
		int imageType = 2;
		
		System.out.println("업데이트 수정2 : "+ c.toString());
		System.out.println("업데이트 수정2 : "+ c.getClubNo());
		
		if(!file.getOriginalFilename().equals("")) {  
			
			ca = preSaveFile(ca, file, request, imageType);
			ca.setClubNo(c.getClubNo());
			
			if(!old_changeName.equals("없음")) { 

				deleteFile(old_changeName, request);
				
				//UPDATE
				clubService.updateStep2_1(c, ca);  //c:update, ca:update	
			}else {
				//INSERT
				clubService.insertStep2(c,ca);  //c:update, ca:insert
			}
		}else {
			ca = preSaveFile(ca, file, request, imageType);
			clubService.insertStep2(c,ca);  //c:update (impl에서 ca null처리해줌)
		}

		//업데이트 후 club 다시 조회해와서 저장하고 화면 넘어가기
		Club club = clubService.selectClub(c.getClubNo());
		model.addAttribute("club", club);
		
		//다중 매핑 (11.09) 후 url 판별하여 분기처리
		if(request.getServletPath().equals("/updateClub2.cl")) {
			return "redirect:mypage3.cl";
		}else {
			return "clubMypage/updateForm3_3";
		}
	}
	
	
	//6.7 마이페이지3 - 독서모임 수정3 - 임시저장
	@RequestMapping(value={"updateClub3.cl", "updateClubNext3.cl"})
	public String updateClub3_3(HttpServletRequest request, @ModelAttribute Club c, @ModelAttribute ClubTime ct,
								@RequestParam(name="old_changeName", required=false, defaultValue="없음") String old_changeName,
								@RequestParam(name="bookPhoto", required=false) MultipartFile file,
								@RequestParam(name="newClubDate", required=false) String[] newClubDate) {
		
		//clubTime객체에 넣을 clubDate, startTime, endTime필드 준비
		java.sql.Date[] nDates = new java.sql.Date[newClubDate.length];
		for(int i=0; i<newClubDate.length; i++) {
			nDates[i] = java.sql.Date.valueOf(newClubDate[i]);
		}
		String[] startTimes = ct.getStartTime().split(",");
		String[] endTimes = ct.getEndTime().split(",");

		List<ClubTime> list = new ArrayList<ClubTime>();
		
		//clubTime 객체에 값들 set하고 list에 add하기 -> mapper에서 foreach로 insert하기
		for(int i=0; i<startTimes.length; i++) {
			ClubTime inputCt = new ClubTime();
			inputCt.setClubNo(c.getClubNo());
			inputCt.setClubDate(nDates[i]);
			inputCt.setStartTime(startTimes[i]);
			inputCt.setEndTime(endTimes[i]);
			
			list.add(inputCt);
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);

		//사진 준비
		ClubAttachment ca = null;
		int imageType = 3;

		//condition 은 update시키면 안된다!
		if(!file.getOriginalFilename().equals("")) {  
			
			ca = preSaveFile(ca, file, request, imageType);
			ca.setClubNo(c.getClubNo());
			
			if(!old_changeName.equals("없음")) { 

				deleteFile(old_changeName, request);
				
				//UPDATE
				clubService.updateStep3_1(c,ca,map);  //c:update, ca:update	map:insert
			}else {
				//INSERT
				clubService.updateStep3_2(c,ca,map);  //c:update, ca:insert map:insert
			}
		}else {
			ca = preSaveFile(ca, file, request, imageType);
			clubService.updateStep3_2(c,ca,map);  //c:update (impl에서 ca null처리해줌)
		}


		return "redirect:mypage3.cl";
	}
	
	



	//7.메인페이지
	@RequestMapping("clubMain.cl")
	public String clubMain(Model model) {
		
		ArrayList<Club> endList = clubService.selectEndList();
		ArrayList<Club> popList = clubService.selectpopList();
		List<ClubReview> reviewList = clubReviewService.selectReviewList();
 		
		model.addAttribute("endList",endList);
		model.addAttribute("popList",popList);
		model.addAttribute("reviewList",reviewList);
		return "club/clubMain";
	}
	
	//8.메인페이지-카테고리 선택  -아래 더 공부하기!!
	@ResponseBody
	@RequestMapping(value="categoryList.cl", produces="application/json; charset=utf-8")
	public String categoryList(String category) {
		
		ArrayList<Club> catelist = clubService.selectCateList(category);

		return new GsonBuilder().create().toJson(catelist);
	}
	
	//9. 상세페이지
	@RequestMapping("detail.cl")
	public ModelAndView clubDetail(HttpServletRequest request, int clubNo, ModelAndView mv) {
		int befHeart = 0;
		Club club = clubService.selectClub(clubNo);
		
		/* club.setHostComment(club.getHostComment().replaceAll("<br>","\r\n"));
		club.setIntro(club.getIntro().replaceAll("<br>","\r\n"));
		club.setActivity(club.getActivity().replaceAll("<br>","\r\n")); 
		club.setWant(club.getWant().replaceAll("<br>","\r\n"));
		club.setNotwant(club.getNotwant().replaceAll("<br>","\r\n"));*/

		if((User)request.getSession().getAttribute("loginUser") != null) {
			String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
			befHeart = clubApplyService.selectCheckHeart(userId, clubNo);
			mv.addObject("befHeart",befHeart);
		}else {
			mv.addObject("befHeart",befHeart);
		}
		
		List<ClubReview> reviewList = clubReviewService.selectReviewList(clubNo);
		mv.addObject("reviewList",reviewList);
		mv.addObject("club",club).setViewName("club/clubDetail");
		return mv;
	}
		
	@RequestMapping("clubAll.cl")	
	public String selectClubAll(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
								@RequestParam(value="category", required=false, defaultValue="인문/과학/심리") String category,Model model) {
		
		//1.인문/과학/심리 로 선택해서 붙이기
		//- listcount세기
		int listCount  = clubService.selectListCount_1(category,4);
		int listCount2  = clubService.selectListCount_1(category,5);
		
		System.out.println("catelist_2길이얼만데? : " + listCount2);
		
		//2.
		PageInfo pi_first = Pagination.getPageInfo(listCount, 1, 7, 8);
		ArrayList<Club> cateList_first = clubService.selectCateList_1(category, pi_first);
		
		PageInfo pi_second = Pagination.getPageInfo(listCount2, 1, 7, 8);
		ArrayList<Club> cateList_second = clubService.selectCateList_2(category, pi_second);
		
		List<Club> cateList_third;
		ArrayList<Club> cateList_third_bef = clubService.selectCateList_3(category);
		
		if(cateList_third_bef.size() > 5) {
			cateList_third = new ArrayList<Club>(cateList_third_bef.subList(0, 5));
		}else {
			cateList_third = cateList_third_bef;
		}

		model.addAttribute("cateList_first",cateList_first);
		model.addAttribute("pi_first",pi_first);
		model.addAttribute("cateList_second",cateList_second);
		model.addAttribute("pi_second",pi_second);
		model.addAttribute("cateList_third",cateList_third);
		
		
		return "club/allClubs";
	}


	//모든 독서모임 -> 페이징 처리
	@ResponseBody
	@RequestMapping(value="allCateListPart.cl", produces="application/json; charset=utf-8")
	public String selectallCateListPart(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
						  String category, String clubStatus) {
		int listCount;
		PageInfo pi1= null;
		ArrayList<Club> cateList1 = null;
		//1.카테고리 별  listcount 세기
		//1)모집중, 모집완료, 모집종료

		if(clubStatus.equals("모집중")) {
			listCount  = clubService.selectListCount_1(category, 4);
			pi1 = Pagination.getPageInfo(listCount, currentPage, 7, 8);
			cateList1 = clubService.selectCateList_1(category, pi1);
		}else {
			listCount  = clubService.selectListCount_1(category,5);
			pi1 = Pagination.getPageInfo(listCount, currentPage, 7, 8);
			cateList1 = clubService.selectCateList_2(category, pi1);
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		if(clubStatus.equals("모집중")) {
			map.put("cateList1", cateList1);
			map.put("pi1",pi1);
		}else {
			map.put("cateList2", cateList1);
			map.put("pi2",pi1);
		}

		return new GsonBuilder().create().toJson(map);
	}
	
	//카테고리 클릭시
	@ResponseBody
	@RequestMapping(value="allCateList.cl", produces="application/json; charset=utf-8")
	public String selectallCateList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
						  String category) {
		//1.모집중
		int listCount1  = clubService.selectListCount_1(category,4);
		PageInfo pi1 = Pagination.getPageInfo(listCount1, currentPage, 7, 8);
		ArrayList<Club> cateList1 = clubService.selectCateList_1(category, pi1);
		
		//2.모집완료
		int listCount2  = clubService.selectListCount_1(category,5);
		PageInfo pi2 = Pagination.getPageInfo(listCount2, currentPage, 7, 8);
		ArrayList<Club> cateList2 = clubService.selectCateList_2(category, pi2);
		
		//3.모집종료
		ArrayList<Club> cateList3 = clubService.selectCateList_3(category);

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("cateList1", cateList1);
		map.put("pi1",pi1);
		map.put("cateList2", cateList2);
		map.put("pi2",pi2);
		map.put("cateList3", cateList3);
		return new GsonBuilder().create().toJson(map);
	}
	
	
	@RequestMapping(value = "closeListMove.cl")
	@ResponseBody
	public List<Club> closeListMove(int listIndex, String category){
		List<Club> cateList3_bef;
		List<Club> cateList3;
		
		cateList3_bef = clubService.selectCateList_3(category);
		
		if(listIndex < 5) {
			cateList3 = new ArrayList<Club>(cateList3_bef.subList(listIndex, listIndex+5));
		}else {
			List<Club> joinCloseList = new ArrayList<Club>();
			joinCloseList.addAll(cateList3_bef);
			joinCloseList.addAll(cateList3_bef);
			cateList3 = new ArrayList<Club>(joinCloseList.subList(listIndex, listIndex+5));
		}

		return cateList3;
	}

	@RequestMapping("selectApply.cl")
	public String selectApply(int clNo1, Model model) {
		
		System.out.println("clubcontroller - clubNo1 : " + clNo1);
		
		Club club = clubService.selectClub(clNo1);
		List<ClubApply> applyList = clubApplyService.selectApplyList(clNo1);

		model.addAttribute("club", club);
		model.addAttribute("applyList", applyList);
		
		return "clubMypage/checkApply";
	}
	
	@RequestMapping("searchPage.cl")
	public String selectSearchPage(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, Model model) {
		
		int listCount = clubService.selectListCount_1("", 4);  //모집중인 것만 뽑아야지

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 7, 9);
		List<Club> clubList = clubService.selectCateList_1("", pi);
		
		model.addAttribute("clubList",clubList);
		model.addAttribute("pi",pi);
		
		return "club/searchClub";
	}
	
	@RequestMapping(value= {"search.cl","search_menu.cl"})
	public String selectSearch(SearchCondition sc, Model model, HttpServletRequest request,
							   @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {

		if(request.getServletPath().equals("/search.cl")) {
			//사용자가 지정하지 않은경우 controller에서 null로 처리해서 mapper에서 처리해주게 했다.
			java.sql.Date nullDate =  java.sql.Date.valueOf("2000-01-01");
			if(sc.getStartDate().equals(nullDate)) {
				sc.setStartDate(null);
			}
			if(sc.getEndDate().equals(nullDate)) {
				sc.setEndDate(null);
			}
		}else {
			sc.setStartDate(null);
			sc.setEndDate(null);
		}
		
		int listCount = clubService.selectListCount_search(sc);  //모집중인 것만 뽑아야지

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 7, 9);
		List<Club> clubList = clubService.selectList_search(sc, pi);	
		
		model.addAttribute("clubList",clubList);
		model.addAttribute("pi",pi);
		
		model.addAttribute("sc",sc);
		
		return "club/searchResultClub";
	}
	

}
