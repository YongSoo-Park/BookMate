package com.kh.bookmate.shoppingbasket.controller;

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
import com.kh.bookmate.book.model.service.BookService;
import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.common.AES;
import com.kh.bookmate.payment.model.vo.Payment;
import com.kh.bookmate.payment.model.vo.PaymentDetail;
import com.kh.bookmate.paymentmethod.model.service.PaymentMethodService;
import com.kh.bookmate.paymentmethod.model.vo.PaymentMethod;
import com.kh.bookmate.paymentmethod.model.vo.PaymentMethodDetail;
import com.kh.bookmate.shoppingbasket.model.service.ShoppingBasketService;
import com.kh.bookmate.shoppingbasket.model.vo.ShoppingBasket;
import com.kh.bookmate.user.model.vo.User;

@Controller
public class BasketController {

	@Autowired
	private ShoppingBasketService shoppingBasketService;

	@Autowired
	private AddressBookService addressBookService;

	@Autowired
	private PaymentMethodService paymentMethodService;

	@Autowired
	private BookService bookService;

	// 장바구니 담기
	@RequestMapping("insertBasket.ba")
	@ResponseBody
	public String insertBasket(ShoppingBasket basket) {

		ShoppingBasket temp = null;
		temp = shoppingBasketService.selectBasket(basket);
		if (temp != null) {
			return "already";
		}
		shoppingBasketService.insertBasket(basket);
		return "success";
	}

	// 장바구니 페이지 이동
	@RequestMapping("shoppingCart.sc")
	public String selectCartList(String user_Id, Model mo) {

		List<ShoppingBasket> basketList = null;
		List<Book> cartItemList = null;
		String shipDate = new SimpleDateFormat("yyyy-MM-dd").format(ShipDate());
		basketList = shoppingBasketService.selectCartList(user_Id);
		if (basketList.size() > 0) {
			cartItemList = shoppingBasketService.selectBookList(basketList);
		}
		mo.addAttribute("basketList", basketList);
		mo.addAttribute("cartItemList", cartItemList);
		mo.addAttribute("shipDate", shipDate);

		return "basket/shoppingCart";

	}

	// 장바구니 삭제
	@RequestMapping("deleteBasket.sc")
	@ResponseBody
	public String deleteBasket(int basketNo) {

		int result = shoppingBasketService.deleteBasket(basketNo);
		if (result > 0) {
			return "pass";
		}

		return "fail";

	}

	// 출고일자 결정 오후 4시 이전 주문시 당일 그 이후 다음날 출고
	public Date ShipDate() {
		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"), Locale.KOREA);
		Date date = cal.getTime();
		if (16 > Integer.parseInt(new SimpleDateFormat("HH").format(date))) {

			return date;
		} else {
			cal.add(cal.DATE, 1);
			return cal.getTime();
		}
	}

	// 결제 페이지 이동
	@RequestMapping("movePayment.sc")
	public String selectPaymentPage(ShoppingBasket basketList, @SessionAttribute("loginUser") User user, Model mo) {

		List<ShoppingBasket> newBasketList = new ArrayList<ShoppingBasket>();

		List<Book> cartItemList = null;
		List<PaymentDetail> orderList = new ArrayList<PaymentDetail>();
		Payment order = null;
		PaymentDetail orderDetail = null;
		Book tempBook = null;
		AddressBook abook = null;
		ShoppingBasket tempBasket = null;
		PaymentMethod paymentMethod = null;
		List<PaymentMethodDetail> PMDetailList = null;
		int totalCost = 0;
		List<String[]> abookCheck = null;

		int totalGetPoint = 0;
		String shippingName, shippingAddress, shippingPhone;
		String[] shippingAddressArr;
		for (ShoppingBasket temp : basketList.getBasketList()) {
			if (temp.getBookISBN() != null) {
				System.out.println(temp);
				newBasketList.add(temp);
			}
		}

		// 주문 페이지로 가져갈 장바구니 상품들과 주문테이블에 표시될 금액 정보 처리
		cartItemList = shoppingBasketService.selectBookList(newBasketList);

		for (int i = 0; i < newBasketList.size(); i++) {
			tempBook = cartItemList.get(i);
			tempBasket = newBasketList.get(i);
			orderDetail = new PaymentDetail(tempBook.getBookISBN(), tempBook.getBookMainImg(), tempBook.getBookTitle(),
					tempBasket.getQuantity(), tempBook.getBookPrice(), (int) (tempBook.getBookPrice() * 0.9),
					(int) (tempBook.getBookPrice() * 0.05));
			orderDetail.setDeliveryDate(ShipDate());
			orderList.add(orderDetail);
			totalCost += (int) (tempBook.getBookPrice() * 0.9 * tempBasket.getQuantity());
			totalGetPoint += (int) ((tempBook.getBookPrice() * tempBasket.getQuantity()) * 0.05);
		}

		// 주문 페이지로 가져갈 주소록 처리
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

		// 주문 페이지로 가져갈 저장된 결제수단 처리
		paymentMethod = paymentMethodService.selectPaymentMethod(user.getUserId());
		if (paymentMethod == null) {
			paymentMethodService.insertPaymentMethod(user.getUserId());
		} else {
			if (paymentMethod.getMainPayment() != 0) {

				PMDetailList = paymentMethodService.selectPMDetailList(paymentMethod);

				int savedMethodLength = PMDetailList.size();

				PaymentMethodDetail PMDetail = new PaymentMethodDetail();

				PMDetail = AESDecodeJob(PMDetailList.get(0));

				mo.addAttribute("savedMethodLength", savedMethodLength);
				mo.addAttribute("PMDetail", PMDetail);
			}
		}

		shippingAddressArr = shippingAddress.split("/");
		abookCheck = abookCheck(abook);
		order = new Payment(user.getUserId(), shippingName, shippingAddressArr[0], shippingAddressArr[1],
				shippingAddressArr[2], shippingPhone, totalCost, totalGetPoint);
		if (totalCost < 10000) {
			order.setDeliveryCost(2500);
		} else {
			order.setDeliveryCost(0);
		}
		mo.addAttribute("abook", abookCheck);
		mo.addAttribute("deleteBasketList", newBasketList);
		mo.addAttribute("order", order);
		mo.addAttribute("orderList", orderList);
		return "payment/orderDetail";

	}

	// db에 저장된 암호화된 결제 수단 정보 복호화
	private PaymentMethodDetail AESDecodeJob(PaymentMethodDetail pmd) {

		PaymentMethodDetail PMDetail = new PaymentMethodDetail();
		try {
			AES aes = new AES(pmd.getMethodPwd().substring(0, 16));

			if (pmd.getMethodStatus() == 1) {
				PMDetail.setCardCompany(aes.aesDecode(pmd.getCardCompany()));
				PMDetail.setCardNo(aes.aesDecode(pmd.getCardNo()));
				PMDetail.setCardCVC(aes.aesDecode(pmd.getCardCVC()));
			} else if (pmd.getMethodStatus() == 2) {
				PMDetail.setBankName(aes.aesDecode(pmd.getBankName()));
				PMDetail.setBankAccount(aes.aesDecode(pmd.getBankAccount()));
				PMDetail.setBankPwd(aes.aesDecode(pmd.getBankPwd()));
				PMDetail.setUserReg(aes.aesDecode(pmd.getUserReg()));
			} else {
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

	// 단일 도서 바로 주문시
	@RequestMapping("moveS_OrderPayment.sc")
	public String moveS_OrderPayment(String bookISBN, int quantity, @SessionAttribute("loginUser") User user,
			Model mo) {

		Payment order = null;
		PaymentDetail orderItem = null;
		Book tempBook = null;
		AddressBook abook = null;
		PaymentMethod paymentMethod = null;
		List<PaymentMethodDetail> PMDetailList = null;
		int totalCost = 0;
		List<String[]> abookCheck = null;
		int totalGetPoint = 0;
		String shippingName, shippingAddress, shippingPhone;
		String[] shippingAddressArr;

		// 주문 페이지로 가져갈 장바구니 상품들과 주문테이블에 표시될 금액 정보 처리

		tempBook = bookService.selectBook(bookISBN);
		orderItem = new PaymentDetail(tempBook.getBookISBN(), tempBook.getBookMainImg(), tempBook.getBookTitle(),
				quantity, tempBook.getBookPrice(), (int) (tempBook.getBookPrice() * 0.9),
				(int) (tempBook.getBookPrice() * 0.05));
		orderItem.setDeliveryDate(ShipDate());
		totalCost += (int) (tempBook.getBookPrice() * 0.9 * quantity);
		totalGetPoint += (int) ((tempBook.getBookPrice() * quantity) * 0.05);

		// 주문 페이지로 가져갈 주소록 처리
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

		// 주문 페이지로 가져갈 저장된 결제수단 처리
		paymentMethod = paymentMethodService.selectPaymentMethod(user.getUserId());
		if (paymentMethod == null) {
			paymentMethodService.insertPaymentMethod(user.getUserId());
		} else {
			if (paymentMethod.getMainPayment() != 0) {

				PMDetailList = paymentMethodService.selectPMDetailList(paymentMethod);

				int savedMethodLength = PMDetailList.size();

				PaymentMethodDetail PMDetail = new PaymentMethodDetail();

				PMDetail = AESDecodeJob(PMDetailList.get(0));

				mo.addAttribute("savedMethodLength", savedMethodLength);
				mo.addAttribute("PMDetail", PMDetail);
			}
		}

		abookCheck = abookCheck(abook);
		shippingAddressArr = shippingAddress.split("/");

		order = new Payment(user.getUserId(), shippingName, shippingAddressArr[0], shippingAddressArr[1],
				shippingAddressArr[2], shippingPhone, totalCost, totalGetPoint);
		if (totalCost < 10000) {
			order.setDeliveryCost(2500);
		} else {
			order.setDeliveryCost(0);
		}
		mo.addAttribute("abook", abookCheck);
		mo.addAttribute("order", order);
		mo.addAttribute("orderItem", orderItem);
		return "payment/singleOrderDetail";

	}

	// 주소록 db정보 문자열로 변환 작업
	public List<String[]> abookCheck(AddressBook abook) {
		List<String[]> list = new ArrayList<String[]>();
		List<String> strList = new ArrayList<String>();
		strList.add(abook.getLatelyAddress());
		strList.add(abook.getAddress1());
		strList.add(abook.getAddress2());
		strList.add(abook.getAddress3());
		strList.add(abook.getAddress4());
		strList.add(abook.getAddress5());
		String[] str = new String[5];
		String[] temp = null;
		temp = abook.getMainAddress().split("_");
		str[0] = temp[0];
		str[4] = temp[2];
		temp = temp[1].split("/");
		str[1] = temp[0];
		str[2] = temp[1];
		str[3] = temp[2];
		list.add(str);
		for (String s : strList) {
			if (s != null) {
				str = new String[5];
				temp = s.split("_");
				str[0] = temp[0];
				str[4] = temp[2];
				temp = temp[1].split("/");
				str[1] = temp[0];
				str[2] = temp[1];
				str[3] = temp[2];
				list.add(str);
			} else {
				list.add(null);
			}
		}
		return list;

	}
}
