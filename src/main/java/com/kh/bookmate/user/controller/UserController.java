package com.kh.bookmate.user.controller;

import java.util.ArrayList;

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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.bookmate.book.model.service.BookService;
import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.ubook.model.vo.Ubook;
import com.kh.bookmate.user.model.service.UserService;
import com.kh.bookmate.user.model.vo.User;

@SessionAttributes("loginUser") 
@Controller
public class UserController {
	@Autowired 
	private UserService userService;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	@Autowired
	private BookService bookService;
	
//	@RequestMapping(value="/")
//	public String home() {
//		return "index";
//	}
//	@RequestMapping(value="home.us")
//	public String logo(Model model) {
//
//		ArrayList<Book> hotBook = bookService.selectHotTopicBook();
//		model.addAttribute("hotBook", hotBook);
//		return "index";
//	}
	
	@RequestMapping(value="login.me")
	public String login() {
		return "user/login";
	}
	
	@RequestMapping(value="register.me")
	public String register() {
		return "user/register";
	}
	@RequestMapping(value="findId.us")
	public String findId() {
		return "user/findId";
	}
	@RequestMapping(value="findPwd.us")
	public String findPwd() {
		return "user/findPwd";
	}
	@RequestMapping(value="updatePwd.us")
	public String updatePwd() {
		return "user/updatePwd";
	}
	@RequestMapping(value="cal.us")
	public String calMain() {
		return "calMain";
	}
	@RequestMapping(value="insert.us")
	public String insertMember(@ModelAttribute User u, @RequestParam("post") String post,
														 @RequestParam("address1") String address1,
														 @RequestParam("address2") String address2,
														 			HttpSession session	){
		u.setAddress(post+"/"+address1+"/"+address2); 
		
		String encPwd = bCryptPasswordEncoder.encode(u.getUserPwd());

		u.setUserPwd(encPwd);
		userService.insertUser(u);
		
		session.setAttribute("msg", "회원가입성공");
		return "redirect:/";
	
		
	}
	
	@RequestMapping(value="login.us") 
	@ResponseBody
	public String loginMember(User u, Model model,RedirectAttributes ra) {
		String checkPwd  = userService.selectCheckPwd(u.getUserId());
		User loginUser = null;
		if(bCryptPasswordEncoder.matches(u.getUserPwd(), checkPwd)) {
			
			loginUser = userService.loginUser(u);
		}else {
			return "fail";
		}
	
		
		model.addAttribute("loginUser", loginUser);
		return "pass";


	}
	@RequestMapping(value="logout.us")
	public String logoutMember(SessionStatus status) {
		status.setComplete(); //현재 컨트롤러에 @SessionAttributes에 의해 저장된 오브젝트 제거
		return "redirect:/";
	}
	@RequestMapping(value="findId.me")
	public String findId(@ModelAttribute User u, Model model) {
		
	
	String findId = userService.findId(u);
	if (!findId.equals("")) {
		model.addAttribute("findId", findId);
		

		return "user/findIdAction";
	} else {
		model.addAttribute("msg", "실패!");
		return "redirect:/";

		}
	}
	
	@RequestMapping(value="findPwd.me")
	public String findPwd(@ModelAttribute User u, Model model) {
		
	
	String findPwd = userService.findPwd(u);

	
	if (!findPwd.equals("")) {
		model.addAttribute("findPwd", findPwd);
		
		return "user/findPwdAction";

	}else {
		model.addAttribute("msg", "실패!");
		return "redirect:/";

	}
	
	
	}
	
}
