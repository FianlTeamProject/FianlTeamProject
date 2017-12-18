package edu.spring.ex02.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.ex02.domain.taejun.Member;
import edu.spring.ex02.service.taejun.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private MemberService service;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}//end home
	
	@RequestMapping(value="/", method=RequestMethod.POST)
	private String memberLogin(Member m, HttpSession session) {
//		logger.info(m.getMid());
		Member result = service.login(m);
		String html = "";
		if (result!=null) { //로그인 성공
			session.setAttribute("loginResult", result);
			html = "home";
		}else { //로그인 실패
			html = "home";
		}
		return html;
	}//end Login
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	private String memberLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}//end Logout
	
	@RequestMapping(value="/info", method=RequestMethod.GET)
	private void memberInfo(HttpSession session) {
		Member m = (Member) session.getAttribute("loginResult");
	}//end Info
	
	
}//end controller
