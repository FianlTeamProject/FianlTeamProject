package edu.spring.ex02.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/qa")
public class TaeJunController {
	private static final Logger logger = LoggerFactory.getLogger(TaeJunController.class);
	
	@RequestMapping
	public String qaBoardList () {
		
		return "TaeJun/main";
	}
}
