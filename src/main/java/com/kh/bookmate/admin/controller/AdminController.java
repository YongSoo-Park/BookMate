package com.kh.bookmate.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.bookmate.admin.model.service.AdminService;
import com.kh.bookmate.admin.model.vo.AdminUser;
import com.kh.bookmate.book.model.service.BookService;
import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.bookqna.model.service.BookQnaService;
import com.kh.bookmate.bookqna.model.vo.BookQna;
import com.kh.bookmate.bookqna.model.vo.BookQnaAnswer;
import com.kh.bookmate.club.model.vo.Club;
import com.kh.bookmate.common.Paging;
import com.kh.bookmate.coupon.model.service.CouponService;
import com.kh.bookmate.coupon.model.vo.Coupon;
import com.kh.bookmate.notice.model.service.NoticeService;
import com.kh.bookmate.notice.model.vo.Notice;
import com.kh.bookmate.user.model.vo.User;

@Controller
public class AdminController {

	@Autowired
	private CouponService couponService;

	@Autowired
	private NoticeService noticeService;

	@Autowired
	private BookQnaService bookQnaService;

	@Autowired
	private AdminService adminService;

	@Autowired
	private BookService bookService;

	// 관리자 페이지 기본 재고 위험 페이지로
	@RequestMapping("adminMainPage.ad")
	public String adminMainPage() {

		return "redirect:/adminMainBookStock.st";

	}

	// 도서 재고 위험 리스트
	@RequestMapping("adminMainBookStock.st")
	public String adminMainBookStock(Model mo, @RequestParam(name = "nowPage", defaultValue = "1") int nowPage) {
		List<Book> list = null;
		Paging bookStockPaging = null;
		int lessStockBookCount = 0;
		RowBounds rb = null;
		int checkStock = 50;
		lessStockBookCount = adminService.selectLessStockCount(checkStock + 1);
		bookStockPaging = new Paging(lessStockBookCount, nowPage, 5, 10);
		rb = new RowBounds(bookStockPaging.getStart() - 1, bookStockPaging.getCntPerPage());
		list = adminService.selectLessStockBook(rb, checkStock + 1);
		mo.addAttribute("bookStockPaging", bookStockPaging);
		mo.addAttribute("nowPage", nowPage);
		mo.addAttribute("bookStockList", list);
		return "admin/adminBookStockCheck";

	}

	// 재고 추가용 도서 불러오기
	@RequestMapping("selectISBNStock")
	@ResponseBody
	public Map<String, Object> selectISBNStock(String bookISBN) {
		Book book = null;
		Map<String, Object> map = new HashMap<String, Object>();
		book = bookService.selectBookStock(bookISBN);
		if (book == null) {
			map.put("str", "fail");
			return map;
		}
		map.put("str", "pass");
		map.put("book", book);
		System.out.println(map);
		return map;

	}

	// 도서 재고 추가 업데이트
	@RequestMapping("updateBookPlusStock")
	@ResponseBody
	public String updateBookPlusStock(String bookISBN, int plusStock) {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("bookISBN", bookISBN);
		map.put("plusStock", plusStock);

		bookService.updateBookPlusStock(map);

		return "pass";
	}

	// 공지사항 리스트
	@RequestMapping("noticeList.no")
	public String selectNoticeList(Model mo, String keyword,
			@RequestParam(name = "nowPage", defaultValue = "1") int nowPage,
			@RequestParam(name = "isUser", defaultValue = "0") int isUser) {
		String temp;
		int noticeListCount = 0;
		if (keyword == null || keyword.trim().isEmpty()) {
			temp = "%%";
		} else {
			temp = "%" + keyword + "%";
		}
		noticeListCount = noticeService.selectNoticeCount(temp);
		Paging noticePaging = new Paging(noticeListCount, nowPage, 10, 10);
		List<Notice> noticeList = null;
		RowBounds rb = new RowBounds(noticePaging.getStart() - 1, noticePaging.getCntPerPage());
		noticeList = noticeService.selectNoticeList(temp, rb);

		mo.addAttribute("keyword", keyword);
		mo.addAttribute("nowPage", nowPage);
		mo.addAttribute("noticeList", noticeList);
		mo.addAttribute("noticePaging", noticePaging);
		if (isUser == 1) {
			return "notice/userNoticeList";
		}
		return "notice/noticeList";
	}

	// 공지사항 상세보기
	@RequestMapping("selectNoticeDetail.no")
	public String selectNoticeDetail(Model mo, int noticeNo,
			@RequestParam(name = "isUser", defaultValue = "0") int isUser) {

		Notice notice = null;
		notice = noticeService.selectNoticeDetail(noticeNo);
		mo.addAttribute("notice", notice);
		if (isUser == 1) {
			return "notice/userNoticeDetail";
		}

		return "notice/noticeDetail";

	}

	// 공지사항 등록 폼
	@RequestMapping("noticeEnrollForm.no")
	public String asfs() {

		return "notice/noticeEnrollForm";
	}

	// 공지사항 업데이트 폼
	@RequestMapping("updateNoticeForm.no")
	public String updateNoticeForm(Model mo, int noticeNo) {
		Notice notice = null;
		notice = noticeService.selectNoticeDetail(noticeNo);
		notice.setNoticeContent(notice.getNoticeContent().replaceAll("<br>", "\r\n"));

		mo.addAttribute("notice", notice);

		return "notice/noticeUpdateForm";

	}

	// 공지사항 업데이트
	@RequestMapping("updateNotice.no")
	public String updateNotice(Model mo, Notice notice, int deleteImg, MultipartFile noticeImg,
			HttpServletRequest request) {
		String directoryPath = null;
		String path = null;
		String deletePath = null;
		String newNoticeImgName = null;
		if (notice.getNoticeCategory().equals("0")) {
			directoryPath = request.getSession().getServletContext().getRealPath("resources") + File.separator
					+ "images" + File.separator + "notice" + File.separator;
		} else {
			directoryPath = request.getSession().getServletContext().getRealPath("resources") + File.separator
					+ "images" + File.separator + "event" + File.separator;
		}
		deletePath = directoryPath + notice.getNoticeImgName();

		if (noticeImg.getOriginalFilename().length() > 0) {
			newNoticeImgName = changeFileNameAndSave(request, noticeImg, notice.getNoticeCategory(), directoryPath);

			path = directoryPath + newNoticeImgName;
		}

		notice.setNoticeContent(notice.getNoticeContent().replaceAll("\r\n", "<br>"));
		noticeService.updateNotice(notice, path, deleteImg, deletePath, newNoticeImgName);
		Notice temp = null;
		temp = noticeService.selectNoticeDetail(notice.getNoticeNo());
		mo.addAttribute("notice", temp);

		return "notice/noticeDetail";

	}

	// 공지사항 삭제
	@RequestMapping("deleteNotice.no")
	public String deleteNotice(Model mo, int noticeNo, HttpServletRequest request) {
		Notice notice = noticeService.selectNoticeDetail(noticeNo);
		int fileStatus = notice.getNoticeImgStatus();
		String path = null;

		if (notice.getNoticeCategory().equals("0")) {
			path = request.getSession().getServletContext().getRealPath("resources") + File.separator + "images"
					+ File.separator + "notice" + File.separator + notice.getNoticeImgName();
		} else {
			path = request.getSession().getServletContext().getRealPath("resources") + File.separator + "images"
					+ File.separator + "event" + File.separator + notice.getNoticeImgName();
		}
		noticeService.deleteNotice(noticeNo, path, fileStatus);
		int nowPage = 1;
		String keyword = null;
		String temp = "%%";
		int noticeListCount = 0;

		noticeListCount = noticeService.selectNoticeCount(temp);
		Paging noticePaging = new Paging(noticeListCount, nowPage, 10, 10);
		List<Notice> noticeList = null;
		RowBounds rb = new RowBounds(noticePaging.getStart() - 1, noticePaging.getCntPerPage());
		noticeList = noticeService.selectNoticeList(temp, rb);

		mo.addAttribute("keyword", keyword);
		mo.addAttribute("nowPage", nowPage);
		mo.addAttribute("noticeList", noticeList);
		mo.addAttribute("noticePaging", noticePaging);

		return "notice/noticeList";

	}

	// 공지사항 등록
	@RequestMapping("insertNotice.no")
	public String bookEnroll(Model mo, Notice notice, MultipartFile noticeImg, HttpServletRequest request) {

		String directoryPath = null;
		String path = null;
		String noticeImgName = null;
		if (notice.getNoticeCategory().equals("0")) {
			directoryPath = request.getSession().getServletContext().getRealPath("resources") + File.separator
					+ "images" + File.separator + "notice" + File.separator;
		} else {
			directoryPath = request.getSession().getServletContext().getRealPath("resources") + File.separator
					+ "images" + File.separator + "event" + File.separator;
		}
		notice.setNoticeContent(notice.getNoticeContent().replaceAll("\r\n", "<br>"));

		if (noticeImg.getOriginalFilename().length() > 0) {
			noticeImgName = changeFileNameAndSave(request, noticeImg, notice.getNoticeCategory(), directoryPath);
			notice.setNoticeImgStatus(1);
			notice.setNoticeImgName(noticeImgName);
		} else {
			notice.setNoticeImgStatus(0);
		}
		path = directoryPath + noticeImgName;
		noticeService.insertNotice(notice, path);

		mo.addAttribute("notice", notice);
		return "notice/noticeDetail";

	}

	// 이미지 파일 저장
	public String changeFileNameAndSave(HttpServletRequest request, MultipartFile file, String noticeCategory,
			String directoryPath) {
		String originName = file.getOriginalFilename();
		new File(directoryPath).mkdirs();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String currentTime = sdf.format(new Date());

		int random = (int) (Math.random() * 99999 + Math.random() * 99999);

		String ext = originName.substring(originName.lastIndexOf("."));

		String newFileName = currentTime + random + ext;

		try {
			file.transferTo(new File(directoryPath + newFileName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			throw new RuntimeException("파일 저장 에러");
		}
		return newFileName;
	}

	// 모든 사용자 리스트 
	@RequestMapping("selectAllUser.ad")
	public String selectAllUser(Model mo, @RequestParam(name = "searchKind", defaultValue = "1") int searchKind,
			@RequestParam(name = "searchKeyword", required = false) String searchKeyword,
			@RequestParam(name = "nowPage", defaultValue = "1") int nowPage) {

		int userListCount = 0;
		Paging A_UserListPaging = null;
		String keyword = null;
		List<AdminUser> allUserList = null;
		RowBounds rb = null;
		Map<String, Object> map = new HashMap<String, Object>();
		if (searchKeyword == null || searchKeyword.trim().isEmpty()) {
			keyword = "%%";
		} else {
			keyword = "%" + searchKeyword + "%";
		}
		map.put("searchKind", searchKind);
		map.put("keyword", keyword);
		userListCount = adminService.selectAllUserCount(map);
		A_UserListPaging = new Paging(userListCount, nowPage, 10, 10);
		rb = new RowBounds(A_UserListPaging.getStart() - 1, A_UserListPaging.getCntPerPage());
		allUserList = adminService.selectAllUserList(map, rb);
		mo.addAttribute("searchKind", searchKind);
		mo.addAttribute("searchKeyword", searchKeyword);
		mo.addAttribute("nowPage", nowPage);
		mo.addAttribute("A_UserListPaging", A_UserListPaging);
		mo.addAttribute("allUserList", allUserList);

		return "admin/adminAllUserList";

	}

	// 자격정지 중인 회원 리스트
	@RequestMapping("selectBannedUser.ad")
	public String selectBannedUser(Model mo, @RequestParam(name = "searchKind", defaultValue = "1") int searchKind,
			@RequestParam(name = "searchKeyword", required = false) String searchKeyword,
			@RequestParam(name = "nowPage", defaultValue = "1") int nowPage) {
		int userListCount = 0;
		Paging A_BUserListPaging = null;
		String keyword = null;
		List<AdminUser> bannedUserList = null;
		RowBounds rb = null;
		Map<String, Object> map = new HashMap<String, Object>();
		if (searchKeyword == null || searchKeyword.trim().isEmpty()) {
			keyword = "%%";
		} else {
			keyword = "%" + searchKeyword + "%";
		}
		map.put("searchKind", searchKind);
		map.put("keyword", keyword);
		userListCount = adminService.selectBannedUserCount(map);
		A_BUserListPaging = new Paging(userListCount, nowPage, 10, 10);
		rb = new RowBounds(A_BUserListPaging.getStart() - 1, A_BUserListPaging.getCntPerPage());
		bannedUserList = adminService.selectBannedUserList(map, rb);
		mo.addAttribute("searchKind", searchKind);
		mo.addAttribute("searchKeyword", searchKeyword);
		mo.addAttribute("nowPage", nowPage);
		mo.addAttribute("A_BUserListPaging", A_BUserListPaging);
		mo.addAttribute("bannedUserList", bannedUserList);

		return "admin/adminUserRestore";

	}

	// 자격 정지 회원 복구
	@RequestMapping("updateUserRestore.ad")
	public String updateUserRestore(String user_Id) {
		adminService.updateUserRestore(user_Id);
		return "redirect:/selectBannedUser.ad";

	}

	//
	@RequestMapping("adminUserBan.ad")
	public String adminUserBan() {
		return "admin/adminUserBan";

	}

	//자격 정지할 유저 선택
	@RequestMapping("selectBanUser")
	@ResponseBody
	public Map<String, Object> selectBanUser(int searchKind, String searchKeyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		AdminUser user = null;
		map.put("searchKind", searchKind);
		map.put("keyword", searchKeyword);
		user = adminService.selectBanUser(map);

		System.out.println(user);
		if (user == null) {
			data.put("str", "fail");
			return data;
		}

		data.put("str", "pass");
		data.put("user", user);

		return data;

	}

	// 선택 회원 자격정지
	@RequestMapping("updateUserBan.ad")
	public String updateUserBan(String user_Id, Model mo) {
		adminService.updateUserBan(user_Id);
		mo.addAttribute("check", "1");
		return "admin/adminUserBan";

	}

	// 관리자 1:1 문의 확인 리스트
	@RequestMapping("adminQnaList.qa")
	public String selectQnaList(Model mo, @RequestParam(name = "searchKind", defaultValue = "1") int searchKind,
			@RequestParam(name = "searchKeyword", required = false) String searchKeyword,
			@RequestParam(name = "nowPage", defaultValue = "1") int nowPage,
			@RequestParam(name = "isAnswer", defaultValue = "0") int isAnswer) {
		int qnaListCount = 0;
		Paging A_QnaPaging = null;
		String keyword = null;
		List<BookQna> B_QnaList = null;
		RowBounds rb = null;
		if (searchKeyword == null || searchKeyword.trim().isEmpty()) {
			keyword = "%%";
		} else {
			keyword = "%" + searchKeyword + "%";
		}
		qnaListCount = bookQnaService.selectA_QnaListCount(searchKind, keyword, isAnswer);
		A_QnaPaging = new Paging(qnaListCount, nowPage, 10, 10);
		rb = new RowBounds(A_QnaPaging.getStart() - 1, A_QnaPaging.getCntPerPage());
		B_QnaList = bookQnaService.selectB_QnaList(searchKind, keyword, isAnswer, rb);
		mo.addAttribute("searchKind", searchKind);
		mo.addAttribute("searchKeyword", searchKeyword);
		mo.addAttribute("nowPage", nowPage);
		mo.addAttribute("isAnswer", isAnswer);
		mo.addAttribute("A_QnaPaging", A_QnaPaging);
		mo.addAttribute("B_QnaList", B_QnaList);
		return "bookQna/bookQnaList";

	}

	// 관리자 1:1 문의 상세 보기
	@RequestMapping("selectQnaDetail.no")
	public String selectQnaDetail(Model mo, int qnaNo) {

		BookQna qnaDetail = null;
		BookQnaAnswer qnaAnswerDetail = null;
		qnaDetail = bookQnaService.selectA_QnaDetail(qnaNo);
		if (qnaDetail.getQnaAnswer() == 1) {
			qnaAnswerDetail = bookQnaService.selectA_QnaAnswerDetail(qnaNo);
			mo.addAttribute("qnaAnswerDetail", qnaAnswerDetail);
		}
		mo.addAttribute("qnaDetail", qnaDetail);
		return "bookQna/bookQnaDetail";

	}

	// 관리자 1:1 문의 답변 폼
	@RequestMapping("intsertQnaAnswerForm.qa")
	public String intsertQnaAnswer(Model mo, int qnaNo) {
		BookQna qnaDetail = null;
		qnaDetail = bookQnaService.selectA_QnaDetail(qnaNo);
		mo.addAttribute("qnaDetail", qnaDetail);
		return "bookQna/bookQnaAnswerEnrollForm";
	}

	// 관리자 1:1문의 답변 등록
	@RequestMapping("intsertQnaAnswer.qa")
	public String intsertQnaAnswer(Model mo, BookQnaAnswer qnaAnswer) {
		qnaAnswer.setQnaAnswerContent(qnaAnswer.getQnaAnswerContent().replaceAll("\r\n", "<br>"));
		BookQnaAnswer qnaAnswerDetail = null;
		bookQnaService.intsertQnaAnswer(qnaAnswer);
		BookQna qnaDetail = null;
		qnaDetail = bookQnaService.selectA_QnaDetail(qnaAnswer.getQnaNo());
		if (qnaDetail.getQnaAnswer() == 1) {
			qnaAnswerDetail = bookQnaService.selectA_QnaAnswerDetail(qnaDetail.getQnaNo());
			mo.addAttribute("qnaAnswerDetail", qnaAnswerDetail);
		}
		mo.addAttribute("qnaDetail", qnaDetail);
		mo.addAttribute("isJob", 1);
		return "bookQna/bookQnaDetail";

	}

	// 관리자 1:1 문의 수정 폼
	@RequestMapping("updateQnaAnswerForm.qa")
	public String updateQnaAnswerForm(Model mo, int qnaNo) {
		BookQna qnaDetail = null;
		BookQnaAnswer qnaAnswerDetail = null;
		qnaDetail = bookQnaService.selectA_QnaDetail(qnaNo);
		qnaAnswerDetail = bookQnaService.selectA_QnaAnswerDetail(qnaDetail.getQnaNo());
		qnaAnswerDetail.setQnaAnswerContent(qnaAnswerDetail.getQnaAnswerContent().replaceAll("<br>", "\r\n"));
		mo.addAttribute("qnaDetail", qnaDetail);
		mo.addAttribute("qnaAnswerDetail", qnaAnswerDetail);
		return "bookQna/bookQnaAnswerUpdateForm";
	}

	// 관리자 1:1문의 수정
	@RequestMapping("updateQnaAnswer.qa")
	public String updateQnaAnswer(Model mo, BookQnaAnswer qnaAnswer) {
		qnaAnswer.setQnaAnswerContent(qnaAnswer.getQnaAnswerContent().replaceAll("\r\n", "<br>"));
		bookQnaService.updateQnaAnswer(qnaAnswer);
		BookQna qnaDetail = null;
		BookQnaAnswer qnaAnswerDetail = null;
		qnaDetail = bookQnaService.selectA_QnaDetail(qnaAnswer.getQnaNo());
		qnaAnswerDetail = bookQnaService.selectA_QnaAnswerDetail(qnaDetail.getQnaNo());
		mo.addAttribute("qnaDetail", qnaDetail);
		mo.addAttribute("qnaAnswerDetail", qnaAnswerDetail);
		mo.addAttribute("isJob", "1");
		return "bookQna/bookQnaDetail";
	}

	// 관리자 1:1문의 삭제
	@RequestMapping("deleteQnaAnswer.qa")
	public String deleteQnaAnswer(Model mo, int qnaNo) {

		bookQnaService.deleteQnaAnswer(qnaNo);

		BookQna qnaDetail = null;
		qnaDetail = bookQnaService.selectA_QnaDetail(qnaNo);
		mo.addAttribute("qnaDetail", qnaDetail);
		mo.addAttribute("isJob", "1");
		return "bookQna/bookQnaDetail";

	}

	// 이미 등록된 쿠폰 번호 체크
	@RequestMapping(value = "checkCouponCode.cp", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String insertCouponCheck(String couponCode) {

		Coupon coupon = couponService.selectCoupon(couponCode);

		if (coupon != null) {

			return coupon.getCouponPoint() + "";

		}

		return "pass";

	}

// 쿠폰 등록 폼
	@RequestMapping("insertCouponForm.ad")
	public String adminPageOpen() {
		return "admin/adminInsertCoupon";
	}

// 쿠폰 등록
	@RequestMapping("insertCoupon.cp")
	@ResponseBody
	public String insertCoupon(Coupon coupon) {
		int result = couponService.insertCoupon(coupon);
		if (result > 0)
			return "success";
		return "fail";

	}

	// 쿠폰 리스트 불러오기
	@RequestMapping("selectCouponList.cu")
	public String selectCouponList(Model mo,
			@RequestParam(name = "searchKeyword", required = false) String searchKeyword,
			@RequestParam(name = "nowPage", defaultValue = "1") int nowPage) {

		int couponListCount = 0;
		Paging couponPaging = null;
		List<Coupon> couponList = new ArrayList<Coupon>();
		String keyword = null;
		RowBounds rb = null;

		if (searchKeyword == null || searchKeyword.trim().isEmpty()) {
			keyword = "%%";
		} else {
			keyword = "%" + searchKeyword + "%";
		}
		couponListCount = couponService.selectCouponListCount(keyword);
		couponPaging = new Paging(couponListCount, nowPage, 10, 10);
		rb = new RowBounds(couponPaging.getStart() - 1, couponPaging.getCntPerPage());
		couponList = couponService.selectCouponList(keyword, rb);

		mo.addAttribute("searchKeyword", searchKeyword);
		mo.addAttribute("nowPage", nowPage);
		mo.addAttribute("couponPaging", couponPaging);
		mo.addAttribute("couponList", couponList);

		return "admin/adminCouponList";

	}

	// 쿠폰 정보 수정
	@RequestMapping("updateCoupon.cu")
	@ResponseBody
	public String updateCoupon(Coupon formdata) {

		couponService.updateCoupon(formdata);

		return "pass";

	}

	// 쿠폰 삭제
	@RequestMapping("deleteCoupon.cu")
	public String deleteCoupon(int couponCode) {

		couponService.deleteCoupon(couponCode);

		return "redirect:/selectCouponList.cu";
	}

	// 신청 독서 모임 리스트
	@RequestMapping("selectClubConfirmList.cl")
	public String selectClubConfirmList(Model mo, @RequestParam(name = "nowPage", defaultValue = "1") int nowPage,
			@RequestParam(name = "searchKeyword", defaultValue = "") String searchKeyword) {
		String keyword = null;
		Paging clubPaging = null;
		List<Club> selectClubConfirmList = null;
		RowBounds rb = null;
		int clubListCount = 0;
		if (searchKeyword == null || searchKeyword.trim().isEmpty()) {
			keyword = "%%";
		} else {
			keyword = "%" + searchKeyword + "%";
		}

		clubListCount = adminService.clubListCount(keyword);
		clubPaging = new Paging(clubListCount, nowPage, 10, 10);
		rb = new RowBounds(clubPaging.getStart() - 1, clubPaging.getCntPerPage());
		selectClubConfirmList = adminService.selectClubConfirmList(keyword, rb);

		mo.addAttribute("clubPaging", clubPaging);
		mo.addAttribute("nowPage", nowPage);
		mo.addAttribute("searchKeyword", searchKeyword);
		mo.addAttribute("selectClubConfirmList", selectClubConfirmList);

		return "admin/adminClubConfirm";
	}

	// 신청 독서 모임 승인, 반려 업데이트
	@RequestMapping("updateClubConfirm.cl")
	public String updateClubConfirm(int clubNo, int confirmStatus) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("confirmStatus", confirmStatus);
		map.put("clubNo", clubNo);
		adminService.updateClubConfirm(map);
		return "redirect:/selectClubConfirmList.cl";

	}

}
