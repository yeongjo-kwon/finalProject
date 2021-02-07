package com.it.apt.mngcost.model;

import java.sql.Timestamp;

public class InquiryInfoVO {
	//정보
	private int aptNo;
	private String householdCode;
	
	//조회
	private String mngcostLimitdate;
    private Timestamp mngcostClaimdate;
    private String startdate;
    private String enddate;
    private int mngcostSCtgNo;
    private int mngcostMCtgNo;
    
	public int getAptNo() {
		return aptNo;
	}
	public void setAptNo(int aptNo) {
		this.aptNo = aptNo;
	}
	public String getHouseholdCode() {
		return householdCode;
	}
	public void setHouseholdCode(String householdCode) {
		this.householdCode = householdCode;
	}
	public String getMngcostLimitdate() {
		return mngcostLimitdate;
	}
	public void setMngcostLimitdate(String mngcostLimitdate) {
		this.mngcostLimitdate = mngcostLimitdate;
	}
	public Timestamp getMngcostClaimdate() {
		return mngcostClaimdate;
	}
	public void setMngcostClaimdate(Timestamp mngcostClaimdate) {
		this.mngcostClaimdate = mngcostClaimdate;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public int getMngcostSCtgNo() {
		return mngcostSCtgNo;
	}
	public void setMngcostSCtgNo(int mngcostSCtgNo) {
		this.mngcostSCtgNo = mngcostSCtgNo;
	}
	public int getMngcostMCtgNo() {
		return mngcostMCtgNo;
	}
	public void setMngcostMCtgNo(int mngcostMCtgNo) {
		this.mngcostMCtgNo = mngcostMCtgNo;
	}
	
	@Override
	public String toString() {
		return "InquiryInfoVO [aptNo=" + aptNo + ", householdCode=" + householdCode + ", mngcostLimitdate="
				+ mngcostLimitdate + ", mngcostClaimdate=" + mngcostClaimdate + ", startdate=" + startdate
				+ ", enddate=" + enddate + ", mngcostSCtgNo=" + mngcostSCtgNo + ", mngcostMCtgNo=" + mngcostMCtgNo
				+ "]";
	}
}
