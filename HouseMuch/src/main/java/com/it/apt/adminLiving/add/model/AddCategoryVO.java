package com.it.apt.adminLiving.add.model;

public class AddCategoryVO {
	private int addCtgNo;
	private String addCtgName;

	public int getAddCtgNo() {
		return addCtgNo;
	}
	public void setAddCtgNo(int addCtgNo) {
		this.addCtgNo = addCtgNo;
	}
	public String getAddCtgName() {
		return addCtgName;
	}
	public void setAddCtgName(String addCtgName) {
		this.addCtgName = addCtgName;
	}
	@Override
	public String toString() {
		return "AddCategoryVO [addCtgNo=" + addCtgNo + ", addCtgName=" + addCtgName + "]";
	}
}
