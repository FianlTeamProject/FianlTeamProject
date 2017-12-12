package edu.spring.ex02.controller.taejun;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import edu.spring.ex02.domain.taejun.Answer;
import edu.spring.ex02.domain.taejun.Board;
import edu.spring.ex02.domain.taejun.Member;
import edu.spring.ex02.pageutil.taejun.PageNumberMaker;
import edu.spring.ex02.pageutil.taejun.PaginationCriteria;
import edu.spring.ex02.service.taejun.BoardService;

@Controller
@RequestMapping(value="/TaeJun/board") // 상위 폴더의 주소값 (현재설정기준 : /ex02/WEB-INF/views'/board') 에 해당
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private static final String UPLOAD_PATH2 = "C:\\Users\\Administrator\\git\\teamProject\\TeamProjectLast\\src\\main\\webapp\\resources\\uploadFile";
	private static final String UPLOAD_PATH = "C:\\STUDY\\lab-spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\TeamProjectLast\\resources\\uploadFile";
	
	@Autowired
	private BoardService service;
	// 3:41
	public String fail = "fail";
	
	private String saveFile(MultipartFile file) {
		// 파일 이름 변경		
		String sysdate = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		UUID uuid = UUID.randomUUID();
		String saveName =sysdate + "_" + file.getOriginalFilename();
//		logger.info("saveName: {}", saveName);
		
		// 저장할 File 객체를 생성
		File saveFile = new File(UPLOAD_PATH, saveName);
		File saveFile2 = new File(UPLOAD_PATH2, saveName);
		
		// 생성된 파일 객체를 저장
		try {
//			file.transferTo(saveFile);
			FileCopyUtils.copy(file.getBytes(), saveFile);
			FileCopyUtils.copy(file.getBytes(), saveFile2);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return saveName;
	} // end saveFile()
	
	
	
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String BoardList(Model model, Integer page, Integer perPage) {
//		logger.info("page : "+page+", perPage : "+perPage);
		PaginationCriteria c;
		if (page!=null&&perPage!=null) {
			c = new PaginationCriteria(page, perPage);
		}else {
			page=1;
			c = new PaginationCriteria(page,10);
		}
		List<Board> list = service.select(c);
		
		PageNumberMaker maker = new PageNumberMaker();
		maker.setCriteria(c);
		maker.setTotalCount(service.getTotalCount());
		maker.setPageMakerData();
		model.addAttribute("page",page);
		model.addAttribute("boardList",list);
		model.addAttribute("pageMaker",maker);
		return "TaeJun/board/list";
	}//end boardList()
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String BoardWrite(HttpSession session, Model model) {
		String html = "";
		Member m;
		try {
			m = (Member) session.getAttribute("loginResult");			
			if (m!=null) {
				model.addAttribute("member",m);
				html = "TaeJun/board/write";
			} else {
				html="redirect:/TaeJun/member/login"+"?fail=fail";
			}
		} catch (NullPointerException e) {
			html="redirect:/TaeJun/member/login"+"?fail=fail";
		}
		return html;
	}//end BoardWrite.GET
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String BoardWrite(Board b, MultipartFile[] uploadFiles,Model model) {
		String result = "";
		for (MultipartFile f : uploadFiles) {
			result += saveFile(f);
		}
		model.addAttribute("result", result);
		b.setBfile(result);
		service.insert(b);
		return "redirect:/TaeJun/board/list";
	}//end BoardWrite.POST
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public void BoardDetail(int bno, Model model,String fail) {
		Board b = service.select(bno);
		String c = b.getContent();
		c = c.replace("\r\n","<br>");
		b.setContent(c);
		model.addAttribute("board",b);
		model.addAttribute("fail",fail);
	}//end BoardDetail.GET
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String BoardUpdate (int bno, HttpSession session, Model model) {
		String html = "";
		Member m;
		Board b = service.select(bno);
		try {
			m = (Member) session.getAttribute("loginResult");			
			if (m!=null) {
				if (m.getMid().equals(b.getUserid())) {
					model.addAttribute("board",b);
					html = "TaeJun/board/update";
				}else {
					model.addAttribute("board",b);
					html="redirect:/TaeJun/board/detail?bno="+bno+"&fail=fail";
				}
			} else {
				model.addAttribute("board",b);
				html="redirect:/TaeJun/member/login"+"?fail=fail";
			}
			
		} catch (NullPointerException e) {
			model.addAttribute("board",b);
			html="redirect:/TaeJun/member/login"+"?fail=fail";
		}
		
		return html;
	}//end BoardUpdate.GET
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String BoardUpdate (Board b) {
		service.update(b);
		return "redirect:/TaeJun/board/list";
	}//end BoardUpdate.POST
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String BoardDelete (int bno, HttpSession session, Model model) {
		String html = "";
		Member m;
		Board b = service.select(bno);
		try {
			m = (Member) session.getAttribute("loginResult");			
			if (m!=null) {
				if (m.getMid().equals(b.getUserid())) {
					int result = service.delete(bno);
					logger.info("DELETE RESULT : "+result);
					html = "redirect:/TaeJun/board/list";
				}else {
					model.addAttribute("board",b);
					html="redirect:/TaeJun/board/detail?bno="+bno+"&fail=fail";
				}
			} else {
				model.addAttribute("board",b);
				html="redirect:/TaeJun/member/login"+"?fail=fail";
			}
			
		} catch (NullPointerException e) {
			model.addAttribute("board",b);
			html="redirect:/TaeJun/member/login"+"?fail=fail";
		}
		
		return html;
	}//end BoardDelete.GET
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public void BoardSearch (int searchType, String searchWord, Model model, Integer page, Integer perPage) {
//		logger.info("KEY : "+searchType+" | WORD : "+searchWord);		
		if (searchType==1) {
			PaginationCriteria c;
			if (page!=null&&perPage!=null) {
				c = new PaginationCriteria(page, perPage, searchWord);
			}else {
				page=1;
				c = new PaginationCriteria(page,10,searchWord);
			}
			List<Board> list = service.select_id(c);
			
			PageNumberMaker maker = new PageNumberMaker();
			maker.setCriteria(c);
			maker.setTotalCount(service.getSearchCountId(searchWord));
			maker.setPageMakerData();
			model.addAttribute("page",page);
			model.addAttribute("boardList",list);
			model.addAttribute("pageMaker",maker);
			model.addAttribute("searchWord",searchWord);
			model.addAttribute("searchType",searchType);
			
			
			
		}else if(searchType==2) {
			PaginationCriteria c;
			if (page!=null&&perPage!=null) {
				c = new PaginationCriteria(page, perPage, searchWord);
			}else {
				page=1;
				c = new PaginationCriteria(page,10,searchWord);
			}
			List<Board> list = service.select_title(c);
			
			PageNumberMaker maker = new PageNumberMaker();
			maker.setCriteria(c);
			maker.setTotalCount(service.getSearchCountTitle(searchWord));
			maker.setPageMakerData();
			model.addAttribute("page",page);
			model.addAttribute("boardList",list);
			model.addAttribute("pageMaker",maker);
			model.addAttribute("searchWord",searchWord);
			model.addAttribute("searchType",searchType);
			
			
		}else if(searchType==3) {
			PaginationCriteria c;
			if (page!=null&&perPage!=null) {
				c = new PaginationCriteria(page, perPage, searchWord);
			}else {
				page=1;
				c = new PaginationCriteria(page,10,searchWord);
			}
			List<Board> list = service.select_title_content(c);
			
			PageNumberMaker maker = new PageNumberMaker();
			maker.setCriteria(c);
			maker.setTotalCount(service.getSearchCountTitleContent(searchWord));
			maker.setPageMakerData();
			model.addAttribute("page",page);
			model.addAttribute("boardList",list);
			model.addAttribute("pageMaker",maker);
			model.addAttribute("searchWord",searchWord);
			model.addAttribute("searchType",searchType);
		}
	}//end BoardSearch
	
	
	
	@RequestMapping(value="/answer", method=RequestMethod.GET)
	public String answerPage(Board b, Model model, HttpSession session) {
		String html = "TaeJun/board/answer";
		Member m;
		try {
			m = (Member) session.getAttribute("loginResult");			
			if (m!=null) {
				String c = b.getContent();
				c = c.replace("\r\n","<br>");
				b.setContent(c);
				model.addAttribute("board", b);
				model.addAttribute("member", m);
				html = "TaeJun/board/answer";
			} else {
				html="redirect:/TaeJun/member/login"+"?fail=fail";
			}
		} catch (NullPointerException e) {
			html="redirect:/TaeJun/member/login"+"?fail=fail";
		}
		return html;
	}
	
	@RequestMapping(value="/answer-result", method=RequestMethod.GET)
	public String answerPageResult(Answer answer, Model model) {
		int bno = answer.getBno();
		String html = "redirect:/TaeJun/board/detail?bno="+bno;
		return html;
	}
	
}//end BoardController
