package edu.spring.ex02.controller.songgyu;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.spring.ex02.controller.taejun.BoardController;

@Controller
public class LectureController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@RequestMapping(value="/songgyu/lecture")
	public String lecture(int bno, String address , Model model) {
		System.out.println(bno);
		System.out.println(address);
		model.addAttribute("address", address);
		
		return "songgyu/lecture";
	}
	
	@RequestMapping(value="/lecturelist")
	public String lecturelist(Model model) {
		ArrayList<lecturelista> list = new ArrayList<>();
		list.add(new lecturelista(1,"?ค๋ฆฌ์??ด?","๊ฐ๋ฅ?ด","MD3YGrofnDY"));
		list.add(new lecturelista(2,"JAVA?๋ก๊ทธ?๋ฐ์ด?? 1","๊ฐ๋ฅ?ด","yaqnVTBz1As"));
		list.add(new lecturelista(3,"JAVA?๋ก๊ทธ?๋ฐ์ด?? 2,๋ณ??","๊ฐ๋ฅ?ด","nnGePPehqpY"));
		list.add(new lecturelista(4,"JAVA?๋ก๊ทธ?๋ฐ? 3๊ฐ?","๊ฐ๋ฅ?ด","fFRpV2Z0xow"));
		list.add(new lecturelista(5,"JAVA?๋ก๊ทธ?๋ฐ? 4๊ฐ?","๊ฐ๋ฅ?ด","da-GCx8VASU"));
		list.add(new lecturelista(6,"JAVA?๋ก๊ทธ?๋ฐ? 5๊ฐ?","๊ฐ๋ฅ?ด","TRNws4-IUXQ"));
		list.add(new lecturelista(7,"JAVA?๋ก๊ทธ?๋ฐ? 6๊ฐ?","๊ฐ๋ฅ?ด","2e9ejfeberQ"));
		list.add(new lecturelista(8,"JAVA?๋ก๊ทธ?๋ฐ? 7๊ฐ?","๊ฐ๋ฅ?ด","YH8_RGoyu2w"));
		list.add(new lecturelista(9,"JAVA?๋ก๊ทธ?๋ฐ? 8๊ฐ?","๊ฐ๋ฅ?ด","yKuc1c6jZEc"));
		list.add(new lecturelista(10,"JAVA?๋ก๊ทธ?๋ฐ? 9๊ฐ?","๊ฐ๋ฅ?ด","dESusx125wM"));
		list.add(new lecturelista(11,"JAVA?๋ก๊ทธ?๋ฐ? 10๊ฐ?","๊ฐ๋ฅ?ด","FnNuazXhdAU"));
		list.add(new lecturelista(12,"JAVA?๋ก๊ทธ?๋ฐ? 11๊ฐ?","๊ฐ๋ฅ?ด","P3OX4s48UqA"));
		logger.info(list.get(3).getAddress() + "<<<<<<<<<");
		
		model.addAttribute("list", list);
		return "songgyu/lecturelist";
	}
	
	
}
