package edu.spring.ex02.controller.hyunho;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.spring.ex02.domain.hyunho.Member2;
import edu.spring.ex02.service.hyunho.MemberService2;

@Controller
@RequestMapping(value="/hyunho/member")
public class MemberController2 {
	
	@Autowired
	private MemberService2 service;
	private static final Logger logger = LoggerFactory.getLogger(MemberController2.class);
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void MemberList(Model model) {
		List<Member2> list = service.read();
		model.addAttribute("MemberList" , list);
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void insertMember() {}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String insertMember(Member2 m) {
		service.insert(m);
		return "redirect:/hyunho/member/list";
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public void detailMember(String userid, Model model) {
		Member2 m = service.read(userid);
		model.addAttribute("Member" , m);
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public void updateMember(String userid, Model model) {
		Member2 m = service.read(userid);
		model.addAttribute("Member" , m);
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String updateMember(Member2 m) throws UnsupportedEncodingException {
		service.update(m);
		return "redirect:/hyunho/member/detail?userid="+URLEncoder.encode(m.getUserid(), "UTF-8");
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String deleteMember(String userid) {
		service.delete(userid);
		return "redirect:/hyunho/member/list";
	}
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public void searchMember(int type, String keyword, Model model) {
		List<Member2> list = service.search(type, keyword);
		model.addAttribute("MemberList" , list);
	}
	
	
	@RequestMapping(value="loginCheck", method=RequestMethod.POST)
	@ResponseBody
	public String loginCheck(String userid, HttpServletResponse response) throws IOException {
		logger.info("------------ userid : " + userid);
		Member2 m = service.read(userid);
		logger.info("------------ m : " + m);
		String bol = "false";
		if(m == null) {
			bol = "true";
		}
		return bol;
		
	}
	
	
	
	
	
	
}
