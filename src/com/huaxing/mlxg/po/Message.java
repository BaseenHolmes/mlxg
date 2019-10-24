package com.huaxing.mlxg.po;

import java.sql.Date;

public class Message {
	private Long messageid;
	private String mename;
	private Long mesend;
	private Long merecive;
	private Date medate;
	private String metext;

	public Message() {
	}

	public Long getMessageid() {
		return messageid;
	}

	public void setMessageid(Long messageid) {
		this.messageid = messageid;
	}

	public String getMename() {
		return mename;
	}

	public void setMename(String mename) {
		this.mename = mename;
	}

	public Long getMesend() {
		return mesend;
	}

	public void setMesend(Long mesend) {
		this.mesend = mesend;
	}

	public Long getMerecive() {
		return merecive;
	}

	public void setMerecive(Long merecive) {
		this.merecive = merecive;
	}

	public Date getMedate() {
		return medate;
	}

	public void setMedate(Date medate) {
		this.medate = medate;
	}

	public String getMetext() {
		return metext;
	}

	public void setMetext(String metext) {
		this.metext = metext;
	}

	public Message(Long messageid, String mename, Long mesend, Long merecive, Date medate, String metext) {
		this.messageid = messageid;
		this.mename = mename;
		this.mesend = mesend;
		this.merecive = merecive;
		this.medate = medate;
		this.metext = metext;
	}

	@Override
	public String toString() {
		return "Message{" +
				"messageid=" + messageid +
				", mename='" + mename + '\'' +
				", mesend=" + mesend +
				", merecive=" + merecive +
				", medate='" + medate + '\'' +
				", metext='" + metext + '\'' +
				'}';
	}
}
