package com.it.apt.adminOwner.model;

import java.util.List;

import com.it.apt.adminFacility.model.AddCostVO;
import com.it.apt.apart.model.ApartVO;

public class OwnerIMPVO {
	private List<AddCostVO> addCostList;
	private ApartVO apartVo;
	private int payAmount;
	
	public ApartVO getApartVo() {
		return apartVo;
	}
	public void setApartVo(ApartVO apartVo) {
		this.apartVo = apartVo;
	}
	public List<AddCostVO> getAddCostList() {
		return addCostList;
	}
	public void setAddCostList(List<AddCostVO> addCostList) {
		this.addCostList = addCostList;
	}
	public int getPayAmount() {
		return payAmount;
	}
	public void setPayAmount(int payAmount) {
		this.payAmount = payAmount;
	}
	@Override
	public String toString() {
		return "OwnerIMPVO [addCostList=" + addCostList + ", apartVo=" + apartVo + ", payAmount=" + payAmount + "]";
	}
	
}
