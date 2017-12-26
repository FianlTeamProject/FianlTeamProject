package edu.spring.ex02.service.hyunho;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.ex02.domain.hyunho.Member2;
import edu.spring.ex02.persistence.hyunho.MemberDao2;

@Service
public class MemberServiceImple2 implements MemberService2 {

	@Autowired
	private MemberDao2 dao;
	
	@Override
	public List<Member2> read() {
		return dao.read();
	}

	@Override
	public Member2 read(String userid) {
		return dao.read(userid);
	}

	@Override
	public int insert(Member2 m) {
		return dao.insert(m);
	}

	@Override
	public int update(Member2 m) {
		return dao.update(m);
	}

	@Override
	public int delete(String userid) {
		return dao.delete(userid);
	}

	@Override
	public List<Member2> search(int type, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("type", type);
		map.put("keyword","%"+keyword+"%");
		return dao.search(map);
	}

}
