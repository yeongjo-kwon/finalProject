package com.it.apt.adminMaster.model;

import java.sql.Timestamp;

public class ApartmentToSuperVO {
	private int idx;
	private String fromAptName;
	private String fromName;
	private String fromHp;
	private String fromEmail;
	private String fromDetail;
	private String flag;
	private Timestamp regdate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getFromAptName() {
		return fromAptName;
	}
	public void setFromAptName(String fromAptName) {
		this.fromAptName = fromAptName;
	}
	public String getFromName() {
		return fromName;
	}
	public void setFromName(String fromName) {
		this.fromName = fromName;
	}
	public String getFromHp() {
		return fromHp;
	}
	public void setFromHp(String fromHp) {
		this.fromHp = fromHp;
	}
	public String getFromEmail() {
		return fromEmail;
	}
	public void setFromEmail(String fromEmail) {
		this.fromEmail = fromEmail;
	}
	public String getFromDetail() {
		return fromDetail;
	}
	public void setFromDetail(String fromDetail) {
		this.fromDetail = fromDetail;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "ApartmentToSuperVO [idx=" + idx + ", fromAptName=" + fromAptName + ", fromName=" + fromName
				+ ", fromHp=" + fromHp + ", fromEmail=" + fromEmail + ", fromDetail=" + fromDetail + ", flag=" + flag
				+ ", regdate=" + regdate + "]";
	}
	
}
