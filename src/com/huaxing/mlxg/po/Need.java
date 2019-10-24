package com.huaxing.mlxg.po;

public class Need {
	private Long needid;
	private String nname;
	private String ntext;
	private Long projectid;
	public Long getNeedid() {
		return needid;
	}
	public void setNeedid(Long needid) {
		this.needid = needid;
	}
	public String getNname() {
		return nname;
	}
	public Need(Long needid, String nname, String ntext, Long projectid) {
		super();
		this.needid = needid;
		this.nname = nname;
		this.ntext = ntext;
		this.projectid = projectid;
	}
	public Need(){
		
	}
	public void setNname(String nname) {
		this.nname = nname;
	}
	public String getNtext() {
		return ntext;
	}
	public void setNtext(String ntext) {
		this.ntext = ntext;
	}
	public Long getProjectid() {
		return projectid;
	}
	public void setProjectid(Long projectid) {
		this.projectid = projectid;
	}

}
