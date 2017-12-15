package edu.spring.ex02.service.taejun;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.ex02.domain.taejun.Files;
import edu.spring.ex02.persistence.taejun.FilesDao;


@Service
public class FilesServiceImple implements FilesService {
	
	@Autowired
	private FilesDao dao;

	@Override
	public List<Files> select(int bno) {
		return dao.read(bno);
	}

	@Override
	public int insert(Files f) {
		return dao.create(f);
	}

}
