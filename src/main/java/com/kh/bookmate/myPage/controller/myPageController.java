package com.kh.bookmate.myPage.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.management.RuntimeErrorException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.bookmate.addressBook.model.vo.AddressBook;
import com.kh.bookmate.book.model.service.BookService;
import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.bookreview.model.service.BookReviewService;
import com.kh.bookmate.bookreview.model.vo.BookReview;
import com.kh.bookmate.common.PageInfo;
import com.kh.bookmate.common.Pagination;
import com.kh.bookmate.coupon.model.service.CouponService;
import com.kh.bookmate.coupon.model.vo.Coupon;
import com.kh.bookmate.coupon.model.vo.UseCoupon;
import com.kh.bookmate.exchange_item.model.service.ExchangeItemService;
import com.kh.bookmate.exchange_item.model.vo.ExchangeItem;
import com.kh.bookmate.main.model.service.MainService;
import com.kh.bookmate.main.model.vo.RecentView;
import com.kh.bookmate.myPage.model.service.MyPageService;
import com.kh.bookmate.payment.model.service.PaymentService;
import com.kh.bookmate.payment.model.vo.Payment;
import com.kh.bookmate.payment.model.vo.PaymentDetail;
import com.kh.bookmate.returnBook.model.service.ReturnBookService;
import com.kh.bookmate.returnBook.model.vo.ReturnBook;
import com.kh.bookmate.ubook_payment.model.service.UbookPaymentService;
import com.kh.bookmate.ubook_payment.model.vo.UbookPayment;
import com.kh.bookmate.ubook_payment.model.vo.UbookPaymentDetail;
import com.kh.bookmate.user.model.service.UserService;
import com.kh.bookmate.user.model.vo.User;
import com.kh.bookmate.wishlist.model.vo.WishList;

@SessionAttributes("loginUser") // 로그인 유저 세션 유지 
@Controller
public class myPageController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PaymentService paymentService;
	
	
	@Autowired 
	private ExchangeItemService exchangeItemService;
	
	@Autowired
	private ReturnBookService returnBookService;
	
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private UbookPaymentService ubookPaymentService;
	
	@Autowired 
	private BookService bookService;
	
	@Autowired
	private MainService mainService;

	@Autowired
	private BookReviewService bookReviewService;
	
	@Autowired
	private MyPageService myPageService;

	

	//회원의 포인트 조회 
	@RequestMapping("myPoint.me")
	public String selectUserPoint(User user, HttpSession session, Model model ) throws Exception {
		
		String loginUser = ((User) session.getAttribute("loginUser")).getUserId(); 
		User userPoint = userService.selectUserPoint(loginUser);
		
		model.addAttribute("userPoint", userPoint);
		model.addAttribute("user",user);
	return "myPage/myPoint";

	}


	//마이페이지 이동 
	@RequestMapping("myPage.me")
	public String updateUser() {
		return "myPage/updateMyPage"; 
	}
	
	//회원정보 수정 
	@RequestMapping("update.me") 
	public String updateUser(@ModelAttribute User user, @RequestParam("post") String post,
														 @RequestParam("address1") String address1,
														 @RequestParam("address2")String address2, 
														 HttpSession session, Model model ) throws Exception  {
					
		user.setAddress(post+"/"+address1+"/"+address2);
		System.out.println("암호화전 : " + user.getUserPwd());
		
		String encPwd = bCryptPasswordEncoder.encode(user.getUserPwd());
		System.out.println("암호화 후  : " + encPwd);
		user.setUserPwd(encPwd);
		
		
		User userInfo = userService.updateUser(user);
		model.addAttribute("loginUser", userInfo); 

				return "myPage/updateMyPage"; 
	}
	
	
	
	//회원 비밀번호 변경하기
	@RequestMapping("updatePwd.me")
	public String UpdateMemberPwd(@ModelAttribute User user,HttpSession session,
			@RequestParam("userPwd") String userPwd, Model model) {

		//스프링엔 암호 복구화가 없다 
		
		String userId = user.getUserId(); 

		String encPwd = bCryptPasswordEncoder.encode(userPwd);
		
		user.setUserId(userId);
		user.setUserPwd(encPwd);
		
		userService.updatePwd(user);

		return "redirect:myPage.me";
		
	}

	
	//회원 탈퇴 
	@RequestMapping("delete.me")
	public String deleteUser (String userId) {
		
			userService.deleteUser(userId);
		return "redirect:logout.us";
	}

	
	//주문리스트 화면 띄우기 
	@RequestMapping("myPageMain.me")
	public String myOrderList() {
		return "myPage/myPageMain";
	}
	
	
	//주문리스트 조회 
	@RequestMapping("selectMyOrderList.me")
	public String selectMyOrderList(@RequestParam(value="currentPage",
					required = false, defaultValue="1")
					int currentPage,Model model, HttpSession session) { 
					
		//주문 내역보기 
		int listCount = myPageService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		
		String loginUser = ((User) session.getAttribute("loginUser")).getUserId(); 
		List<Payment> myOrderList = paymentService.selectMyOrderList(loginUser, pi);

			
		model.addAttribute("myOrderList",myOrderList);
		model.addAttribute("pi",pi);
		return "myPage/myPageOrderList";
	
	}
	
	
	//주문 리스트 내역 상세보기 
	@RequestMapping("selectMyOrderListDetail.me")
	public String selectMyOrderListDetail (Model model, int paymentNo, String bookISBN ) {	

		List<PaymentDetail> myOrderListDetail = paymentService.selectMyOrderListDetail(paymentNo);
//		Book bookList = bookService.selectBook(bookISBN);
	
		model.addAttribute("myOrderListDetail",myOrderListDetail);
//		model.addAttribute("bookISBN",bookISBN);
		return "myPage/myOrderListDetail";
		
	}

	// 배송전 사용자가 주문 취소하기
	@RequestMapping("cancelMyOrder.me")
	public String cancelMyOrder(int paymentNo, int paymentDetailNo, Model model) {

		paymentService.cancelMyOrder(paymentDetailNo); // 업데이트로 deliveryStatus 바꿔줌 
		model.addAttribute("paymentNo",paymentNo); //모델은 다음 화면에 필요한 파라미터를 주는 값 
		
		return "redirect:selectMyOrderListDetail.me";
	}

	// 배송후 사용자가 주문확정
	@RequestMapping("confirmOrder.me")
	public String confirmOrder(int paymentNo, int paymentDetailNo, Model model) {

		paymentService.confirmOrder(paymentDetailNo, paymentNo);
		model.addAttribute("paymentNo",paymentNo); 
		
		
		return "redirect:selectMyOrderListDetail.me";
	}

	
	//[교환] 신청 페이지로 이동하기 
	@RequestMapping("exchange.me") 
	public String applyExchange(int paymentNo, int paymentDetailNo, Model model){
	
		Payment payNo = paymentService.selectPaymentNo(paymentNo);
		PaymentDetail exchangeDetail = paymentService.applyExchange(paymentDetailNo);
		
		paymentService.exchangeWait(paymentDetailNo); //교환 버튼을 누르는 순간 교환 대기중으로 상태 변경하기 
		
		model.addAttribute("exchangeDetail",exchangeDetail);
		model.addAttribute("payNo",payNo);

		return "myPage/applyExchange";
	}
	
	
	//[교환] 신청하기 (교환테이블에 넣기) 
	@RequestMapping("insertExchange.me")
	public String insertExchangeItem(ExchangeItem exchangeBook,int paymentNo, Model model ) {
		exchangeItemService.insertExchangeItem(exchangeBook);
		model.addAttribute("paymentNo",paymentNo);

		return "redirect:selectMyOrderListDetail.me";
	}
	
	
	
	//[반품] 신청 페이지로 이동하기 
	@RequestMapping("return.me")
	public String applyReturn(int paymentNo, int paymentDetailNo, Model model){
		
		Payment payNo = paymentService.selectPaymentNo(paymentNo);
		PaymentDetail returnDetail = paymentService.applyExchange(paymentDetailNo);

		paymentService.exchangeWait(paymentDetailNo); //교환 버튼을 누르는 순간 교환 대기중으로 상태 변경하기 
		
		model.addAttribute("returnDetail",returnDetail);
		model.addAttribute("payNo",payNo);

		
		return "myPage/applyReturn";
	}
	
	
	//[반품] 신청하기 (반품테이블에 넣기) 
	@RequestMapping("insertReturn.me")
	public String insertReturn(ReturnBook returnBook,int paymentNo, Model model ) {
		returnBookService.insertReturnBook(returnBook);
		model.addAttribute("paymentNo",paymentNo);

		return "redirect:selectMyOrderListDetail.me";
	}
	

	//구매취소 리스트 
	@RequestMapping("cancelList.me")
	public String cancelList(@RequestParam(value="currentPage",
			required = false, defaultValue="1")
			int currentPage, Model model,HttpSession session) {
		

		int listCount = myPageService.selectCancelListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);

		String loginUser = ((User) session.getAttribute("loginUser")).getUserId();
		List<PaymentDetail> cList = paymentService.cancelList(loginUser, pi);
		model.addAttribute("cList", cList);
		model.addAttribute("pi ", pi);
		// System.out.println("cList=확인 =================" + cList.toString());

		return "myPage/cancelList";
	}
	
	// 교환/환불 리스트 조회
	@RequestMapping("refundAndExchangeList.me") // 왜 bookISBN no getter가 뜨는거지..
	public String selectReAndExList(@RequestParam(value="currentPage",
			required = false, defaultValue="1")
			int currentPage, PaymentDetail pd, Model model,HttpSession session) {
		

		int listCount = myPageService.selectrefundAndExchangeListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);

		
		String loginUser = ((User) session.getAttribute("loginUser")).getUserId();
		List<PaymentDetail> rxList = paymentService.selectReAndExList(loginUser,pi);

		model.addAttribute("rxList", rxList);
		model.addAttribute("pi ", pi);


		return "myPage/refundAndExchangeList";
	}


	//[중고] 주문 리스트 
	@RequestMapping("selectMyOrderList.ub")
	public String selectUbookMyOrderList(Model model, HttpSession session) { 
					
		//주문 내역보기 
		String loginUser = ((User) session.getAttribute("loginUser")).getUserId(); 
		List<UbookPayment> ubMyOrderList = ubookPaymentService.selectUbookMyOrderList(loginUser);

			
		model.addAttribute("ubMyOrderList",ubMyOrderList);
		return "myPage/secondaryMarketOrderList";
	}

	
	//[중고] 주문 리스트 내역 상세보기 
	@RequestMapping("selectMyOrderListDetail.ub")
	public String selectUbookMyOrderDetailList (Model model, int paymentNoUb ) {	

		List<UbookPaymentDetail> ubMyOrderListDetail = ubookPaymentService.selectUbookMyOrderDetailList(paymentNoUb);
		model.addAttribute("ubMyOrderListDetail",ubMyOrderListDetail);
		
		return "myPage/secondaryMarketOrderDetailList";
		
	}
	
	//[중고] 배송후 사용자가 주문확정
	@RequestMapping("confirmOrder.ub")
	public String confirmOrderUbook(int paymentNoUb, int paymentDetailNoUb, Model model) {

		ubookPaymentService.confirmOrderUbook(paymentDetailNoUb);
		model.addAttribute("paymentNoUb",paymentNoUb); 
				
		return "redirect:selectMyOrderListDetail.ub";
	}

	
	//쿠폰 조회하기 
	@RequestMapping(value="/checkCu.me")
	@ResponseBody														
	public String checkUseCoupon(@RequestParam("couponCode") String couponCode, String user_Id) { 
										//사용자한테 (쿠폰 코드만) 받을 수 있는 값만 적어야됨 
			
		int result = couponService.checkUseCoupon(couponCode); //코드 중복체크 
			if(result > 0) {
				UseCoupon uc = new UseCoupon(user_Id, couponCode);	
				UseCoupon uc1 = couponService.checkAlreadyUsedCoupon(uc); 
				//쿠폰코드랑 매퍼에서 꺼내서 쓸수있음 값 null 아니면 사용한
				if(uc1 != null){
						//useCoupon의 값이 null이 아니면 이미 사용한 쿠폰 
					return "usedAlready";
				}
				return "available"; // coupon에 사용가능한 쿠폰을 체크함
			}else {
				return "nope"; // 없는 코드는 사용할 수 없음 
			}
	}
	
	//만약 쿠폰 중복 체크 했을때 useCoupon에 인서트하기/ 사용자테이블에 포인트 올려주기 
	@RequestMapping("updateCoupon.me")
	@ResponseBody	
	public String updateCoupon(String couponCode, String user_Id) { 

		UseCoupon uc = new UseCoupon(user_Id, couponCode); //usecoupon에 인서트 해줄려 이거 두개만 찍히니까		
		couponService.selectUseCoupon(uc); 
	
		Coupon cu = couponService.selectCoupon(couponCode); // 쿠폰 코드로 쿠폰객체 들고오기 
		couponService.updateCoupon(uc,cu); //유저아이디랑, 쿠폰코드 받아옴 
		
		return cu.getCouponPoint() +"";
				
	}
	
	
	//최근 본 목록 보기 (서연씨꺼 메인 마이페이지에 연결) 
	@RequestMapping("recentlyView.me")
	public String myRecentlyView(HttpSession session, Model model) {
	
		String loginUser = ((User) session.getAttribute("loginUser")).getUserId(); 

    	RecentView rv = mainService.selectRecentView(loginUser);
    	String[] tempArr = null;
    	ArrayList<String> isbnList = null;
    	List<Book> viewList = new ArrayList<Book>();
    	
    	if(rv != null) {
    		tempArr = rv.getBooks().split(",");
    		isbnList = new ArrayList<String>(Arrays.asList(tempArr)); //화면에 리스트로 보내기
	    	viewList = mainService.selectRecentViewList(isbnList);
    	
    	}
    	
    	model.addAttribute("isbnList", isbnList); 
		model.addAttribute("viewList", viewList);		
		
		return "myPage/recentlyViewInMyPage";
	}
	
	
	//내가 쓴 리뷰 보기 
	@RequestMapping("myReview.me")
	public String selectReviewListMine(@RequestParam(value="currentPage",
			required = false, defaultValue="1")
			int currentPage,HttpSession session, Model model, BookReview rb) {
		

		int listCount = myPageService.selectReviewListMineCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		String loginUser = ((User) session.getAttribute("loginUser")).getUserId(); 
		//리뷰 제목, 리뷰 내용, 리뷰작성 날짜 정도 내 페이지에서 보여주게 한 다음에 상세보기로 연결시키기 
		List<BookReview> myBrList = bookReviewService.selectReviewListMine(loginUser,pi);
		model.addAttribute("myBrList",myBrList);
		model.addAttribute("pi",pi);
	
		
		return "myPage/myReviewList";
	}
	
	
	//나의 주소록 관리
	@RequestMapping("myAddressMange.me")
	public String myAddressManage(HttpSession session, Model model) {
		
		String loginUser = ((User) session.getAttribute("loginUser")).getUserId(); 
	
		List<AddressBook> myAdressBookList = myPageService.selectMyAddressList(loginUser);
		model.addAttribute("myAdressBookList",myAdressBookList);
		
		return"myPage/myAddressManageList";
	}
	
	//나의 찜목록 리스트 
	@RequestMapping("wishList.me")
	public String myWishList(HttpSession session, Model model) {

		String loginUser = ((User) session.getAttribute("loginUser")).getUserId();
		List<WishList> wList = myPageService.selectMyWishList(loginUser);
		model.addAttribute("wList",wList);
		
		return "myPage/myWishList";
	}
	
	
	
	
}