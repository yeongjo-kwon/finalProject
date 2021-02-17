package com.it.apt.adminFacility.model;

public class CompanyVO{
	//관리 업체 정보
	private int mngCompNo;
	private int mngCompCtgNo;
	private String mngCompName;
	private String mngCompTel;
	
	//계약내역
	private int contractNo;
	private String contractContent;
	private String contractPrice;
	private String contractDate;
	private int aptNo;
	private String isAddFacility;
	
	//
	private String mngCompCtgName;
	
	public String getMngCompCtgName() {
		return mngCompCtgName;
	}
	public void setMngCompCtgName(String mngCompCtgName) {
		this.mngCompCtgName = mngCompCtgName;
	}
	public int getMngCompNo() {
		return mngCompNo;
	}
	public void setMngCompNo(int mngCompNo) {
		this.mngCompNo = mngCompNo;
	}
	public int getMngCompCtgNo() {
		return mngCompCtgNo;
	}
	public void setMngCompCtgNo(int mngCompCtgNo) {
		this.mngCompCtgNo = mngCompCtgNo;
	}
	public String getMngCompName() {
		return mngCompName;
	}
	public void setMngCompName(String mngCompName) {
		this.mngCompName = mngCompName;
	}
	public String getMngCompTel() {
		return mngCompTel;
	}
	public void setMngCompTel(String mngCompTel) {
		this.mngCompTel = mngCompTel;
	}
	public int getContractNo() {
		return contractNo;
	}
	public void setContractNo(int contractNo) {
		this.contractNo = contractNo;
	}
	public String getContractContent() {
		return contractContent;
	}
	public void setContractContent(String contractContent) {
		this.contractContent = contractContent;
	}
	public String getContractPrice() {
		return contractPrice;
	}
	public void setContractPrice(String contractPrice) {
		this.contractPrice = contractPrice;
	}
	public String getContractDate() {
		return contractDate;
	}
	public void setContractDate(String contractDate) {
		this.contractDate = contractDate;
	}
	public int getAptNo() {
		return aptNo;
	}
	public void setAptNo(int aptNo) {
		this.aptNo = aptNo;
	}
	public String getIsAddFacility() {
		return isAddFacility;
	}
	public void setIsAddFacility(String isAddFacility) {
		this.isAddFacility = isAddFacility;
	}
	
	@Override
	public String toString() {
		return "CompanyVO [mngCompNo=" + mngCompNo + ", mngCompCtgNo=" + mngCompCtgNo + ", mngCompName=" + mngCompName
				+ ", mngCompTel=" + mngCompTel + ", contractNo=" + contractNo + ", contractContent=" + contractContent
				+ ", contractPrice=" + contractPrice + ", contractDate=" + contractDate + ", aptNo=" + aptNo
				+ ", isAddFacility=" + isAddFacility + "]";
	}

}
