package com.it.apt.household.model;

public class HouseholdMemVo {
	private int hMemberNo;
	private String householdCode;
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
		return "HouseholdMemVo [hMemberNo=" + hMemberNo + ", householdCode=" + householdCode + ", hMembName="
				+ hMembName + ", birth=" + birth + ", relation=" + relation + "]";
	}
}
