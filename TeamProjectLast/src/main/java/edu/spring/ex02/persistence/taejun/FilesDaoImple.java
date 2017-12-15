package edu.spring.ex02.persistence.taejun;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.ex02.domain.taejun.Files;


@Repository
public class FilesDaoImple implements FilesDao {
	
	static final String NAMESPACE = "taejunMappers";
	
	@Autowired //의존성 주입(DI)
	private SqlSession session;

	@Override
	public List<Files> read(int bno) {
		return session.selectList(NAMESPACE+".select_Files");
	}

	@Override
	public int create(Files f) {
		return session.insert(NAMESPACE+".insert_Files");
	}

}
