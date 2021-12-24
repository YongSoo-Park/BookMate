package com.kh.bookmate.seller.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.bookmate.seller.model.service.SellerService;
import com.kh.bookmate.seller.model.vo.Seller;
import com.kh.bookmate.ubook.model.service.UbookService;
import com.kh.bookmate.ubook.model.vo.Ubook;
import com.kh.bookmate.ubook_payment.model.service.UbookPaymentService;
import com.kh.bookmate.ubook_payment.model.vo.UbookPayment;
import com.kh.bookmate.ubook_payment.model.vo.UbookPaymentDetail;
import com.kh.bookmate.user.model.vo.User;

@SessionAttributes("loginSeller") 
@Controller
public class SellerController {
	
	@Autowired
	private SellerService sellerService;
	@Autowired
	private UbookService ubookService;
	@Autowired
	private UbookPaymentService ubookPaymentService;
	
	
	//판매자 닉네임 중복 확인
	@ResponseBody
	@RequestMapping(value="/chkNickN.se", method=RequestMethod.POST)
	public String chkNickN(String sellerNickN) {

		int result = sellerService.chkNickN(sellerNickN);
		if(result > 0) {  //이미 이름 있는 경우
			return "no";
		}else {
			return "use";
		}
	}
	
	//현재 로그인한 판매자 페이지 정보
	@RequestMapping("sellerPage.se")
	public String sellerPage(HttpServletRequest request, Model model) {
		String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
		Seller s = sellerService.loginSeller(userId);
		model.addAttribute("s", s);
		/*
		int sellerNumber = s.getSellerNo();

		System.out.println("userId데 보이나..?" + sellerNumber);
		List<Ubook> haveQnaUbook = ubookService.haveQnaUbook(sellerNumber);
		System.out.println("haveQnaUbook 보이나..?" + haveQnaUbook);
		model.addAttribute("haveQnaUbook", haveQnaUbook);*/
		
		return "seller/sellerPage";
	}
	
	//판매자 정보 수정
	@RequestMapping(value="sellerUpdate.se")
	public String updateSeller(@ModelAttribute Seller seller,
								HttpServletRequest request,
								@RequestParam("sellerEmail") String sellerEmail,
								@RequestParam("sellerPhone") String sellerPhone,
								@RequestParam("sellerDel") String sellerDel,
								@RequestParam("post") String post,
								 @RequestParam("address1") String address1,
								 @RequestParam("address2") String address2,
								 HttpSession session, Model model) {
		Seller s = new Seller();
		s.setSellerId(request.getParameter("sellerId"));
		s.setSellerEmail(sellerEmail);
		s.setSellerPhone(sellerPhone);
		s.setSellerDel(sellerDel);
		s.setSellerAddress(post+"/"+address1+"/"+address2); 
		
		int result = sellerService.updateSeller(s);
		
		return "redirect:/sellerPage.se";
	}
	
	//판매자 가입 화면
	@RequestMapping("sellerInsertForm.se")
	public String sellerInsertForm() {
		return "seller/sellerInsertForm";
	}
	
	//판매자 가입
	@RequestMapping(value="insertSeller.se")
	public String insertSeller(@ModelAttribute Seller s,
			@RequestParam("post") String post,
			 @RequestParam("address1") String address1,
			 @RequestParam("address2") String address2,
					 			HttpSession session){
		
		s.setSellerAddress(post+"/"+address1+"/"+address2); 

		sellerService.insertSeller(s);
		
		return "redirect:/ubookMain.ub";
	}
	
	//판매자 휴면 전환
	@RequestMapping(value="deleteSeller.se")
	public String deleteSeller(Seller s, HttpServletRequest request) {
		sellerService.deleteSeller(s);
		return "redirect:/ubookMain.ub";
	}
	
	
	//판매자가 등록한 도서 중 주문된 도서 정보 확인
	@RequestMapping("selectOrderUbookList.se")
	@ResponseBody
	public List<UbookPaymentDetail> selectOrderUbookList(HttpServletRequest request, Model model) {

		String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
		Seller s = sellerService.loginSeller(userId);
		
		int bSellerNo = s.getSellerNo();
		
		
		List<UbookPaymentDetail> ubookPayDetailList = ubookPaymentService.selectOrderUbookList(bSellerNo);

		System.out.println("ubookPayDetailList 컨트롤러 - 결제내역 중 조건에 맞는 도서 리스트 보여줌" + ubookPayDetailList);
		
		model.addAttribute("ubookPayDetailList", ubookPayDetailList);
		
		return ubookPayDetailList;
	}

	
	//주문자 정보 보여주기
	   @RequestMapping(value="selectOrderUserInfo.se")
	   @ResponseBody
	   public UbookPayment selectOrderUserInfo(@RequestParam("paymentNoUb") int paymentNoUb,
			   											Model model) {
		   UbookPayment ubookPayment = ubookPaymentService.selectOrderUserInfo(paymentNoUb);
	      return ubookPayment;
	   }
		
		
		//주문 도서 정보 보여주기
		   @RequestMapping(value="selectOrderBookInfo.se")
		   @ResponseBody
		   public UbookPaymentDetail selectOrderBookInfo(@RequestParam("paymentNoUb") int paymentNoUb,
				   										@RequestParam("ubookNoUb") int ubookNoUb,
				   											Model model) {
			   UbookPaymentDetail upd = new UbookPaymentDetail();
			   upd.setPaymentNoUb(paymentNoUb);
			   upd.setUbookNoUb(ubookNoUb);
			   
			UbookPaymentDetail ubookPaymentDetail = ubookPaymentService.selectOrderBookInfo(upd);
		      return ubookPaymentDetail;
		   }
			
			//주문 도서 정보 정보 변경일, 배송상태 변경
			   @RequestMapping(value="updateOrderInfo.se")
			   public String updateOrderInfo(@RequestParam("paymentNoUb") int paymentNoUb,
					   						@RequestParam("deliveryStatusUb") String deliveryStatusUb,
					   											Model model) {
				   UbookPaymentDetail updUp = new UbookPaymentDetail();
				   updUp.setPaymentNoUb(paymentNoUb);
				   updUp.setDeliveryStatusUb(deliveryStatusUb);
				   System.out.println("배송상태 변경???? 컨트롤러 : "+deliveryStatusUb);
				int ubookPaymentDetail = ubookPaymentService.updateOrderInfo(updUp);

				return "redirect:/sellerPage.se";
			   }
			   
				//판매완료 도서 정보 보여주기
			   @RequestMapping("selectSoldUbookList.se")
				@ResponseBody
			   public List<UbookPaymentDetail> selectSoldUbookList(HttpServletRequest request,
					   							Model model) {

					String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
					Seller s = sellerService.loginSeller(userId);
					
					int bSellerNo = s.getSellerNo();
					
					/*
					 * UbookPaymentDetail updSold = new UbookPaymentDetail();
					 * updSold.setBSellerNo(bSellerNo);
					 * updSold.setDeliveryStatusUb(deliveryStatusUb);
					 * System.out.println("판매완료???? 컨트롤러 : "+updSold);
					 */
				   

					
					List<UbookPaymentDetail> ubookSoldList = ubookPaymentService.selectSoldUbookList(bSellerNo);

					System.out.println("ubookSoldList 컨트롤러 - 판매완료 도서 리스트 보여줌" + ubookSoldList);
					
					model.addAttribute("ubookSoldList", ubookSoldList);
					
				//int ubookPaymentDetail = ubookPaymentService.selectSoldUbookList(updSold);

				return ubookSoldList;
			   }
			   
			   
			   
			   
			   
}
