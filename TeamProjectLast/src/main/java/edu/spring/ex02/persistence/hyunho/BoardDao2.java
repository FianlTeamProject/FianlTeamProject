package edu.spring.ex02.persistence.hyunho;

import java.util.List;

import edu.spring.ex02.domain.hyunho.Board2;
import edu.spring.ex02.pageutil.hyunho.PaginationCriteria2;

// CRUD(Create, Read , Update , Delete)
public interface BoardDao2 {
	
	// 전체 검색 기능
	List<Board2> read();
	
	// 글번호 검색
	Board2 read(int bno);
	
	// 작성자아이디 검색
	List<Board2> read(String userid);
	
	// 새 글 작성 기능
	int create(Board2 b);
	
	// 작성된 글 수정(수정 컬럼: title & content & regdate , 데이터: bno)
	int update(Board2 b);
	
	// 글 삭제
	int delete(int bno);
	
	// 전체 게시글 갯수를 리턴하는 메소드
	int getTotalCount();
	
	// 한 페이지에 보여줄 게시글 리스트만 리턴하는 메소드
	List<Board2> read(PaginationCriteria2 c);
	
	// 검색
	int searchCount(int searchType, String searchKeyword);

	List<Board2> search(PaginationCriteria2 c, int type, String keyword);	
	
}











