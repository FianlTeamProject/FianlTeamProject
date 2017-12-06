package edu.spring.ex02.controller.taejun;

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
	}//end qaBoardList 않이 왜 않대냣굿욧 십밥바야!!!312321
}
