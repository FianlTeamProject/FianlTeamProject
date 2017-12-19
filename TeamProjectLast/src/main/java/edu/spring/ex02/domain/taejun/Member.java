package edu.spring.ex02.domain.taejun;

// MVC 디자인 패턴에서 Model 클래스 : VO(Value Object)
public class Member {
	private String mid;
	private String pwd;
	private String email;
	private String passwd;
	
	public Member() {}

	public Member(String mid, String pwd, String email) {
		this.mid = mid;
		this.pwd = pwd;
		this.email = email;
	}
	
	public Member(String mid, String pwd, String email, String passwd) {
		this.mid = mid;
		this.pwd = pwd;
		this.email = email;
		this.passwd = passwd;
	}
	
	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "{ID : " + mid + ", PW : " + pwd + ", Email : " + email + "}";
	}
	
	
	
}
