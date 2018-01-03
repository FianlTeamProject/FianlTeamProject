package edu.spring.ex02.mappers.hyunho;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import edu.spring.ex02.domain.hyunho.Reply2;

public interface ReplyMapper2 {
	
	String SQL_INSERT =
			"INSERT INTO test_reply (bno, rtext, replier, regdate)"
			+ " VALUES(#{bno},#{rtext},#{replier},sysdate)";
	
	String SQL_UPDATE = 
			" UPDATE test_reply"
			+ " SET rtext = #{rtext}, regdate = sysdate"
			+ " WHERE rno = #{rno}";
	
	String SQL_SELECT_BY_BNO =
			" SELECT * FROM test_reply WHERE BNO = #{bno} ORDER BY rno DESC";
	
	String SQL_DELETE = 
			"DELETE FROM test_reply WHERE rno = #{rno}";

	
	
	
	@Select(SQL_SELECT_BY_BNO)
	List<Reply2> read(int bno);
	// 어노테이션과 인터페이스를 사용할 때
	// xml 파일의 id와 겹치는 이름의 메소드를 사용 할 수 없음
	
	@Insert(SQL_INSERT)
	int insert(Reply2 r);
	
	@Update(SQL_UPDATE)
	int update(Reply2 r);
	
	// Mapper 인터페이스 메소드의 이름을
	// Mapper xml 파일의 SQL 문의 id와 동일하게만 만들어 주면 xml 파일에 정의된 SQL문을 사용하는 메소드가 됨
	// edu.spring.ex03.Mappers.ReplyMapper.delete
	@Delete(SQL_DELETE)
	int delete(int rno);
	
}// end interface ReplyMapper














