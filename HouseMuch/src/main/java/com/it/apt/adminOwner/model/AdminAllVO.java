package com.it.apt.adminOwner.model;

public class AdminAllVO {
	private int memberNo;
	private String authName;
	private String memberName;
	private String email;
	private String householdCode;
	private String id;
	private String authCode;
	
	public String getAuthCode() {
		return authCode;
	}
	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getAuthName() {
		return authName;
	}
	public void setAuthName(String authName) {
		this.authName = authName;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHouseholdCode() {
		return householdCode;
	}
	public void setHouseholdCode(String householdCode) {
		this.householdCode = householdCode;
	}
	
	@Override
	public String toString() {
		return "AdminAllVO [memberNo=" + memberNo + ", authName=" + authName + ", memberName=" + memberName + ", email="
				+ email + ", householdCode=" + householdCode + ", id=" + id + ", authCode=" + authCode + "]";
	}
	
}
