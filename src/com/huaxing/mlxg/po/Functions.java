package com.huaxing.mlxg.po;

public class Functions {
	private Long funid;
	private String fname;
	private String ftext;
	private Long moduleid;
	public Functions(Long funid, String fname, String ftext, Long moduleid) {
		super();
		this.funid = funid;
		this.fname = fname;
		this.ftext = ftext;
		this.moduleid = moduleid;
	}
	public Functions(){
		
	}
	public Long getFunid() {
		return funid;
	}
	public void setFunid(Long funid) {
		this.funid = funid;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getFtext() {
		return ftext;
	}
	public void setFtext(String ftext) {
		this.ftext = ftext;
	}
	public Long getModuleid() {
		return moduleid;
	}
	public void setModuleid(Long moduleid) {
		this.moduleid = moduleid;
	}

}
