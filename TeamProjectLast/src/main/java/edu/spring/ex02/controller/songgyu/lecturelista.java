package edu.spring.ex02.controller.songgyu;

import java.util.Date;

public class lecturelista {

	private int bno;
	private String title;
	private String name;
	private String address;
	
	
	public lecturelista(int bno, String title, String name, String address) {
		
		this.bno = bno;
		this.title = title;
		this.name = name;
		this.address = address;
		
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
}
