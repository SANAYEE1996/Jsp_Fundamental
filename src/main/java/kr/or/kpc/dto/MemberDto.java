package kr.or.kpc.dto;

public class MemberDto {
	
	private int num;
	private String name;
	private String addr;
	private String sex;
	
	public MemberDto() {
		super();
	}
	
	public MemberDto(int num, String name, String addr, String sex) {
		super();
		this.num = num;
		this.name = name;
		this.addr = addr;
		this.sex = sex;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	
	
}
