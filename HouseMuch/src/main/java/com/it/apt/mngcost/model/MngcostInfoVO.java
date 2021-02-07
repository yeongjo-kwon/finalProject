package com.it.apt.mngcost.model;

import java.sql.Timestamp;

public class MngcostInfoVO extends MngcostSubCtgVO{
	private int mngcostNo;
	private int mngcostSCtgNo;
	private int aptNo;
	private String mngcostContent;
	private int mngcostPrice;
	private Timestamp mngcostUsedate;
	
	public int getMngcostNo() {
		return mngcostNo;
	}
	public void setMngcostNo(int mngcostNo) {
		this.mngcostNo = mngcostNo;
	}
	public int getMngcostSCtgNo() {
		return mngcostSCtgNo;
	}
	public void setMngcostSCtgNo(int mngcostSCtgNo) {
		this.mngcostSCtgNo = mngcostSCtgNo;
	}
	public int getAptNo() {
		return aptNo;
	}
	public void setAptNo(int aptNo) {
		this.aptNo = aptNo;
	}
	public String getMngcostContent() {
		return mngcostContent;
	}
	public void setMngcostContent(String mngcostContent) {
		this.mngcostContent = mngcostContent;
	}
	public int getMngcostPrice() {
		return mngcostPrice;
	}
	public void setMngcostPrice(int mngcostPrice) {
		this.mngcostPrice = mngcostPrice;
	}
	public Timestamp getMngcostUsedate() {
		return mngcostUsedate;
	}
	public void setMngcostUsedate(Timestamp mngcostUsedate) {
		this.mngcostUsedate = mngcostUsedate;
	}
	
	@Override
	public String toString() {
		return "MngcostInfoVO [mngcostNo=" + mngcostNo + ", mngcostSCtgNo=" + mngcostSCtgNo + ", aptNo=" + aptNo
				+ ", mngcostContent=" + mngcostContent + ", mngcostPrice=" + mngcostPrice + ", mngcostUsedate="
				+ mngcostUsedate + "]";
	}
}
