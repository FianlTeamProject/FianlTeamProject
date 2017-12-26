package edu.spring.ex02.persistence.hyunho;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.ex02.domain.hyunho.Board2;
import edu.spring.ex02.pageutil.hyunho.PaginationCriteria2;

// @Repository : 스프링 프레임워크에게 DB를 사용하는 영속성(Persistance) 계층의 콤포넌트임을 등록하는 어노테이션
// root-context.xml 파일에서 bean으로 등록을 해야 함(context:compnent-scan)
@Repository
public class BoardDaoImple2 implements BoardDao2 {
	
	@Autowired // 의존성 주입
	private SqlSession session;
	private static final String NAMESPACE = "hyunhomapper";
	
	
	@Override
	public List<Board2> read() {
		return session.selectList(NAMESPACE + ".selectAll");
	}

	@Override
	public Board2 read(int bno) {
		return session.selectOne(NAMESPACE + ".selectByBno", bno);
	}

	@Override
	public List<Board2> read(String userid) {		
		String arg = "%" + userid + "%";
		return session.selectList(NAMESPACE + ".selectByUserid", arg);
	}

	@Override
	public int create(Board2 b) {
		return session.insert(NAMESPACE+".insert" , b);
	}

	@Override
	public int update(Board2 b) {
		return session.update(NAMESPACE+".update", b);
	}

	@Override
	public int delete(int bno) {
		return session.delete(NAMESPACE+".delete", bno);
	}


	@Override
	public int getTotalCount() {
		return session.selectOne(NAMESPACE+".totalCount");
	}

	@Override
	public List<Board2> read(PaginationCriteria2 c) {
		return session.selectList(NAMESPACE+".selectPage", c);
	}

	@Override
	public int searchCount(int searchType, String searchKeyword) {
		Map<String, Object> args = new HashMap<>();
		args.put("searchType", searchType);
		args.put("searchKeyword", "%"+searchKeyword+"%");
		return session.selectOne(NAMESPACE+".totalSearchCount",args);
	}
	
	@Override
	public List<Board2> search(PaginationCriteria2 c, int type, String keyword) {
		Map<String, Object> args = new HashMap<>();
		args.put("searchType", type);
		args.put("searchKeyword", "%"+keyword+"%");
		args.put("start", c.getStart());
		args.put("end", c.getEnd());
	
		return session.selectList(NAMESPACE+".search3" , args);
	}

}









