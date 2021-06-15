package kr.or.kpc.dto;

public class CustomerDto {
	private int num;
	private String email;
	private String pwd;
	private String name;
	private String status;
	private String regdate;
	
	public CustomerDto() {
		super();
	}
	public CustomerDto(int num, String email, String pwd, String name, String status, String regdate) {
		super();
		this.num = num;
		this.email = email;
		this.pwd = pwd;
		this.name = name;
		this.status = status;
		this.regdate = regdate;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
}
