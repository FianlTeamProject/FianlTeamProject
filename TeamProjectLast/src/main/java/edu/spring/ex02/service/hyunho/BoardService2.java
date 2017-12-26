package edu.spring.ex02.service.hyunho;

import java.util.List;

import edu.spring.ex02.domain.hyunho.Board2;
import edu.spring.ex02.pageutil.hyunho.PaginationCriteria2;

public interface BoardService2 {
	
	List<Board2> select(); // 전체 검색
	Board2 select(int bno); // 글번호 검색
	List<Board2> select(String userid); // 작성자 아이디 검색
	int insert(Board2 b); // 새 글 작성
	int update(Board2 b); // 글 수정
	int delete(int bno); // 글 삭제
	
	
	int getTotalCount();
	List<Board2> select(PaginationCriteria2 c);
	
	List<Board2> search(PaginationCriteria2 c, int type, String keyword); // 검색 기능
	int totalSearchCount(int searchType, String searchKeyword);
	
}// end interface BoardService
