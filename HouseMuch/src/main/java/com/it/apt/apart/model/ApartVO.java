package com.it.apt.apart.model;

public class ApartVO {
	private int aptNo;
	private String aptName;
	private int zipcodeSeq;
	private String address;
	private String addressDetail;
	private int totalHousehold;
	
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
	
	@Override
	public String toString() {
		return "ApartVO [aptNo=" + aptNo + ", aptName=" + aptName + ", zipcodeSeq=" + zipcodeSeq + ", address="
				+ address + ", addressDetail=" + addressDetail + ", totalHousehold=" + totalHousehold + "]";
	}

}
