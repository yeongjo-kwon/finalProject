package com.it.apt.household.model;

public class HouseholdVO {
	private String householdCode;
	private int aptNo;
	private String dong;
	private String ho;
	private String authCode;
	
	public String getHouseholdCode() {
		return householdCode;
	}
	public void setHouseholdCode(String householdCode) {
		this.householdCode = householdCode;
	}
	public int getAptNo() {
		return aptNo;
	}
	public void setAptNo(int aptNo) {
		this.aptNo = aptNo;
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
	
	public String getAuthCode() {
		return authCode;
	}
	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}
	@Override
	public String toString() {
		return "HouseholdVO [householdCode=" + householdCode + ", aptNo=" + aptNo + ", dong=" + dong + ", ho=" + ho
				+ ", authCode=" + authCode + "]";
	}
	
}
