package com.huaxing.mlxg.po;

public class Power {
	private Long poid;
	private String pname;
	private String phref;
	private Long fuid;

	public Long getPoid() {
		return poid;
	}

	public void setPoid(Long poid) {
		this.poid = poid;
	}

	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPhref() {
		return phref;
	}
	public void setPhref(String phref) {
		this.phref = phref;
	}
	public Long getFuid() {
		return fuid;
	}
	public void setFuid(Long fuid) {
		this.fuid = fuid;
	}
	public Power(Long poid, String pname, String phref, Long fuid) {
		super();
		this.poid = poid;
		this.pname = pname;
		this.phref = phref;
		this.fuid = fuid;
	}
	public Power(){
		
	}

}
