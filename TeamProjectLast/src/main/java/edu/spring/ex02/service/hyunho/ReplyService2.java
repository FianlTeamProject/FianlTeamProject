package edu.spring.ex02.service.hyunho;

import java.util.List;

import edu.spring.ex02.domain.hyunho.Reply2;

public interface ReplyService2 {
	
	List<Reply2> select();
	List<Reply2> select(int bno);
	int insert(Reply2 r);
	int update(Reply2 r);
	int delete(int rno);
}
