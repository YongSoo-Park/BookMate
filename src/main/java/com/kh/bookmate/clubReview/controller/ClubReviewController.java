package com.kh.bookmate.clubReview.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.GsonBuilder;
import com.kh.bookmate.clubReview.model.service.ClubReviewService;
import com.kh.bookmate.clubReview.model.vo.ClubQna;
import com.kh.bookmate.clubReview.model.vo.ClubQnaAnswer;
import com.kh.bookmate.clubReview.model.vo.ClubReview;
import com.kh.bookmate.user.model.vo.User;

@Controller
public class ClubReviewController {
	
	@Autowired
	private ClubReviewService clubReviewService;

	//1. 리뷰 작성 전 확인
	@ResponseBody
	@RequestMapping(value = "checkReview.cl")
	public String selectParticipate(int clubNo, String userId) {
		
		//(1)참여완료 여부 확인
		int result = clubReviewService.selectParticipate(clubNo, userId);
		if(result == 0) {
			return "fail";
		}
		//(2)이전에 리뷰 작성했는지 확인 -> 이전에 리뷰작성시 작성안됨
		int result1 = clubReviewService.selectBefReview(clubNo, userId);
		return String.valueOf(result1);
	}
	
	//2.리뷰 insert- rPhoto는 따로 파라미터로 받아서 파일명 처리 후 cr객체에 set해준다.
	@ResponseBody
	@RequestMapping(value = "insertReview.cl",method = RequestMethod.POST , consumes ={"multipart/form-data"})
	public String insertReview(ClubReview cr, @RequestParam(value = "rPhoto", required=false) MultipartFile file, HttpServletRequest request) {
		
		String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
		cr.setReviewWriter(userId);

		if(!file.getOriginalFilename().equals("")) { //첨부파일 등록한 경우
			String changeName = saveFile(file,request);  //수정할때도 쓸라고 savefile로 뺀다.
			if(changeName != null) {
				cr.setReviewPhoto(changeName);
			}
		}
		clubReviewService.insertReview(cr);
		//포인트 증정하는 메소드
		
		return "success";  //cr은 안된다
	}
	
	//리뷰작성시 필요한 메소드(사진 파일 저장)
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources"); 
		String savePath = resources + File.separator+"upload_files"+File.separator+"club_img"+File.separator;
		
		String originName = file.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ext;
		
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			//throw new CommException("file Upload error");
		}
		return changeName;
	}
	
	//3.리뷰 리스트 조회 -produces="application/json; charset=utf-8" 안해주면 객체 전송 안됨
	@ResponseBody
	@RequestMapping(value="selectReview.cl", produces="application/json; charset=utf-8")
	private String selectReviewList(int clubNo) {
		
		List<ClubReview> list = clubReviewService.selectReviewList(clubNo);
		
		return new GsonBuilder().create().toJson(list);
	}
	
	//4.리뷰 삭제(리뷰에 등록된 사진도 같이 삭제)
	@ResponseBody
	@RequestMapping(value="deleteReview.cl")
	private String deleteReview(int clubNo, String userId, String fileName, HttpServletRequest request) {

		clubReviewService.deleteReview(clubNo, userId);
		
		if(!fileName.equals("")) {
			deleteFile(fileName, request);
		}
		return "success";
	}
	
	//리뷰 삭제시 필요한 메소드(사진 파일 삭제)
	private void deleteFile(String changeName, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + File.separator+"upload_files"+File.separator+"club_img"+File.separator;

		File deleteFile = new File(savePath+changeName);
		deleteFile.delete();
	}
	
	//4.qna 등록
	@ResponseBody
	@RequestMapping(value = "insertQna.cl", method = RequestMethod.POST)
	public String insertQna(ClubQna cq) {

		clubReviewService.insertQna(cq);
		
		return "success";  
	}
	
	//5.qna 리스트 조회
	@ResponseBody
	@RequestMapping(value="selectQnaList.cl", produces="application/json; charset=utf-8")
	private String selectQnaList(int clubNo) {
		
		List<ClubReview> list = clubReviewService.selectQnaList(clubNo);
		
		return new GsonBuilder().create().toJson(list);
	}
	
	//6.qna 내용 조회, 답글 조회
	@ResponseBody
	@RequestMapping(value="selectQna.cl", produces="application/json; charset=utf-8")
	private String selectQna(int qnaNo) {
		
		ClubQna cq = clubReviewService.selectQna(qnaNo);
		
		return new GsonBuilder().create().toJson(cq);
	}
	
	//7.qna answer답변 등록
	@ResponseBody
	@RequestMapping(value = "insertQnaAnswer.cl", method = RequestMethod.POST)
	public String insertQnaAnswer(ClubQnaAnswer cqa) {

		//1.qnaAnswer테이블에 insert
		clubReviewService.insertQnaAnswer(cqa);
		//2.qna테이블에 update하기(qnaanswer = 'y'로)
		clubReviewService.updateQna(cqa.getQnaNo());
		
		return "success";  
	}
	
	//8. qna 삭제
	@ResponseBody
	@RequestMapping(value = "deleteQna.cl", method = RequestMethod.POST)
	public String deleteQna(int qnaNo, int type) {
		
		clubReviewService.deleteQna(qnaNo, type);

		return "success";
	}
}
