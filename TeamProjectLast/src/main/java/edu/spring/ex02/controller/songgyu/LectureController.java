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
		list.add(new lecturelista(1,"?��리엔?��?��?��","개똥?��","MD3YGrofnDY"));
		list.add(new lecturelista(2,"JAVA?��로그?��밍이?? 1","개똥?��","yaqnVTBz1As"));
		list.add(new lecturelista(3,"JAVA?��로그?��밍이?? 2,�??��","개똥?��","nnGePPehqpY"));
		list.add(new lecturelista(4,"JAVA?��로그?���? 3�?","개똥?��","fFRpV2Z0xow"));
		list.add(new lecturelista(5,"JAVA?��로그?���? 4�?","개똥?��","da-GCx8VASU"));
		list.add(new lecturelista(6,"JAVA?��로그?���? 5�?","개똥?��","TRNws4-IUXQ"));
		list.add(new lecturelista(7,"JAVA?��로그?���? 6�?","개똥?��","2e9ejfeberQ"));
		list.add(new lecturelista(8,"JAVA?��로그?���? 7�?","개똥?��","YH8_RGoyu2w"));
		list.add(new lecturelista(9,"JAVA?��로그?���? 8�?","개똥?��","yKuc1c6jZEc"));
		list.add(new lecturelista(10,"JAVA?��로그?���? 9�?","개똥?��","dESusx125wM"));
		list.add(new lecturelista(11,"JAVA?��로그?���? 10�?","개똥?��","FnNuazXhdAU"));
		list.add(new lecturelista(12,"JAVA?��로그?���? 11�?","개똥?��","P3OX4s48UqA"));
		logger.info(list.get(3).getAddress() + "<<<<<<<<<");
		
		model.addAttribute("list", list);
		return "songgyu/lecturelist";
	}
	
	
}
