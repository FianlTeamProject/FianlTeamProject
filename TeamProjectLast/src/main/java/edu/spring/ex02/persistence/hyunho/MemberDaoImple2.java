package edu.spring.ex02.persistence.hyunho;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.ex02.domain.hyunho.Member2;

@Repository
public class MemberDaoImple2 implements MemberDao2 {

	@Autowired
	private SqlSession session;
	private static final String NAMESPACE = "hyunhomembermapper";
	
	@Override
	public List<Member2> read() {
		return session.selectList(NAMESPACE+".selectAll");
	}

	@Override
	public Member2 read(String userid) {
		return session.selectOne(NAMESPACE+".selectById", userid);
	}

	@Override
	public int insert(Member2 m) {
		return session.insert(NAMESPACE+".insert", m);
	}

	@Override
	public int update(Member2 m) {
		return session.update(NAMESPACE+".update", m);
	}

	@Override
	public int delete(String userid) {
		return session.delete(NAMESPACE+".delete", userid);
	}

	@Override
	public List<Member2> search(Map<String, Object> map) {
		return session.selectList(NAMESPACE+".search", map);
	}

}
