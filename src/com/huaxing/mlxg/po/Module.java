package com.huaxing.mlxg.po;

public class Module {
	private Long moduleid;
	private String mname;
	private String mtext;
	private Long needid;
	public Module(Long moduleid, String mname, String mtext, Long needid) {
		super();
		this.moduleid = moduleid;
		this.mname = mname;
		this.mtext = mtext;
		this.needid = needid;
	}
	public Module(){
		
	}
	public Long getModuleid() {
		return moduleid;
	}
	public void setModuleid(Long moduleid) {
		this.moduleid = moduleid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMtext() {
		return mtext;
	}
	public void setMtext(String mtext) {
		this.mtext = mtext;
	}
	public Long getNeedid() {
		return needid;
	}
	public void setNeedid(Long needid) {
		this.needid = needid;
	}

}
