package com.it.apt.adminLiving.add.model;

import java.sql.Timestamp;

import com.it.apt.common.SearchVO;

public class AddFacilityInfoVO extends SearchVO{ 
					// houseHoldCode toString에 꼭 같이 추가할 것
	//ADDITIONAL_FACILITY_INFO 테이블
	private int addCtgNo;
	private int addCtgName; //부가시설 분류명
	
	private int addNo;
	private String addName;
	private String addLocationInfo;
	private String addContent; 
	private int addPrice;
	private int aptNo;
	private Timestamp addRegdate;       
	private Timestamp addOutdate;
	
	private String addinfoImgFilename;
	private String addinfoImgOriginalFilename;
	
	
	//추가필드(테이블외)
	
	
	// 1. 등록자정보
	private String authCode;	//등록자 권한 : aptNo로 조회한 AUTH_CODE='LIVING_MNG' (authLevel=2,행정관리자)
	private String memberName;	//등록자 memberName 
	private String householdCode;	//householdCode
	
	// 2. 이용자 수 관련필드
	private int totalOrderCnt;	// 총 이용자 수 (아파트 번호로 조회한 신청 householdeCode 숫자)
	private int orderCnt;	    // 각 시설별 이용자 수 (VO 한개당 이용자숫자 1개) 
	

	
	
//=============================================ADDITIONAL_FACILITY_INFO 테이블 필드
	public int getAddCtgNo() {
		return addCtgNo;
	}
	public void setAddCtgNo(int addCtgNo) {
		this.addCtgNo = addCtgNo;
	}

	public int getAddNo() {
		return addNo;
	}
	public void setAddNo(int addNo) {
		this.addNo = addNo;
	}
	public int getAddCtgName() {
		return addCtgName;
	}
	public void setAddCtgName(int addCtgName) {
		this.addCtgName = addCtgName;
	}
	public String getAddName() {
		return addName;
	}
	public void setAddName(String addName) {
		this.addName = addName;
	}
	
	
	public String getAddLocationInfo() {
		return addLocationInfo;
	}
	public void setAddLocationInfo(String addLocationInfo) {
		this.addLocationInfo = addLocationInfo;
	}
	public String getAddContent() {
		return addContent;
	}
	public void setAddContent(String addContent) {
		this.addContent = addContent;
	}
	public int getAddPrice() {
		return addPrice;
	}
	public void setAddPrice(int addPrice) {
		this.addPrice = addPrice;
	}
	public int getAptNo() {
		return aptNo;
	}
	public void setAptNo(int aptNo) {
		this.aptNo = aptNo;
	}
	public Timestamp getAddRegdate() {
		return addRegdate;
	}
	public void setAddRegdate(Timestamp addRegdate) {
		this.addRegdate = addRegdate;
	}
	public Timestamp getAddOutdate() {
		return addOutdate;
	}
	public void setAddOutdate(Timestamp addOutdate) {
		this.addOutdate = addOutdate;
	}
	
	public String getAddinfoImgFilename() {
		return addinfoImgFilename;
	}
	public void setAddinfoImgFilename(String addinfoImgFilename) {
		this.addinfoImgFilename = addinfoImgFilename;
	}
	public String getAddinfoImgOriginalFilename() {
		return addinfoImgOriginalFilename;
	}
	public void setAddinfoImgOriginalFilename(String addinfoImgOriginalFilename) {
		this.addinfoImgOriginalFilename = addinfoImgOriginalFilename;
	}
	
//=============================================추가필드
	public String getAuthCode() {
		return authCode;
	}
	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getHouseholdCode() {
		return householdCode;
	}
	public void setHouseholdCode(String householdCode) {
		this.householdCode = householdCode;
	}
	public int getTotalOrderCnt() {
		return totalOrderCnt;
	}
	public void setTotalOrderCnt(int totalOrderCnt) {
		this.totalOrderCnt = totalOrderCnt;
	}
	public int getOrderCnt() {
		return orderCnt;
	}
	public void setOrderCnt(int orderCnt) {
		this.orderCnt = orderCnt;
	}
	@Override
	public String toString() {
		return "AddFacilityInfoVO [addCtgNo=" + addCtgNo + ", addCtgName=" + addCtgName + ", addNo=" + addNo
				+ ", addName=" + addName + ", addLocationInfo=" + addLocationInfo + ", addContent=" + addContent
				+ ", addPrice=" + addPrice + ", aptNo=" + aptNo + ", addRegdate=" + addRegdate + ", addOutdate="
				+ addOutdate + ", addinfoImgFilename=" + addinfoImgFilename + ", addinfoImgOriginalFilename="
				+ addinfoImgOriginalFilename + ", authCode=" + authCode + ", memberName=" + memberName + ", householdCode="
				+ householdCode + ", totalOrderCnt=" + totalOrderCnt + ", orderCnt=" + orderCnt + ", toString()="
				+ super.toString() + "]";
	}
		
	
	
	
	
	
	
	
	
	

	

	




}