package kr.or.kpc.dto;

public class ParkDto {
	private String pname;
	private String ptype;
	private String paddr;
	private double lan;
	private double len;
	private int parea;
	private String prest;
	private String pcall;
	
	public ParkDto() {
		super();
	}

	public ParkDto(String pname, String ptype, String paddr, double lan, double len, int parea, String prest,
			String pcall) {
		super();
		this.pname = pname;
		this.ptype = ptype;
		this.paddr = paddr;
		this.lan = lan;
		this.len = len;
		this.parea = parea;
		this.prest = prest;
		this.pcall = pcall;
	}
	
	public ParkDto(String pname,double lan, double len) {
		super();
		this.pname = pname;
		this.lan = lan;
		this.len = len;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPtype() {
		return ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype;
	}

	public String getPaddr() {
		return paddr;
	}

	public void setPaddr(String paddr) {
		this.paddr = paddr;
	}

	public double getLan() {
		return lan;
	}

	public void setLan(double lan) {
		this.lan = lan;
	}

	public double getLen() {
		return len;
	}

	public void setLen(double len) {
		this.len = len;
	}

	public int getParea() {
		return parea;
	}

	public void setParea(int parea) {
		this.parea = parea;
	}

	public String getPrest() {
		return prest;
	}

	public void setPrest(String prest) {
		this.prest = prest;
	}

	public String getPcall() {
		return pcall;
	}

	public void setPcall(String pcall) {
		this.pcall = pcall;
	}
}
