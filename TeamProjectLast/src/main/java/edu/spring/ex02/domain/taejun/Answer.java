package edu.spring.ex02.domain.taejun;

public class Answer {
	private int bno;
	private String content;
	private String userid;
	private String bfile;
	public Answer(int bno, String content, String userid, String bfile) {
		super();
		this.bno = bno;
		this.content = content;
		this.userid = userid;
		this.bfile = bfile;
	}
	public Answer() {
		super();
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getBfile() {
		return bfile;
	}
	public void setBfile(String bfile) {
		this.bfile = bfile;
	}
	
	
}
