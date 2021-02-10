package com.it.apt.adminOwner.model;

public class ResidentVO {
	private int hMemberNo;
	private String householdCode;
	private String dong;
	private String ho;
	private String hMembName;
	private String birth;
	private String relation;
	
	public int gethMemberNo() {
		return hMemberNo;
	}
	public void sethMemberNo(int hMemberNo) {
		this.hMemberNo = hMemberNo;
	}
	public String getHouseholdCode() {
		return householdCode;
	}
	public void setHouseholdCode(String householdCode) {
		this.householdCode = householdCode;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getHo() {
		return ho;
	}
	public void setHo(String ho) {
		this.ho = ho;
	}
	public String gethMembName() {
		return hMembName;
	}
	public void sethMembName(String hMembName) {
		this.hMembName = hMembName;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getRelation() {
		return relation;
	}
	public void setRelation(String relation) {
		this.relation = relation;
	}
	
	@Override
	public String toString() {
		return "ResidentVO [hMemberNo=" + hMemberNo + ", householdCode=" + householdCode + ", dong=" + dong + ", ho="
				+ ho + ", hMembName=" + hMembName + ", birth=" + birth + ", relation=" + relation + "]";
	}

}
