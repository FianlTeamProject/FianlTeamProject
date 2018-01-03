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
		list.add(new lecturelista(1,"?˜¤ë¦¬ì—”?…Œ?´?…˜","ê°œë˜¥?´","MD3YGrofnDY"));
		list.add(new lecturelista(2,"JAVA?”„ë¡œê·¸?˜ë°ì´?? 1","ê°œë˜¥?´","yaqnVTBz1As"));
		list.add(new lecturelista(3,"JAVA?”„ë¡œê·¸?˜ë°ì´?? 2,ë³??ˆ˜","ê°œë˜¥?´","nnGePPehqpY"));
		list.add(new lecturelista(4,"JAVA?”„ë¡œê·¸?˜ë°? 3ê°?","ê°œë˜¥?´","fFRpV2Z0xow"));
		list.add(new lecturelista(5,"JAVA?”„ë¡œê·¸?˜ë°? 4ê°?","ê°œë˜¥?´","da-GCx8VASU"));
		list.add(new lecturelista(6,"JAVA?”„ë¡œê·¸?˜ë°? 5ê°?","ê°œë˜¥?´","TRNws4-IUXQ"));
		list.add(new lecturelista(7,"JAVA?”„ë¡œê·¸?˜ë°? 6ê°?","ê°œë˜¥?´","2e9ejfeberQ"));
		list.add(new lecturelista(8,"JAVA?”„ë¡œê·¸?˜ë°? 7ê°?","ê°œë˜¥?´","YH8_RGoyu2w"));
		list.add(new lecturelista(9,"JAVA?”„ë¡œê·¸?˜ë°? 8ê°?","ê°œë˜¥?´","yKuc1c6jZEc"));
		list.add(new lecturelista(10,"JAVA?”„ë¡œê·¸?˜ë°? 9ê°?","ê°œë˜¥?´","dESusx125wM"));
		list.add(new lecturelista(11,"JAVA?”„ë¡œê·¸?˜ë°? 10ê°?","ê°œë˜¥?´","FnNuazXhdAU"));
		list.add(new lecturelista(12,"JAVA?”„ë¡œê·¸?˜ë°? 11ê°?","ê°œë˜¥?´","P3OX4s48UqA"));
		logger.info(list.get(3).getAddress() + "<<<<<<<<<");
		
		model.addAttribute("list", list);
		return "songgyu/lecturelist";
	}
	
	
}
