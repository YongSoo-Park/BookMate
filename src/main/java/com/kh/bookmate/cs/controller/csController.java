package com.kh.bookmate.cs.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.bookmate.book.model.service.BookService;
import com.kh.bookmate.exchange_item.model.service.ExchangeItemService;
import com.kh.bookmate.exchange_item.model.vo.ExchangeItem;
import com.kh.bookmate.payment.model.service.PaymentService;
import com.kh.bookmate.payment.model.vo.Payment;
import com.kh.bookmate.payment.model.vo.PaymentDetail;
import com.kh.bookmate.returnBook.model.service.ReturnBookService;
import com.kh.bookmate.returnBook.model.vo.ReturnBook;
import com.kh.bookmate.user.model.service.UserService;

// 교환과 반품 승인버튼 값 업데이트 해주는 cs 페이지 


@SessionAttributes("loginUser") // 로그인 유저 세션 유지 
@Controller
public class csController {
	
	@Autowired
	private PaymentService paymentService;
	
	@Autowired 
	private ExchangeItemService exchangeItemService;
	
	@Autowired
	private ReturnBookService returnBookService; 
	
	@Autowired
	private UserService userService;
	
	
	@Autowired
	private BookService bookService;
	
	
	@RequestMapping("goAdminMain.cs")
	public String adminExchange() {
		
		return "cs/adminCsMain";
	}
	
	
	
	//[관리자]교환 리스트 가져오기 
	@RequestMapping("selectExchangeList.cs") //ExchangeItem exchangeBook,
	public String selectExchangeList( Model model){
		
		
		List <ExchangeItem> exchangeList = exchangeItemService.selectExchangeList();
	//	System.out.println(exchangeList.toString()+"============익스체인지리스트 ==========");
		//위에서 교환신청이 들어 온 건에 대해서 조회하기 
		
		//디테일 넘버만 따로 뽑아 파라미터로 보낸다 
		List<Integer> exchangeDetailNoList = new ArrayList<>();
	      for(ExchangeItem e : exchangeList) {
	    	  exchangeDetailNoList.add(e.getPaymentDetailNo());
	      }
	//	System.out.println(exchangeDetailNoList+"----------------------exchangeDetailNoList");
	
		//디테일 넘버 뽑아낸 파라미터를 페이먼트 디테일로 보내면 페이먼트 디테일에 있는 열 값을 쓸수있음 
		List <PaymentDetail> orderDetailList = exchangeItemService.selectOrderDetailNoList(exchangeDetailNoList);
	//  	System.out.println(orderDetailList+"=======exchange_item에서 detailNo만 뽑은거임 ===널..? ========");
	  	
		model.addAttribute("exchangeList", exchangeList);
		model.addAttribute("orderDetailList", orderDetailList);
		
		return "cs/adminExchange";

	}
		 
	//[관리자] 교환 상태값 업데이트 
	@RequestMapping("updateExchangeList.cs")
	public String updateExchangeList(int paymentDetailNo, Model model ) {

		exchangeItemService.updateExchangeList(paymentDetailNo); // 관리자화면 교환 승인시 교환완료로 업데이트 
		paymentService.updateUserExList(paymentDetailNo);
		return "redirect:selectExchangeList.cs";
	}
	 

	//[관리자] 배송 리스트 불러오기 
	@RequestMapping("deliveryList.cs")  
	public String selectDeliveryList(Model model) {
		
		List<PaymentDetail> pList = paymentService.selectDeliveryList();
		
		model.addAttribute("pList", pList );
		return "cs/adminDelivery";
	}
	
	//[관리자] 배송 대기중인애들 배송중으로 바꿔주기 
	@RequestMapping("updateDeliveryList.cs")  
	public String updateDeliveryList(int paymentDetailNo, Model model) {
		
		paymentService.updateDeliveryList(paymentDetailNo); //관리자 화면 배송중으로 업데이트 
		model.addAttribute("paymentDetailNo",paymentDetailNo);
		
		return "redirect:deliveryList.cs";
	}
	
	
	//[관리자] 반품 리스트 가져오기 
	@RequestMapping("selectReturnList.cs")  
	public String selectReturnList(Model model) {
		
		//반품 목록 리스트를 먼저 뽑는다 
		List<ReturnBook> returnBookList = returnBookService.selectReturnList();
		System.out.println("========================" + returnBookList);
		
		//디테일페이먼트에 있는 것이 필요하니까 디테일넘버만 뽑아서 파라미터로 보낸다 
		List<Integer> returnDetailNoList = new ArrayList<>();
	      for(ReturnBook r : returnBookList) {
	    	  returnDetailNoList.add(r.getPaymentDetailNo());
	      }
	      
	     List<PaymentDetail> orderDetailList = returnBookService.selectReturnOrderDetailNoList(returnDetailNoList);
		model.addAttribute("returnBookList",returnBookList);
		model.addAttribute("orderDetailList",orderDetailList);
//		model.addAttribute("paymentNo",paymentNo);
		
		
		return "cs/adminReturn";
	}
	
	//[관리자] 반품 교환/반품 대기중인 애들
	@RequestMapping("updateReturnList.cs") 
	public String updateReturnList(int paymentDetailNo, Model model, Payment p) {
	
		paymentService.updateReturn(paymentDetailNo, p );

		return "redirect:selectReturnList.cs";
	}
	
	
	

}
