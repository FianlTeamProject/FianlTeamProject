package edu.spring.ex02.domain.taejun;

public class Files {
	private int bno;
	private String bfile;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBfile() {
		return bfile;
	}
	public void setBfile(String bfile) {
		this.bfile = bfile;
	}
	public Files(int bno, String bfile) {
		this.bno = bno;
		this.bfile = bfile;
	}
	public Files() {
	}
	
	

}
