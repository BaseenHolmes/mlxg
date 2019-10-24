package com.huaxing.mlxg.po;

public class Role {
	private Long roid;
	private String rname;
	private String rtext;
	public Long getRoid() {
		return roid;
	}
	public Role(Long roid, String rname, String rtext) {
		super();
		this.roid = roid;
		this.rname = rname;
		this.rtext = rtext;
	}
	
	public Role() {
	}
	public void setRoid(Long roid) {
		this.roid = roid;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getRtext() {
		return rtext;
	}
	public void setRtext(String rtext) {
		this.rtext = rtext;
	}

}
