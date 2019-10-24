package com.huaxing.mlxg.po;

public class Project {
	private Long projectid;
	private String pname;
	private Long clientid;
	private Long userid;
	private Long pnumber;
	private String pstart;
	public Project() {
	
	}
	public Project(Long projectid, String pname, Long clientid, Long userid, Long pnumber,
				   String pstart, String pgengxin, String pyouxianji, String pzhuangtai) {
		super();
		this.projectid = projectid;
		this.pname = pname;
		this.clientid = clientid;
		this.userid = userid;
		this.pnumber = pnumber;
		this.pstart = pstart;
		this.pgengxin = pgengxin;
		this.pyouxianji = pyouxianji;
		this.pzhuangtai = pzhuangtai;
	}
	public Long getProjectid() {
		return projectid;
	}
	public void setProjectid(Long projectid) {
		this.projectid = projectid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public Long getClientid() {
		return clientid;
	}
	public void setClientid(Long clientid) {
		this.clientid = clientid;
	}
	public Long getUserid() {
		return userid;
	}
	public void setUserid(Long userid) {
		this.userid = userid;
	}
	public Long getPnumber() {
		return pnumber;
	}
	public void setPnumber(Long pnumber) {
		this.pnumber = pnumber;
	}
	public String getPstart() {
		return pstart;
	}
	public void setPstart(String pstart) {
		this.pstart = pstart;
	}
	public String getPgengxin() {
		return pgengxin;
	}
	public void setPgengxin(String pgengxin) {
		this.pgengxin = pgengxin;
	}
	public String getPyouxianji() {
		return pyouxianji;
	}
	public void setPyouxianji(String pyouxianji) {
		this.pyouxianji = pyouxianji;
	}
	public String getPzhuangtai() {
		return pzhuangtai;
	}
	public void setPzhuangtai(String pzhuangtai) {
		this.pzhuangtai = pzhuangtai;
	}
	private String pgengxin;
	private String pyouxianji;
	private String pzhuangtai;
	

}
