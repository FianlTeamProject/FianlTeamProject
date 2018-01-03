package edu.spring.ex02.controller.hyunho;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.spring.ex02.domain.hyunho.Board2;
import edu.spring.ex02.domain.taejun.Member;
import edu.spring.ex02.pageutil.hyunho.PageNumberMaker2;
import edu.spring.ex02.pageutil.hyunho.PaginationCriteria2;
import edu.spring.ex02.service.hyunho.BoardService2;

@Controller
@RequestMapping(value="/hyunho/board")
public class BoardController2 {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController2.class);
	
	@Autowired
	private BoardService2 boardService;
	
	@RequestMapping(value="/list" , method=RequestMethod.GET)
	public void boardList(Integer page , Integer perPage, Model model, HttpSession session) {
		logger.info("page: {}, perPage: {} " , page, perPage);
		PaginationCriteria2 c = null;
		Member m = (Member) session.getAttribute("loginResult");
//		logger.info("IDIDIDID@*(ERY(*WHDUIWHFDUIWQFH(*W*(FO"+m.getMid());
		
		if(page != null && perPage != null) {
			c = new PaginationCriteria2(page, perPage);
		}else {
			c = new PaginationCriteria2();
		}
		
		List<Board2> list = boardService.select(c);
		model.addAttribute("boardList2", list);
		
		PageNumberMaker2 maker = new PageNumberMaker2();
		maker.setCriteria(c);
		int count = boardService.getTotalCount();
		maker.setTotalCount(count);
		maker.setPageMakerData();
		
		//////////////////////////
		logger.info("total count: " + maker.getTotalCount());
		logger.info("start page: " + maker.getStartPage());
		logger.info("end page: " + maker.getEndPage());
		//////////////////////////
		
		model.addAttribute("page",page);
		model.addAttribute("pageMaker", maker);
	}
	
	
	@RequestMapping(value="/register" , method=RequestMethod.GET)
	public String registerBoard(Model model, HttpSession session) {
		
		String html = "";
		Member m;
		try {
			m = (Member) session.getAttribute("loginResult");			
			if (m!=null) {
				model.addAttribute("member",m);
				html = "hyunho/board/register";
			} else {
				html="redirect:/TaeJun/member/login"+"?fail=fail";
			}
		} catch (NullPointerException e) {
			html="redirect:/TaeJun/member/login"+"?fail=fail";
		}
		return html;
	}
	
	@RequestMapping(value="/register" , method=RequestMethod.POST)
	public String registerBoard(Board2 b) {
		boardService.insert(b);
		return "redirect:/hyunho/board/list";
	}
	
	@RequestMapping(value="/detail" , method=RequestMethod.GET)
	public void detail(int bno, Model model) {
		Board2 b = boardService.select(bno);
		model.addAttribute("board", b);
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public void update(int bno, Model model) {
		Board2 b = boardService.select(bno);
		model.addAttribute("board", b);
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(Board2 b) {
		boardService.update(b);
		
		return "redirect:/hyunho/board/detail?bno="+ b.getBno();
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(int bno) {
		boardService.delete(bno);
		return "redirect:/hyunho/board/list";
	}
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public void search(Integer page , Integer perPage, int searchType, String searchKeyword, Model model) {
		
		PaginationCriteria2 c = null;
		if(page != null && perPage != null) {
			c = new PaginationCriteria2(page, perPage);
		}else {
			c = new PaginationCriteria2();
		}
		
		List<Board2> list = boardService.search(c, searchType, searchKeyword);
		model.addAttribute("boardList2", list);
		 
		PageNumberMaker2 maker = new PageNumberMaker2();
		maker.setCriteria(c);
		int count = boardService.totalSearchCount(searchType, searchKeyword);
		maker.setTotalCount(count);
		maker.setPageMakerData();
		
		model.addAttribute("pageMaker", maker);
	}
	
	
}// end class BoardController
