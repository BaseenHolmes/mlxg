package com.huaxing.mlxg.po;

public class Uploadfile {
	private Long fileid;
	private String coname;
	private String coper;
	private String cotime;
	private Long projectid;
	public Uploadfile(Long fileid, String coname, String coper, String cotime,
					  Long projectid) {
		super();
		this.fileid = fileid;
		this.coname = coname;
		this.coper = coper;
		this.cotime = cotime;
		this.projectid = projectid;
	}
	public Uploadfile(){
		
	}
	public Long getFileid() {
		return fileid;
	}
	public void setFileid(Long fileid) {
		this.fileid = fileid;
	}
	public String getConame() {
		return coname;
	}
	public void setConame(String coname) {
		this.coname = coname;
	}
	public String getCoper() {
		return coper;
	}
	public void setCoper(String coper) {
		this.coper = coper;
	}
	public String getCotime() {
		return cotime;
	}
	public void setCotime(String cotime) {
		this.cotime = cotime;
	}
	public Long getProjectid() {
		return projectid;
	}
	public void setProjectid(Long projectid) {
		this.projectid = projectid;
	}

}
