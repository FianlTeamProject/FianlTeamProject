package edu.spring.ex02.service.taejun;

import java.util.List;

import edu.spring.ex02.domain.taejun.Files;

public interface FilesService {
	List<Files> select (int bno);
	int insert (Files f);
}
