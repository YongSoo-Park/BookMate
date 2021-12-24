package com.kh.bookmate.ubook.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.GsonBuilder;
import com.kh.bookmate.seller.model.service.SellerService;
import com.kh.bookmate.seller.model.vo.Seller;
import com.kh.bookmate.ubook.model.service.UbookService;
import com.kh.bookmate.ubook.model.vo.PageInfo;
import com.kh.bookmate.ubook.model.vo.Pagination;
import com.kh.bookmate.ubook.model.vo.Ubook;
import com.kh.bookmate.ubook.model.vo.Ubook_Qna;
import com.kh.bookmate.user.model.vo.User;

@Controller
public class UbookController {

	@Autowired
	UbookService ubookService;

	@Autowired
	private SellerService sellerService;
	

	//책장메이트 메인 - 로그인 안함/로그인했지만 판매자 가입 안함/둘 다 함/판매자 휴면 비교 가능
	@RequestMapping("ubookMain.ub")
	public String ubookMain(HttpServletRequest request, Model model) {	
		//11.4 - 해결... (원인 : .getUserId() 때문이였음 -> if문으로 비교할 때에는 .getUserId()없이 해야한다)
		if((User)request.getSession().getAttribute("loginUser") == null) {
			String userId = "dlatluserId";
			Seller s = sellerService.loginSeller(userId);
			model.addAttribute("s", s);
		}else {
			String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
			Seller s = sellerService.loginSeller(userId);
			//System.out.println("셀러?" + s.getSellerNo());
			model.addAttribute("s", s);
		}
		//등록된 도서 랜덤으로 보여주기
		ArrayList<Ubook> randomBookList = ubookService.selectRandomBookList();
		model.addAttribute("randomBookList", randomBookList);
		
		//등록된 도서 중 최저가
		ArrayList<Ubook> rowPriceBookList = ubookService.selectRowPriceBookList();
		model.addAttribute("rowPriceBookList", rowPriceBookList);
		/*
		 * List<Ubook> list = ubookService.searchUbookList(keyword);
		 * model.addAttribute("list", list);
		 */
		
		return "ubook/ubookMain";
	}
	//판매자 페이지 - 내가 등록한 도서 리스트
	@RequestMapping("ubookList.ub")
	@ResponseBody
	public List<Ubook> selectbookList(HttpServletRequest request, Model model) {
		String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
		Seller s = sellerService.loginSeller(userId);
		int sellerNo = s.getSellerNo();
		List<Ubook> list = ubookService.selectbookList(sellerNo);
		//System.out.println(list.size());
		

		 for(int i=0; i < list.size(); i++) { 
			 Ubook str = list.get(i);
			 System.out.println("도서" + str);
			 }
		
		System.out.println("list" + list);
		model.addAttribute("list", list);
		return list;
	}
	
	//판매자 페이지 - 내가 등록한 도서 삭제
	@RequestMapping("deleteMyUbook.ub")
	@ResponseBody
	public int deleteMyUbook(int ubookNo, HttpServletResponse response) throws IOException {
		int result = ubookService.deleteMyUbook(ubookNo);
		System.out.println("0000000000000000000:" + result);
		return result;
	}
	
	//판매자 페이지 - 내가 등록한 도서 수정
	@RequestMapping("updateMyUbook.ub")
	public String ubookDetail() {
		return "ubook/ubookList";
	}

	//도서 카테고리
	@RequestMapping("ubookCategory.ub")
	public String selectCategory(@RequestParam("ubCategory") int ubCategory,
			@RequestParam(value="currentPage", required = false, defaultValue="1") int currentPage,
								HttpServletRequest request, Model model) {

		if((User)request.getSession().getAttribute("loginUser") != null) {
			String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
			Seller s = sellerService.loginSeller(userId);
			//System.out.println("셀러?" + s.getSellerNo());
			model.addAttribute("s", s);
		}
		//int listCount = ubookService.selectListCount();
		int listCount = ubookService.selectListCount(ubCategory);
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 3, 5);
		
		List<Ubook> list = ubookService.selectCategory(ubCategory, pi);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		/*
		 * for(int i=0; i < list.size(); i++) { Ubook str = list.get(i);
		 * System.out.println("셀러 번호 보이려나 모르겠네" + str.getSellerNickN()); }
		 */
		
		return "ubook/ubookCategory";
	}
	
	//도서 검색
	@RequestMapping("ubookSearch.ub")
	public String searchUbook(HttpServletRequest request, Model model, @RequestParam("keyword") String keyword) {

		if((User)request.getSession().getAttribute("loginUser") != null) {
			String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
			Seller s = sellerService.loginSeller(userId);
			//System.out.println("셀러?" + s.getSellerNo());
			model.addAttribute("s", s);
		}
		List<Ubook> list = ubookService.searchUbookList(keyword);
		model.addAttribute("list", list);
		//model.addAttribute("keyword", keyword);
		System.out.println(keyword);
		
		return "ubook/ubookSearchList";
	}
/*
	@RequestMapping("ubookDetail.ub")
	public String ubookDetail() {
		return "ubook/ubookDetail";
	}
*/
	
	//도서 상세
	@RequestMapping("ubookDetailTest.ub")
	public String ubookDetail(HttpServletRequest request, Model model, int ubookNo) {

		if((User)request.getSession().getAttribute("loginUser") != null) {
			String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
			Seller s = sellerService.loginSeller(userId);
			//System.out.println("셀러?" + s.getSellerNo());
			model.addAttribute("s", s);
		}

		Ubook ub = new Ubook();
		ub.setUbookNo(Integer.parseInt(request.getParameter("ubookNo")));
		ub.setBSellerNo(Integer.parseInt(request.getParameter("bSellerNo")));
		
		Ubook ubook = ubookService.selectUbook(ub);
		System.out.println("야!!!! 좀 얼굴 좀 비춰봐!!" + ub.getBSellerNo());
		System.out.println("야!!!! 좀 얼굴 좀 비춰봐!!2222" + ub.getUbookName());
		model.addAttribute("ubook", ubook);

		Ubook sellerBook = new Ubook();
		sellerBook.setUbookNo(Integer.parseInt(request.getParameter("ubookNo")));
		sellerBook.setUbookImg(request.getParameter("ubookImg"));
		sellerBook.setUbookName(request.getParameter("ubookName"));
		sellerBook.setUbookQual(request.getParameter("ubookQual"));
		sellerBook.setBSellerNo(Integer.parseInt(request.getParameter("bSellerNo")));
		
		
		List<Ubook> sellerBookList = ubookService.sellerBookList(sellerBook);
		model.addAttribute("sellerBookList", sellerBookList);
		
		return "ubook/ubookDetailTest";
		/*
		System.out.println("도서야~~ 나와줘~~~~~" + ubook.getUbookName());
		model.addAttribute("ubook", ubook);
		return "ubook/ubookDetailTest";*/
	}
	
	//도서 수정 시 해당 도서 검색
	   @RequestMapping("ubookUpdateForm.ub")
	   @ResponseBody
	   public Ubook ubookUpdateForm(@RequestParam("ubookNo") int ubookNo) {

	      Ubook ubook = ubookService.selectUpdateUbook(ubookNo);
	      
	      return ubook;
	   }

	//도서 문의 리스트
	@ResponseBody
	@RequestMapping(value="qnalist.ub", produces="application/json; charset=utf-8")
	public String selectQnaList(int ubookNo, Model model) {
		ArrayList<Ubook_Qna> list = ubookService.selectQnaList(ubookNo);
		model.addAttribute("list", list);
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list);
	}
	//도서 문의 등록
	@ResponseBody
	@RequestMapping(value="qnaInsert.ub")
	public String insertQna(Ubook_Qna qna) {
		int result = ubookService.insertQna(qna);

		return String.valueOf(result);
	}
	
	//도서 답변 등록
	@ResponseBody
	@RequestMapping(value="qnaInsertAnswer.ub")
	public String insertAnswer(@RequestParam("ubno") int ubno,
			 					@RequestParam("qnaGroupNo") int qnaGroupNo,
			 					@RequestParam("qnaWriter") String qnaWriter,
			 					@RequestParam("qnaContent") String qnaContent
			) {

		Ubook_Qna qna2 = new Ubook_Qna();
		qna2.setUbno(ubno);
		qna2.setQnaGroupNo(qnaGroupNo);
		qna2.setQnaWriter(qnaWriter);
		qna2.setQnaContent(qnaContent);
		
		System.out.println(qna2);

		System.out.println("그룹넘버~~?"+qna2.getQnaGroupNo());
		System.out.println("그룹넘버~~?"+qna2.getQnaContent());
		
		int result = ubookService.insertAnswer(qna2);
			return String.valueOf(result);
	}
	
	
	//도서 답변 삭제
	@RequestMapping("deleteQna.ub")
	@ResponseBody
	public int deleteQna(int qnaNo, HttpServletResponse response) throws IOException {
		int result = ubookService.deleteQna(qnaNo);
		System.out.println("답변삭제 " + result);
		return result;
	}
	
	/*
	//도서 문의 리스트
		@ResponseBody
		@RequestMapping(value="qnalist.ub", produces="application/json; charset=utf-8")
		public String selectQnaList2(int ubookNo, int qnaNo) {
			ArrayList<Ubook_Qna> list = ubookService.selectQnaList2(ubookNo, qnaNo);
			
			return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list);
		}
		//도서 문의 등록
		@ResponseBody
		@RequestMapping(value="qnaInsert.ub")
		public String insertQna2(Ubook_Qna qna2) {
			int result = ubookService.insertQna2(qna2);

			return String.valueOf(result);
		}
	*/
	//판매자 페이지 - 도서 등록
	@RequestMapping("ubookEnrollForm.ub")
	public String ubookEnrollForm() {
		return "seller/ubookEnrollForm";
	}

	//판매자 페이지 - 도서 등록 form
	@RequestMapping("ubookEnroll.ub")
	public String ubookEnroll(Ubook ubook,
								@DateTimeFormat(pattern = "yyyy-MM-dd") Date ubookPubDate,
								@RequestParam("UbookImgFile") MultipartFile UbookImgFile,
								HttpServletRequest request,
								Model model) {


		ubook.setUbookPubDate(ubookPubDate);
		ubook.setUbookDetail(ubook.getUbookDetail().replaceAll("\r\n", "<br>"));
		ubook.setUbookContent(ubook.getUbookContent().replaceAll("\r\n", "<br>"));
		//안된다면 이 부분일듯
		String ubookImg = changeFileNameAndSave(request, UbookImgFile);
		System.out.println("ubookImg~~~~~~~~~~~~~~" + ubookImg);
		ubook.setUbookImg(ubookImg);
		
		
			ubookService.insertUbook(ubook);

			System.out.println("ubook~~~~~~~~~~~~~~" + ubook);
			System.out.println("getUbCategory~~~~~~~~~~~~~~" + ubook.getUbCategory());
			
			//Ubook ubookDetail = ubookService.selectUbook(ubook.getUbookNo());
			
			//model.addAttribute("ubook", ubookDetail);
			
			
			//return "redirect:/sellerPage.se";
			//return "seller/ubookEnroll";
			return "redirect:/sellerPage.se";
	}
	
	//도서 수정
	@RequestMapping("ubookUpdate.ub")
	@ResponseBody
	public int ubookUpdate(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest req) throws ParseException, IOException {
		MultipartFile UbookImgFile = req.getFile("UbookImgFile");
		
		String ubookImg = changeFileNameAndSave(request, UbookImgFile);
		
		Ubook update = new Ubook();
		update.setUbookNo(Integer.parseInt(request.getParameter("ubookNo")));
		update.setUbookName(request.getParameter("ubookName"));
		update.setUbookWriter(request.getParameter("ubookWriter"));
		update.setUbookIsbn(request.getParameter("ubookIsbn"));
		update.setUbCategory(Integer.parseInt(request.getParameter("ubCategory")));	//int
		update.setUbookTrans(request.getParameter("ubookTrans"));
		update.setUbookPub(request.getParameter("ubookPub"));
		SimpleDateFormat smf = new SimpleDateFormat("YYYY-MM-dd");
		update.setUbookPubDate(smf.parse(request.getParameter("ubookPubDate")));//date
		update.setUbookOPrice(Integer.parseInt(request.getParameter("ubookOPrice")));//int
		update.setUbookPrice(Integer.parseInt(request.getParameter("ubookPrice")));//int
		update.setUbookStock(Integer.parseInt(request.getParameter("ubookStock")));//int
		update.setUbookQual(request.getParameter("ubookQual"));
		update.setUbookDetail(request.getParameter("ubookDetail"));
		update.setUbookContent(request.getParameter("ubookContent"));
		update.setUbookImg(ubookImg);	//img
		
		System.out.println(update);

		int result = ubookService.ubookUpdate(update);
		
		return result;
	}
	
	//이미지 파일 변환 및 업로드
	public String changeFileNameAndSave(HttpServletRequest request, MultipartFile file) {

		String originName = file.getOriginalFilename();
		String path = request.getSession().getServletContext().getRealPath("resources") + File.separator+"images"+File.separator+"Ubookimg"+File.separator;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String currentTime = sdf.format(new Date());

		int random = (int) (Math.random() * 99999 + Math.random() * 99999);

		
		String ext =originName.substring(originName.lastIndexOf("."));
		
		String newFileName = currentTime + random + ext;
		
		try {
			file.transferTo(new File(path + newFileName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException("파일 업로드 에러");
		}
		return newFileName;
	}
}
