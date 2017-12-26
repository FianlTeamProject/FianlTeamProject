package edu.spring.ex02.persistence.hyunho;

import java.util.List;
import java.util.Map;

import edu.spring.ex02.domain.hyunho.Member2;

public interface MemberDao2 {
	
	// 회원 전체 조회
	List<Member2> read();
	
	// 회원 정보
	Member2 read(String userid);

	// 회원 가입
	int insert(Member2 m);
	
	// 회원 수정
	int update(Member2 m);
	
	// 회원 삭제
	int delete(String userid);
	
	// 회원 검색
	List<Member2> search(Map<String, Object> map);
	 
}
