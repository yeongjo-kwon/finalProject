package com.it.apt.apart.model;

public class ApartExcelVO {
	private int aptNo;
	private String aptName;
	private int zipcodeSeq;
	private String address;
	private String addressDetail;
	private int totalHousehold;
	private String householdCode;
	private String memberName;
	private String email;
	private String hp1;
	private String hp2;
	private String hp3;
	
	public int getAptNo() {
		return aptNo;
	}
	public void setAptNo(int aptNo) {
		this.aptNo = aptNo;
	}
	public String getAptName() {
		return aptName;
	}
	public void setAptName(String aptName) {
		this.aptName = aptName;
	}
	public int getZipcodeSeq() {
		return zipcodeSeq;
	}
	public void setZipcodeSeq(int zipcodeSeq) {
		this.zipcodeSeq = zipcodeSeq;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	public int getTotalHousehold() {
		return totalHousehold;
	}
	public void setTotalHousehold(int totalHousehold) {
		this.totalHousehold = totalHousehold;
	}
	public String getHouseholdCode() {
		return householdCode;
	}
	public void setHouseholdCode(String householdCode) {
		this.householdCode = householdCode;
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
	public String getHp1() {
		return hp1;
	}
	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}
	public String getHp2() {
		return hp2;
	}
	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}
	public String getHp3() {
		return hp3;
	}
	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}
	
	@Override
	public String toString() {
		return "ApartExcelVo [aptNo=" + aptNo + ", aptName=" + aptName + ", zipcodeSeq=" + zipcodeSeq + ", address="
				+ address + ", addressDetail=" + addressDetail + ", totalHousehold=" + totalHousehold
				+ ", householdCode=" + householdCode + ", memberName=" + memberName + ", email=" + email + ", hp1="
				+ hp1 + ", hp2=" + hp2 + ", hp3=" + hp3 + "]";
	}

}
