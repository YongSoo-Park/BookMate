package com.kh.bookmate.ubook_payment.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bookmate.shoppingbasket.model.vo.ShoppingBasket;
import com.kh.bookmate.ubook_cart.model.vo.UbookCart;
import com.kh.bookmate.ubook_payment.model.service.UbookPaymentService;
import com.kh.bookmate.ubook_payment.model.vo.UbookPayment;
import com.kh.bookmate.ubook_payment.model.vo.UbookPaymentDetail;

@Controller
public class UbookPaymentController {

	@Autowired
	UbookPaymentService ubookPaymentService;
	
	@RequestMapping("insertUbookPayment")
	public String insertUbookPayment(UbookPaymentDetail ubookPaymentDetailList, UbookPayment ubookPayment, UbookCart cartList) {

		List<UbookCart> deleteCartList = cartList.getCartList();
		
		System.out.println("cartList : "+ cartList);
		System.out.println("deleteCartList : "+ deleteCartList);
		UbookPayment temp = ubookPayment;
		List<UbookPaymentDetail> list = new ArrayList<UbookPaymentDetail>();
		temp.setShippingAddressUb(ubookPayment.getShippingPostCodeUb()+"/"+ubookPayment.getShippingAddressUb()+"/"+ubookPayment.getShippingAddressDetailUb());

		System.out.println("ubookPayment" + ubookPayment);
		System.out.println("temp" + temp);
		System.out.println("list" + list);
		System.out.println("ubookPaymentDetailList" + ubookPaymentDetailList);
		for(int i= 0 ; i < ubookPaymentDetailList.getUbookPaymentDetailList().size();i++ ) {
			ubookPaymentDetailList.getUbookPaymentDetailList().get(i).setDeliveryDateUb(ShipDate());
			list.add(ubookPaymentDetailList.getUbookPaymentDetailList().get(i));
			
		}
		
		ubookPaymentService.insertUbookPayment(temp,list,deleteCartList);
		
		
		return "ubook_payment/ubookOrderComplete";
		
		
		
	}

	
	 @RequestMapping("updateUbookStock.ub")
	 @ResponseBody
	 public int updateUbookStock(@RequestParam int ubookNoUb) {
		 System.out.println("컨트롤러 잘 나오나요 우리친구"+ubookNoUb);
		 
	  int result = ubookPaymentService.updateUbookStock(ubookNoUb);
	
	  return result;
	
	  }
	 
	
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
	
	
}
