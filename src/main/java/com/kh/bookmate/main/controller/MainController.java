package com.kh.bookmate.main.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.bookmate.book.model.service.BookService;
import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.main.model.service.MainService;
import com.kh.bookmate.main.model.vo.RecentView;
import com.kh.bookmate.notice.model.service.NoticeService;
import com.kh.bookmate.notice.model.vo.Notice;
import com.kh.bookmate.user.model.vo.User;

@Controller
public class MainController {

	@Autowired
	private MainService mainService;
	
	@Autowired
	private BookService bookService;
	
	
	@RequestMapping("/")
	public String selectMainBest(HttpServletRequest request, Model model) {
		
		//1.이벤트
		
		//2.오늘의 책 
		System.out.println("오늘의책 테스트 시작");
		int category_kor = 0;
		int category_ebook = 2;
		List<Book> todayList_K = mainService.selectTodayList(category_kor);
		List<Book> todayList_E = mainService.selectTodayList(category_ebook);
		
		model.addAttribute("todayList_K", todayList_K);
		model.addAttribute("todayList_E", todayList_E);
		
		int count=1;
		for(Book b : todayList_K) {
			System.out.println(count +" 오늘의책 테스트 : " + b.toString());
		}
		
		//3.베스트 도서
		List<Book> bestBkList = mainService.selectBestList();
		model.addAttribute("bestBkList", bestBkList);
		
		//4.화제의 신간
		ArrayList<Book> hotBook = bookService.selectHotTopicBook();
	    model.addAttribute("hotBook", hotBook);

		//5.최근본상품 - 조회 
	    if((User)request.getSession().getAttribute("loginUser") != null ){
	    	String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();

	    	RecentView rv = mainService.selectRecentView(userId);
	    	String[] tempArr = null;
	    	ArrayList<String> isbnList = null;
	    	List<Book> viewList = new ArrayList<Book>();
	    	
	    	if(rv != null) {
	    		tempArr = rv.getBooks().split(",");
	    		isbnList = new ArrayList<String>(Arrays.asList(tempArr)); //화면에 리스트로 보내기

		    	System.out.println("최근본상품 조회 : " + isbnList.toString());
		    	viewList = mainService.selectRecentViewList(isbnList);
	    	
		    	System.out.println("최근본상품 조회-book객체 : " + viewList.toString());
	    	}
	    	
	    	model.addAttribute("isbnList", isbnList);  //db에는 잘 저장되는데 book리스트로 조회하면 순서가 다 엉망이된다.
			model.addAttribute("viewList", viewList);
	    }
	    
	    //6.이벤트
	    List<Notice> eventImg = null; 
	    eventImg = mainService.selectEventImg();
	    System.out.println("이미지 이름 가져오니..."+eventImg);
		model.addAttribute("eventImg", eventImg);
		
	    
	    
		return "index";
	}
}
