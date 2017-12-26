package edu.spring.ex02.persistence.hyunho;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.ex02.domain.hyunho.Reply2;
import edu.spring.ex02.mappers.hyunho.ReplyMapper2;

@Repository
public class ReplyDaoImple2 implements ReplyDao2 {
	private static final String NAMESPACE = "edu.spring.ex02.mappers.ReplyMapper";

	@Autowired private SqlSession session;
	@Autowired private ReplyMapper2 mapper;
	
	@Override
	public List<Reply2> read() {
		return session.selectList(NAMESPACE+".selectAll");
	}

	@Override
	public List<Reply2> read(int bno) {
		return mapper.read(bno);
	}
	
	@Override
	public int create(Reply2 r) {
		return mapper.insert(r);
	}

	@Override
	public int update(Reply2 r) {
		return mapper.update(r);
	}

	@Override
	public int delete(int rno) {
		return mapper.delete(rno);
	}



}
