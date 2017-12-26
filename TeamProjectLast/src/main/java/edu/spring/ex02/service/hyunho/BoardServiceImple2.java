package edu.spring.ex02.service.hyunho;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.ex02.domain.hyunho.Board2;
import edu.spring.ex02.pageutil.hyunho.PaginationCriteria2;
import edu.spring.ex02.persistence.hyunho.BoardDao2;


@Service
public class BoardServiceImple2 implements BoardService2{

	@Autowired
	private BoardDao2 dao;
	
	@Override
	public List<Board2> select() {
		return dao.read();
	}

	@Override
	public Board2 select(int bno) {
		return dao.read(bno);
	}

	@Override
	public List<Board2> select(String userid) {
		return dao.read(userid);
	}

	@Override
	public int insert(Board2 b) {
		return dao.create(b);
	}

	@Override
	public int update(Board2 b) {
		return dao.update(b);
	}

	@Override
	public int delete(int bno) {
		return dao.delete(bno);
	}


	@Override
	public int getTotalCount() {
		return dao.getTotalCount();
	}

	@Override
	public List<Board2> select(PaginationCriteria2 c) {
		return dao.read(c);
	}

	@Override
	public List<Board2> search(PaginationCriteria2 c,int type, String keyword) {
		return dao.search(c, type, keyword);
	}

	
	@Override
	public int totalSearchCount(int searchType, String searchKeyword) {
		return dao.searchCount(searchType, searchKeyword);
	}
	
}// end class BoardServiceImple
