package edu.spring.ex02.persistence.taejun;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.ex02.domain.taejun.Member;

@Repository
public class MemberDaoImple implements MemberDao {
	
	static final String NAMESPACE = "taejunMappers";
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int insert(Member m) {
		return session.insert(NAMESPACE+".insert_Member",m);
	}

	@Override
	public Member login(Member m) {
		return session.selectOne(NAMESPACE+".login_Member", m);
	}

	@Override
	public List<String> search(String email) {
		return session.selectList(NAMESPACE+".searchId_Member", email);
	}

	@Override
	public String search(Member m) {
		return session.selectOne(NAMESPACE+".searchPw_Member",m);
	}

	@Override
	public int update(Member m) {
		return session.update(NAMESPACE+".update_Member", m);
	}

	@Override
	public int delete(Member m) {
		return session.delete(NAMESPACE+".delete_Member", m);
	}

	@Override
	public List<Member> select() {
		return session.selectList(NAMESPACE+".selectAll_Member");
	}

	@Override
	public Member check(String mid) {
		return session.selectOne(NAMESPACE+".idCheck_Member",mid);
	}

}
