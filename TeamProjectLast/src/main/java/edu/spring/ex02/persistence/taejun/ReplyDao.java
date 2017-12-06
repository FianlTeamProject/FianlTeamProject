package edu.spring.ex02.persistence.taejun;

import java.util.List;

import edu.spring.ex02.domain.taejun.Board;
import edu.spring.ex02.domain.taejun.Reply;

public interface ReplyDao {
	
	List<Reply> read();
	List<Reply> read(int bno);
	int create(Reply r);
	int update(Reply r);
	int delete(int rno);
	Reply reRead(int rno);
	int update(Board b);
} // end interface ReplyDao




