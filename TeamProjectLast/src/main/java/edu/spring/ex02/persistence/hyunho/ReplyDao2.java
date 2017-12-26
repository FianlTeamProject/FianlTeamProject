package edu.spring.ex02.persistence.hyunho;

import java.util.List;

import edu.spring.ex02.domain.hyunho.Reply2;

public interface ReplyDao2 {
	
	List<Reply2> read();
	List<Reply2> read(int bno);
	int create(Reply2 r);
	int update(Reply2 r);
	int delete(int rno);
}
