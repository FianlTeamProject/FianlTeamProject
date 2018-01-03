package edu.spring.ex02.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.ex02.domain.hyunho.Board2;
import edu.spring.ex02.domain.taejun.Board;
import edu.spring.ex02.domain.taejun.Member;
import edu.spring.ex02.pageutil.hyunho.PageNumberMaker2;
import edu.spring.ex02.pageutil.hyunho.PaginationCriteria2;
import edu.spring.ex02.pageutil.taejun.PageNumberMaker;
import edu.spring.ex02.pageutil.taejun.PaginationCriteria;
import edu.spring.ex02.service.hyunho.BoardService2;
import edu.spring.ex02.service.taejun.BoardService;
import edu.spring.ex02.service.taejun.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private BoardService2 boardService2;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, Integer page, Integer perPage, Integer page2, Integer perPage2) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		PaginationCriteria c;
		PaginationCriteria2 c2;
		if (page!=null&&perPage!=null) {
			c = new PaginationCriteria(page, perPage);
		}else {
			page=1;
			c = new PaginationCriteria(page,10);
		}
		
		
		if (page2!=null&&perPage2!=null) {
			c2 = new PaginationCriteria2(page2, perPage2);
		}else {
			page2=1;
			c2 = new PaginationCriteria2(page2, 10);
		}
		
		
		List<Board> list = boardService.select(c);
		List<Board2> list2 = boardService2.select(c2);
		PageNumberMaker maker = new PageNumberMaker();
		PageNumberMaker2 maker2 = new PageNumberMaker2();
		maker.setCriteria(c);
		maker.setTotalCount(boardService.getTotalCount());
		maker.setPageMakerData();
		
		maker2.setCriteria(c2);
		maker2.setTotalCount(boardService2.getTotalCount());
		maker2.setPageMakerData();
		
		model.addAttribute("page",page);
		model.addAttribute("boardList",list);
		model.addAttribute("pageMaker",maker);
		 
		model.addAttribute("page2",page2);
		model.addAttribute("boardList2",list2);
		model.addAttribute("pageMaker2",maker2);
		//1번게시판
		
		
		
		
		
		
		
		
		return "home";
	}//end home
	
	@RequestMapping(value="/", method=RequestMethod.POST)
	private String memberLogin(Member m, HttpSession session) {
//		logger.info(m.getMid());
		Member result = memberService.login(m);
		String html = "";
		if (result!=null) { //로그인 성공
			session.setAttribute("loginResult", result);
			html = "redirect:/";
		}else { //로그인 실패
			html = "redirect:/";
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
