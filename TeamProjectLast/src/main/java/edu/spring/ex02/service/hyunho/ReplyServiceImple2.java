package edu.spring.ex02.service.hyunho;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.ex02.domain.hyunho.Reply2;
import edu.spring.ex02.persistence.hyunho.ReplyDao2;

@Service
public class ReplyServiceImple2 implements ReplyService2 {

	@Autowired
	private ReplyDao2 replyDao;
	
	@Override
	public List<Reply2> select() {
		return replyDao.read();
	}

	@Override
	public int insert(Reply2 r) {
		// TODO: 댓글 입력이 성공하면 게시글 테이블의 댓글 갯수를 업데이트
		return replyDao.create(r);
	}

	@Override
	public int update(Reply2 r) {
		return replyDao.update(r);
	}

	@Override
	public int delete(int rno) {
		// TODO: 댓글 삭제 후 Board 테이블의 댓글 갯수도 수정
		return replyDao.delete(rno);
	}

	@Override
	public List<Reply2> select(int bno) {
		return replyDao.read(bno);
	}

}// end class ReplyServiceImple
