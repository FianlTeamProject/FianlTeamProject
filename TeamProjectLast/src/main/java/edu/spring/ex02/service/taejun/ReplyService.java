package edu.spring.ex02.service.taejun;

import java.util.List;

import edu.spring.ex02.domain.taejun.Board;
import edu.spring.ex02.domain.taejun.Reply;

public interface ReplyService {
	
	List<Reply> select();
	List<Reply> select(int bno);
	Reply reSelect(int rno);
	int insert(Reply r);
	int update(Reply r);
	int delete(int rno);
	int update(Board b);
}


