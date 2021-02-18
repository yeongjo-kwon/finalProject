package com.it.apt.adminFacility.model;

public class AddCostVO {
	private int costNo;
	private String costContent;
	private int mngCompNo;
	private int costPrice;
	private String costRegdate;
	private String costFlag;
	private int aptNo;
	
	public int getAptNo() {
		return aptNo;
	}
	public void setAptNo(int aptNo) {
		this.aptNo = aptNo;
	}
	public int getCostNo() {
		return costNo;
	}
	public void setCostNo(int costNo) {
		this.costNo = costNo;
	}
	public String getCostContent() {
		return costContent;
	}
	public void setCostContent(String costContent) {
		this.costContent = costContent;
	}
	public int getMngCompNo() {
		return mngCompNo;
	}
	public void setMngCompNo(int mngCompNo) {
		this.mngCompNo = mngCompNo;
	}
	public int getCostPrice() {
		return costPrice;
	}
	public void setCostPrice(int costPrice) {
		this.costPrice = costPrice;
	}
	public String getCostRegdate() {
		return costRegdate;
	}
	public void setCostRegdate(String costRegdate) {
		this.costRegdate = costRegdate;
	}
	public String getCostFlag() {
		return costFlag;
	}
	public void setCostFlag(String costFlag) {
		this.costFlag = costFlag;
	}
	@Override
	public String toString() {
		return "AddCostVO [costNo=" + costNo + ", costContent=" + costContent + ", mngCompNo=" + mngCompNo
				+ ", costPrice=" + costPrice + ", costRegdate=" + costRegdate + ", costFlag=" + costFlag + ", aptNo="
				+ aptNo + "]";
	}

}
