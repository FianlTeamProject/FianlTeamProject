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
		list.add(new lecturelista(1,"오리엔테이션","개똥이","MD3YGrofnDY"));
		list.add(new lecturelista(2,"JAVA프로그래밍이란 1","개똥이","yaqnVTBz1As"));
		list.add(new lecturelista(3,"JAVA프로그래밍이란 2,변수","개똥이","nnGePPehqpY"));
		list.add(new lecturelista(4,"JAVA프로그래밍 3강","개똥이","fFRpV2Z0xow"));
		list.add(new lecturelista(5,"JAVA프로그래밍 4강","개똥이","da-GCx8VASU"));
		list.add(new lecturelista(6,"JAVA프로그래밍 5강","개똥이","TRNws4-IUXQ"));
		list.add(new lecturelista(7,"JAVA프로그래밍 6강","개똥이","2e9ejfeberQ"));
		list.add(new lecturelista(8,"JAVA프로그래밍 7강","개똥이","YH8_RGoyu2w"));
		list.add(new lecturelista(9,"JAVA프로그래밍 8강","개똥이","yKuc1c6jZEc"));
		list.add(new lecturelista(10,"JAVA프로그래밍 9강","개똥이","dESusx125wM"));
		list.add(new lecturelista(11,"JAVA프로그래밍 10강","개똥이","FnNuazXhdAU"));
		list.add(new lecturelista(12,"JAVA프로그래밍 11강","개똥이","P3OX4s48UqA"));
		logger.info(list.get(3).getAddress() + "<<<<<<<<<");
		
		model.addAttribute("list", list);
		return "songgyu/lecturelist";
	}
	
	
}
