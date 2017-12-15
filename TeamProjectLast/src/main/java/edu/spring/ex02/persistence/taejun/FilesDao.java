package edu.spring.ex02.persistence.taejun;

import java.util.List;

import edu.spring.ex02.domain.taejun.Files;

public interface FilesDao {
	List<Files> read(int bno);
	int create (Files f);
}
