package com.huaxing.mlxg.po;

public class Plan {
	private Long planid;
	private String plname;
	private String plstart;
	private String plend;
	private Long funid;
	private Long Flag;
	private String plyouxianji;
	private String plzhuangtai;
	private String pltext;
	public Plan(Long planid, String plname, String plstart, String plend,
				Long funid, Long flag, String plyouxianji, String plzhuangtai,
				String pltext) {
		super();
		this.planid = planid;
		this.plname = plname;
		this.plstart = plstart;
		this.plend = plend;
		this.funid = funid;
		Flag = flag;
		this.plyouxianji = plyouxianji;
		this.plzhuangtai = plzhuangtai;
		this.pltext = pltext;
	}
	public Plan(){
		
	}
	public Long getPlanid() {
		return planid;
	}
	public void setPlanid(Long planid) {
		this.planid = planid;
	}
	public String getPlname() {
		return plname;
	}
	public void setPlname(String plname) {
		this.plname = plname;
	}
	public String getPlstart() {
		return plstart;
	}
	public void setPlstart(String plstart) {
		this.plstart = plstart;
	}
	public String getPlend() {
		return plend;
	}
	public void setPlend(String plend) {
		this.plend = plend;
	}
	public Long getFunid() {
		return funid;
	}
	public void setFunid(Long funid) {
		this.funid = funid;
	}
	public Long getFlag() {
		return Flag;
	}
	public void setFlag(Long flag) {
		Flag = flag;
	}
	public String getPlyouxianji() {
		return plyouxianji;
	}
	public void setPlyouxianji(String plyouxianji) {
		this.plyouxianji = plyouxianji;
	}
	public String getPlzhuangtai() {
		return plzhuangtai;
	}
	public void setPlzhuangtai(String plzhuangtai) {
		this.plzhuangtai = plzhuangtai;
	}
	public String getPltext() {
		return pltext;
	}
	public void setPltext(String pltext) {
		this.pltext = pltext;
	}

}
