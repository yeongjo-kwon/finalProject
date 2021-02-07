package com.it.apt.adminOwner.model;

public class ResidentVO {
	private int hMemberNo;
	private String household_code;
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
	public String getHousehold_code() {
		return household_code;
	}
	public void setHousehold_code(String household_code) {
		this.household_code = household_code;
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
		return "ResidentVO [hMemberNo=" + hMemberNo + ", household_code=" + household_code + ", dong=" + dong + ", ho="
				+ ho + ", hMembName=" + hMembName + ", birth=" + birth + ", relation=" + relation + "]";
	}

}
