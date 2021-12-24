package com.kh.bookmate.ubook_cart.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.bookmate.addressBook.model.service.AddressBookService;
import com.kh.bookmate.addressBook.model.vo.AddressBook;
import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.common.AES;
import com.kh.bookmate.payment.model.vo.Payment;
import com.kh.bookmate.payment.model.vo.PaymentDetail;
import com.kh.bookmate.paymentmethod.model.service.PaymentMethodService;
import com.kh.bookmate.paymentmethod.model.vo.PaymentMethod;
import com.kh.bookmate.paymentmethod.model.vo.PaymentMethodDetail;
import com.kh.bookmate.shoppingbasket.model.service.ShoppingBasketService;
import com.kh.bookmate.shoppingbasket.model.vo.ShoppingBasket;
import com.kh.bookmate.ubook.model.vo.Ubook;
import com.kh.bookmate.ubook_cart.model.service.UbookCartService;
import com.kh.bookmate.ubook_cart.model.vo.UbookCart;
import com.kh.bookmate.ubook_payment.model.vo.UbookPayment;
import com.kh.bookmate.ubook_payment.model.vo.UbookPaymentDetail;
import com.kh.bookmate.user.model.vo.User;


@Controller
public class UbookCartController {

	@Autowired
	private UbookCartService ubookCartService;

	@Autowired
	private AddressBookService addressBookService;
	
	@Autowired
	private PaymentMethodService paymentMethodService;

	@RequestMapping("insertCart.ub")
	@ResponseBody
	public String insertCart(UbookCart cart) {

		UbookCart temp = null; 
		temp = ubookCartService.selectCart(cart);
		if(temp != null) {
			return "already";
		}
		System.out.println(cart);
		ubookCartService.insertCart(cart);
		return "success";
	}

	@RequestMapping("ubookCart.ub")
	public String selectCartList(@SessionAttribute("loginUser") User user, Model mo) {

		List<UbookCart> cartList = null;
		List<Ubook> cartItemList = null;
		String shipDate = new SimpleDateFormat("yyyy-MM-dd").format(ShipDate());
		String cartUserId = user.getUserId();
		cartList = ubookCartService.selectCartList(cartUserId);
		
		if(cartList.size() > 0) { 
			//cartItemList = ubookCartService.selectUBookList(cartUserId);
			cartItemList = ubookCartService.selectUBookList(cartList);
		}
		
		
		System.out.println("컨트롤러 유저 아이디:" + cartUserId);
		System.out.println("컨트롤러 cartList:" + cartList);
		System.out.println("컨트롤러 cartItemList:" + cartItemList);
		
		mo.addAttribute("cartList", cartList);
		mo.addAttribute("cartItemList", cartItemList);
		mo.addAttribute("shipDate", shipDate);

		return "ubook_cart/ubookCart";

	}

	@RequestMapping("moveUbookPayment.ub")
	public String selectPaymentPage(UbookCart cartList, @SessionAttribute("loginUser") User user,Model mo) {

		List<UbookCart> newCartList = new ArrayList<UbookCart>();
		
		List<Ubook> cartItemList = null;
		List<UbookPaymentDetail> orderList = new ArrayList<UbookPaymentDetail>();
		UbookPayment order = null;
		UbookPaymentDetail orderDetail = null;
		Ubook tempUbook = null;
		AddressBook abook = null;
		UbookCart tempCart = null;
		PaymentMethod paymentMethod = null;
		List<PaymentMethodDetail> PMDetailList = null;
		int totalCost = 0;
		String shippingName, shippingAddress, shippingPhone;
		String[] shippingAddressArr;
		for(UbookCart temp : cartList.getCartList()) {
			if(temp.getCartUbNo() != 0) {
				System.out.println(temp);
				newCartList.add(temp);
			}
		}
		//주문 페이지로 가져갈 장바구니 상품들과 주문테이블에 표시될 금액 정보 처리
		cartItemList = ubookCartService.selectUBookList(newCartList);
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaa"+cartItemList.size());
		for (int i = 0; i < newCartList.size(); i++) {
			tempUbook = cartItemList.get(i);
			tempCart = newCartList.get(i);
			orderDetail = new UbookPaymentDetail(tempUbook.getUbookNo(), tempUbook.getBSellerNo(), tempUbook.getUbookImg(), tempUbook.getUbookName(),
					tempCart.getCartCount(), tempUbook.getUbookOPrice(), tempUbook.getUbookPrice());
			orderDetail.setDeliveryDateUb(ShipDate());
			orderList.add(orderDetail);

			System.out.println("orderList" + orderList);
			System.out.println("orderList" + orderList.get(i).getUbookImgUb());

			totalCost += (int) (tempUbook.getUbookPrice() * tempCart.getCartCount());
			totalCost = totalCost+ (int) (2600 * tempCart.getCartCount());
		}

		
		//주문 페이지로 가져갈 주소록 처리
		abook = addressBookService.selcetAddressBook(user.getUserId());
		if (abook != null) {
			String[] arrTemp = abook.getMainAddress().split("_");
			shippingName = arrTemp[0];
			shippingAddress = arrTemp[1];
			shippingPhone = arrTemp[2];
		} else {
			shippingName = user.getUserName();
			shippingAddress = user.getAddress();
			shippingPhone = user.getPhone();
			String strTemp = shippingName + "_" + shippingAddress + "_" + shippingPhone;
			abook = new AddressBook(user.getUserId(), strTemp);
			addressBookService.insertAddressBook(abook);
		}
		
		//주문 페이지로 가져갈 저장된 결제수단 처리
		paymentMethod = paymentMethodService.selectPaymentMethod(user.getUserId());
		if(paymentMethod==null) {
			paymentMethodService.insertPaymentMethod(user.getUserId());
		}else {
			if(paymentMethod.getMainPayment()!=0) {
			
				PMDetailList = paymentMethodService.selectPMDetailList(paymentMethod);

				int savedMethodLength = PMDetailList.size();
				
				PaymentMethodDetail PMDetail = new PaymentMethodDetail();
				
				PMDetail = AESDecodeJob(PMDetailList.get(0));
								
			
				
				mo.addAttribute("savedMethodLength", savedMethodLength);
				mo.addAttribute("PMDetail", PMDetail);
			}
		}

		shippingAddressArr = shippingAddress.split("/");
		
		order = new UbookPayment(user.getUserId(), shippingName, shippingAddressArr[0], shippingAddressArr[1],shippingAddressArr[2],shippingPhone, totalCost);

		mo.addAttribute("deleteCartList", newCartList);
		mo.addAttribute("order", order);
		mo.addAttribute("orderList", orderList);
		return "ubook_payment/ubookOrderDetail";

	}

	public Date ShipDate() {
		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"), Locale.KOREA);
		Date date = cal.getTime();
		if (16 > Integer.parseInt(new SimpleDateFormat("HH").format(date))) {

//			new SimpleDateFormat("yyyy-MM-dd").format(date);
			return date;
		} else {
			cal.add(cal.DATE, 1);
//			new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
			return cal.getTime();
		}
	}
	
	@RequestMapping("deleteCart.ub")
	@ResponseBody
	public String deleteCart(int cartNo) {
		
		int result = ubookCartService.deleteCart(cartNo);
		if(result > 0) {
			return "pass";
		}
		
		return "fail";
		
	}
	
	private PaymentMethodDetail AESDecodeJob(PaymentMethodDetail pmd){

		PaymentMethodDetail PMDetail = new PaymentMethodDetail();
		try {
			AES aes = new AES(pmd.getMethodPwd().substring(0, 16));
			
		if(pmd.getMethodStatus()==1) {
			PMDetail.setCardCompany(aes.aesDecode(pmd.getCardCompany()));
			PMDetail.setCardNo(aes.aesDecode(pmd.getCardNo()));
			PMDetail.setCardCVC(aes.aesDecode(pmd.getCardCVC()));
		}else if(pmd.getMethodStatus()==2){
			PMDetail.setBankName(aes.aesDecode(pmd.getBankName()));
			PMDetail.setBankAccount(aes.aesDecode(pmd.getBankAccount()));
			PMDetail.setBankPwd(aes.aesDecode(pmd.getBankPwd()));
			PMDetail.setUserReg(aes.aesDecode(pmd.getUserReg()));
		}else {
			PMDetail.setPhoneNo(aes.aesDecode(pmd.getPhoneNo()));
			PMDetail.setUserReg(aes.aesDecode(pmd.getUserReg()));
		}
		PMDetail.setUser_Id(pmd.getUser_Id());
		PMDetail.setMethodStatus(pmd.getMethodStatus());
		PMDetail.setMethodPwd(pmd.getMethodPwd());
		PMDetail.setPaymentMethodDetailNo(pmd.getPaymentMethodDetailNo());
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return PMDetail;
	
	}
}
